const FetchableStorageRating = React.createClass({
  propTypes: {
    placeId: React.PropTypes.string.isRequired,
    numberIsDisplayed: React.PropTypes.bool.isRequired
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
      this.props.placeId,
      (place) => {
        this.setState({ rating: place.rating });
      },
      (error) => { console.log(error) }
    )
  },

  render() {
    const rating = this.state.rating;
    if (rating){
      return(
        <StorageRating rating={this.state.rating} numberIsDisplayed={this.props.numberIsDisplayed}/>
      );
    } else { return null }
  }
});
