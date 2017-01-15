const Storage = React.createClass({
  propTypes: {
    storage: React.PropTypes.object.isRequired,
    src:     React.PropTypes.string.isRequired
  },

  render() {
    const storage = this.props.storage;

    return(
      <a className="storage" href={storage.url}>
        <div className="address">
          <img src={this.props.src}/>
          <span>{storage.city}, {storage.state} {storage.address_1}</span>
        </div>
        <div className="comment grey red">
          50% off!
        </div>
      </a>
    );
  }
});
