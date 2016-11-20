const Storage = React.createClass({
  propTypes: {
    storage: React.PropTypes.object.isRequired,
    src:     React.PropTypes.string.isRequired
  },

  render() {
    const prettyAddress = this.props.storage.area + ' ' + this.props.storage.address
    return (
      <a className="location">
        <div className="row">
          <div className="col-xs-8 name">
            <img src={this.props.src}/>
            <span>{prettyAddress}</span>
          </div>
          <div className="col-xs-4 text-xs-right comment grey red">
            XL Unit - 50% off!
          </div>
        </div>
      </a>
    );
  }
});