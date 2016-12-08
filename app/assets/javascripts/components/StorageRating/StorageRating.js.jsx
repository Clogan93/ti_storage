const StorageRating = React.createClass({
  propTypes: {
    rating: React.PropTypes.number,
    starImg: React.PropTypes.string.isRequired
  },
  // image_tag 'common_elements/star.svg'

  render() {
    return(
      <div class="storage_rating">
        <span class="number">4.9</span>
        <span class="stars">
          
        </span>
        <span class="amount_of_reviews">(6)</span>
      </div>
    );
  }
});