const StaticPages_Contact_ContactForm = React.createClass({

  

  getInitialState(){
    return {
      errors: {},
      sendButtonStatus: 'disabled', // 'active', 'sending'
      apiResponse: null,
      isCurrentCustomer: null
    }
  },

  validate(){
    const errors = {};

    if (this.refs.name.value.length < 2){
      errors['name'] = 'Name should be longer';
    }

    const emailRegex = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
    if (!emailRegex.test(this.refs.email.value)){
      errors['email'] = "Email doesn't look like an email";
    }

    console.log(this.state.isCurrentCustomer)
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

  sendEmail(){
    if (!this.validate()) { return };

    this.setState({ sendButtonStatus: 'sending' });
    $.ajax({
      url: "/emails/send_sign_up_for_emails_email",
      type: "POST",
      data: { 
        name: this.refs.name.value,
        email: this.refs.email.value
      },
      success: () => {
        this.setState({
          apiResponse: "You've successfully subscibed.",
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

  renderApiResponse(){
    apiResponse = this.state.apiResponse;

    if (apiResponse){
      return <div className="api_response">{this.state.apiResponse}</div>
    }
  },

  changeCurrentCustomer(event){
    this.setState({ isCurrentCustomer: event.target.value }, this.validate());
  },

  renderCommonFieldset(){
    const errors = this.state.errors;
    return <fieldset className="common">
      <input type="text" ref="name" placeholder="Name*" className="name" onChange={this.validate}/>
      <div className="errors">{errors.name}</div>

      <input type="email" ref="email" placeholder="Email*" className="email" onChange={this.validate}/>
      <div className="errors">{errors.email}</div>

      <input type="text" ref="phone" placeholder="Phone Number" className="phone" onChange={this.validate}/>

      <div className="is_current_customer">
        <div>Are you a current customer? *</div>
        {this._renderIsCurrentCustomerRadio('Yes')}
        {this._renderIsCurrentCustomerRadio('No')}
        <div className="errors">{errors.isCurrentCustomer}</div>
      </div>
    </fieldset>
  },

  _renderIsCurrentCustomerRadio(value){
    return <label className="custom-control custom-radio">
      <input name="isCurrentCustomer" type="radio" className="custom-control-input" value={value} onChange={this.changeCurrentCustomer}/>
      <span className="custom-control-indicator"></span>
      <span className="custom-control-description">{value}</span>
    </label>
  },

  renderYesOrNoFieldset(){
    switch (this.state.isCurrentCustomer){
      case 'Yes':
        return this._renderIsCurrentCustomerYesFieldset()
      case 'No':
        return this._renderIsCurrentCustomerNoFieldset()
      case null:
        return null;
    }
  },

  _renderIsCurrentCustomerYesFieldset(){
    const options = this.props.storages.map((storage, index) =>
      <option key={index} value={storage.title}>
        {storage.title}
      </option>
    );
    return <fieldset className="is_current_customer_yes">
      <div className="question">
        <label>Where do you store with us?</label>
        <select className="custom-select">
          <option value="Please Select">Please Select</option>
          {options}
        </select>
      </div>

      <label className="message">Message (250 character limit)
        <textarea name="message"></textarea>
      </label>
    </fieldset>
  },

  _renderIsCurrentCustomerNoFieldset(){
    const options = ['Please Select', 'TV Commercial', 'Subway Ad', 'Google Search', 'Referral', 'Other'].map((source, index) =>
      <option key={index} value={source}>{source}</option>
    );
    return <fieldset className="is_current_customer_no">
      <div className="question">
        <label>How did you hear about us?</label>

        <select className="custom-select">
          {options}
        </select>
      </div>

      <label className="message">Message (250 character limit)
        <textarea name="message"></textarea>
      </label>
    </fieldset>
  },



  renderSendButton(){
    switch(this.state.sendButtonStatus){
      case 'sending':
        return <a className="button blue sending">
          <i className="fa fa-circle-o-notch fa-spin"></i>
        </a>
      case 'active':
        return <a className="button blue active" onClick={this.sendEmail}>Send</a>
      case 'disabled':
        return  <a className="button blue disabled">Send</a>
    }
  },

  render(){
    console.log(this.state)
    return <form>
      {this.renderCommonFieldset()}
      {this.renderYesOrNoFieldset()}

      <fieldset className="send_and_required_field">
        {this.renderSendButton()}
        <span>* Required field</span>
      </fieldset>
    </form>
  }
});
