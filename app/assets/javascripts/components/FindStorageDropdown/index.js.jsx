const FindStorageDropdown = React.createClass({
  propTypes: {
    storages: React.PropTypes.array.isRequired,
    pin_src:  React.PropTypes.string.isRequired,
    car_src:  React.PropTypes.string.isRequired,
  },

  getInitialState() {
    return {
      modalIsOpen: false,
      currentGuessedLocation: null,
      closestStorages: []
    };
  },

  autocompleteLocation(text) {
    const service = new google.maps.places.AutocompleteService
    service.getPlacePredictions({
      input: text,
      componentRestrictions: {
        country: 'us' // return only those within US
      }
    },
    (result) => { 
      if (result === null) { // no locations found
        this.setState({
          currentGuessedLocation: null,
          closestStorages: []
        })
      } else {
        const currentGuessedLocation = result[0].description;
        this.setState({ currentGuessedLocation });
        this.findNearestStorages(currentGuessedLocation);
      }
    })
  },

  findNearestStorages(origin) {
    const destinations = this.props.storages.map((storage) => 
      new google.maps.LatLng(...storage.coordinates)
    );

    const service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix({
        origins: [origin],
        destinations: destinations,
        travelMode: 'DRIVING'
      },
      (result, status) => {
        if (status === "OK"){
          const closestStorages = result.rows[0].elements
            .map((el, index) => ({ ...this.props.storages[index], element: el }))
            .filter((destination) => destination.element.status === 'OK')
            .sort((a, b) => a.element.distance.value - b.element.distance.value);
          this.setState({ closestStorages });
        } else { console.log({ status }) }
      }
    );
  },

  somethingIsTyped(e) {
    const value = e.target.value;
    if (value.length === 0 && this.state.modalIsOpen) {
      this.setState({ modalIsOpen: false });
    } else if (value.length > 0 && !this.state.modalIsOpen) {
      this.setState({ modalIsOpen: true });
    }

    if (value.length > 0) {
      this.autocompleteLocation(value);
    }
  },

  render() {
    return(
      <div>
        <input type="text" placeholder="City, Zip Code" className="form-control find_storage_input" onChange={this.somethingIsTyped}/>

        <div className={ this.state.modalIsOpen ? "dropdown open" : "dropdown" }>
          <div className="dropdown-menu">
            <GuessedLocation guessedLocation={this.state.currentGuessedLocation}/>

            <Storages storages={this.state.closestStorages} pin_src={this.props.pin_src} car_src={this.props.car_src}/>

            <div className="reserve_today">
              Reserve storage today and get your first month free!
            </div>
          </div>
        </div>
      </div>
    );
  }
});