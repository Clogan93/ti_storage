const CommonFieldset = {
  changeCurrentCustomer(event){
    this.setState({
      isCurrentCustomer: event.target.value == 'Yes' ? true : false
    }, this.state.didTryToSendEmail ? this.validate : null);
  },

  _renderIsCurrentCustomerRadio(value){
    // (name="any" is needed for it to function as a radio)
    return <label className="custom-control custom-radio">
      <input name="isCurrentCustomer" type="radio" className="custom-control-input" value={value} onChange={this.changeCurrentCustomer}/>
      <span className="custom-control-indicator"></span>
      <span className="custom-control-description">{value}</span>
    </label>
  },

  _renderInput(type, ref){
    return <div className={'input_and_error ' + ref}>
      <input type={type} ref={ref} placeholder={ref} onChange={this.state.didTryToSendEmail ? this.validate : null}/>
      {this.__renderError(ref)}
    </div>
  },

  __renderError(ref){
    if (this.state.didTryToSendEmail){
      return <div className="error">{ this.state.errors[ref]}</div>
    }
  },

  renderCommonFieldset(){
    return <fieldset className="common">
      {this._renderInput('text', 'name')}
      {this._renderInput('email', 'email')}
      {this._renderInput('text', 'phone')}

      <div className="is_current_customer">
        <div>Are you a current customer? *</div>
        {this._renderIsCurrentCustomerRadio('Yes')}
        {this._renderIsCurrentCustomerRadio('No')}
        {this.__renderError('isCurrentCustomer')}
      </div>
    </fieldset>
  }
};

const YesOrNoFieldset = {
  __renderMessageTextarea(){
    return <label className="message">
      Message (250 character limit)
      <textarea ref="message"></textarea>
    </label>
  },

  __renderSelect(question, ref, options){
    const optionTags = options.map((source, index) =>
      <option key={index} value={source}>{source}</option>
    );

    return <div className="question">
      <label>{question}</label>

      <select ref={ref} className="custom-select">
        <option value="Please Select">Please Select</option>
        {optionTags}
      </select>
    </div>
  },

  _renderIsCurrentCustomerYesFieldset(){
    return <fieldset className="is_current_customer_yes">
      {this.__renderSelect('Where do you store with us?', 'storage_used', this.props.storages.map(s => s.title))}
      {this.__renderMessageTextarea()}
    </fieldset>
  },

  _renderIsCurrentCustomerNoFieldset(){
    return <fieldset className="is_current_customer_no">
      {this.__renderSelect('How did you hear about us?', 'where_from_heard_about_us', ['TV Commercial', 'Subway Ad', 'Google Search', 'Referral', 'Other'])}
      {this.__renderMessageTextarea()}
    </fieldset>
  },

  renderYesOrNoFieldset(){
    switch (this.state.isCurrentCustomer){
      case true:
        return this._renderIsCurrentCustomerYesFieldset()
      case false:
        return this._renderIsCurrentCustomerNoFieldset()
      case null:
        return null;
    }
  }
};

const SendButton = {
  _renderSendButton(){
    switch(this.state.sendButtonStatus){
      case 'sending':
        return <a className="button blue sending">
          <i className="fa fa-circle-o-notch fa-spin"></i>
        </a>
      case 'active':
        return <a className="button blue active" onClick={this.sendEmail}>Send</a>
      case 'disabled':
        return  <a className="button blue disabled" onClick={this.vainlyTryToSendEmail}>Send</a>
    }
  },

  _renderApiResponse(){
    const apiResponse = this.state.apiResponse;
    if (apiResponse){
      return <div className="api_response">{apiResponse}</div>
    }
  },

  renderSendFieldset(){
    return(
      <fieldset className="send">
        {this._renderSendButton()}
        {this._renderApiResponse()}
      </fieldset>
    )
  }
}

const StaticPages_Contact_ContactForm = React.createClass({
  // not in different files because our build process doesn't have imports (=> we can't define mixin in some other file)
  // not subdivided into components because that actually makes it less manageable
  mixins: [CommonFieldset, YesOrNoFieldset, SendButton],

  getInitialState(){
    return {
      errors: {},
      sendButtonStatus: 'disabled', // 'active', 'sending'
      apiResponse: null,
      isCurrentCustomer: null, // true/false
      didTryToSendEmail: false
    }
  },

  validate(){
    console.log('validates')
    const errors = {};

    if (this.refs.name.value.length < 2){
      errors['name'] = 'Name should be longer';
    }

    const emailRegex = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
    if (!emailRegex.test(this.refs.email.value)){
      errors['email'] = "Email doesn't look like an email";
    }

    if (this.state.isCurrentCustomer === null){
      errors['isCurrentCustomer'] = "Please choose";
    }

    if (Object.keys(errors).length === 0){
      this.setState({ errors, sendButtonStatus: 'active' });
      return true;
    } else {
      this.setState({ errors, sendButtonStatus: 'disabled' });
      return false;
    }
  },

  vainlyTryToSendEmail(){
    this.setState({ didTryToSendEmail: true });
    this.validate();
  },

  sendEmail(){
    this.setState({ sendButtonStatus: 'sending' });

    const isCurrentCustomer = this.state.isCurrentCustomer;
    const options = isCurrentCustomer ?
      { storage_used: this.refs.storage_used.value } :
      { where_from_heard_about_us: this.refs.where_from_heard_about_us.value };

    $.ajax({
      url: "/emails/send_contact_email",
      type: "POST",
      data: {
        ...options,
        name: this.refs.name.value,
        email: this.refs.email.value,
        phone: this.refs.phone.value,
        is_current_customer: isCurrentCustomer,
        message: this.refs.message.value,
      },
      success: () => {
        this.setState({
          apiResponse: "Message recieved, we'll answer to you shortly",
          sendButtonStatus: 'disabled'
        });
      },
      error: (error) => {
        console.log(error);
        this.setState({
          apiResponse: error.responseJSON,
          sendButtonStatus: 'disabled'
        });
      }
    });
  },

  render(){
    return <form>
      {this.renderCommonFieldset()}
      {this.renderYesOrNoFieldset()}
      {this.renderSendFieldset()}
    </form>
  }
});
