const Storages = React.createClass({
  propTypes: {
    storages: React.PropTypes.array.isRequired,
    pin_src:  React.PropTypes.string.isRequired,
    car_src:  React.PropTypes.string.isRequired,
  },

  render() {
    const storages = this.props.storages.map((storage, index) => {
      return <Storage key={index} storage={storage} src={this.props.pin_src}/>
    });
    return(
      <div className="locations">
        {storages}
      </div>
    )
  }
});