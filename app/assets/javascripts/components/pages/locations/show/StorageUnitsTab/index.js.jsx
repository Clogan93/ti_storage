const sizes = [
  {
    title: 'all units'
  },
  {
    title: 'small',
    explanation: 'up to 50 Square Feet...',
    description: 'Our small storage units are up to 50 sq. ft. in size and is the equivalent of holding enough items that would fit in a studio to 1 bed. Belongings that can fit includes a full/queen mattress set, sofa and dining room set, plus a few boxes and smaller items.'
  },
  {
    title: 'medium',
    explanation: 'up to 150 Square Feet...',
    description: 'Organizing items in our medium units is similar to packing a 1 - 2-bedroom apartment. Holds typical household items and furniture, plus appliances, with room for boxes and extras.'
  },
  {
    title: 'large',
    explanation: 'up to 300 Square Feet...',
    description: 'A large unit accommodates items that are comparable to a 3 - 4-bedroom home. At this capacity units can hold bedroom sets, appliances, dining/living sets and office furniture.'
  },
  {
    title: 'x-large',
    explanation: 'over 300+ Square Feet...',
    description: 'Our premium sized units are custom sizes mostly for our commercial customers who have a lot of equipment or to excess inventory.'
  }
];

const Locations_Show_StorageUnitsTab = React.createClass({
  propTypes: {
    storageUnits: React.PropTypes.array.isRequired
  },

  render() {
    if ($(window).width() > 1000){
      return <Locations_Show_StorageUnitsTab_desktop sizes={sizes} storageUnits={this.props.storageUnits}/>
    } else {
      return <Locations_Show_StorageUnitsTab_mobile sizes={sizes} storageUnits={this.props.storageUnits}/>
    }
  }
});
