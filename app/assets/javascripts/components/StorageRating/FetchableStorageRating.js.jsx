// can be used in both reviews and in common storage rating
const FetchableStorageRating = React.createClass({
  propTypes: {
    placeId: React.PropTypes.string.isRequired,
    starImg: React.PropTypes.string.isRequired
  },

  getInitialState() {
    return {
      rating: this.props.rating
    };
  },

  componentDidMount() {
    this.fetchStorageRating();
  },

  fetchStorageRating() {
    getPlaceDetails(
      this.props.storage.place_id,
      (place) => {
        this.setState({ rating: place.rating });
      },
      (error) => { console.log(error) }
    )
  },

  render() {
    return(
      <StorageRating rating={this.state.rating} starImg={1}/>
    );
  }
});