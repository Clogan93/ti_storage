const Storage = React.createClass({
  propTypes: {
    storage: React.PropTypes.object.isRequired,
    src:     React.PropTypes.string.isRequired
  },

  render() {
    const storage = this.props.storage;

    return(
      <a className="location" href={`/${storage.slug}`}>
        <div className="row">
          <div className="col-xs-8 name">
            <img src={this.props.src}/>
            <span>{`${storage.area} ${storage.address}`}</span>
          </div>
          <div className="col-xs-4 text-xs-right comment grey red">
            XL Unit - 50% off!
          </div>
        </div>
      </a>
    );
  }
});