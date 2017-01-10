const FindStorageDropdown = React.createClass({
  propTypes: {
    storages: React.PropTypes.array.isRequired
  },

  getInitialState() {
    return {
      modalIsOpen: false,
      currentGuessedLocation: null,
      closestStorages: []
    };
  },

  componentDidMount() {
    if (window.location.pathname === '/search'){
      this.refs.input.value = currentQueryString();
    }
  },

  autocompleteLocation(text) {
    // TODO is there some API from googlemaps that
    // lets us return only postal codes?
    // https://developers.google.com/maps/documentation/javascript/places-autocomplete
    // { types: ['(regions)'] } looks like it, but I'm unsure on how to use it.
    const options = {
      input: text,
      componentRestrictions: {
        country: 'us' // return only those within US
      },
      // ...text.length === 5 && { types: ['(regions)'] }
    };

    const service = new google.maps.places.AutocompleteService;
    service.getPlacePredictions(options,
    (result) => { 
      if (result === null) { // no locations found
        this.setState({
          currentGuessedLocation: null,
          closestStorages: []
        });
      } else {
        const currentGuessedLocation = result[0].description;
        this.setState({ currentGuessedLocation });
        this.findNearestStorages(currentGuessedLocation);
      }
    })
  },

  findNearestStorages(origin) {
    findNearestStorages(origin, this.props.storages,
      (closestStorages) => this.setState({ closestStorages }),
      (error) => console.log({ error })
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

  onFocus() {
    // if browser doesn't supports geolocation
    if (!navigator.geolocation) { return }
    // if location has already been guessed once
    if (this.state.currentGuessedLocation) { return }
    // if something's already searched for (happens when we go to url with ?origin)
    if (this.refs.input.value.length > 0) { return }

    navigator.geolocation.getCurrentPosition((position) => {
      const { latitude, longitude } = position.coords;
      findAddressByCoordinates(latitude, longitude, (address) => {
        this.refs.input.value = address;
        this.setState({ modalIsOpen: true });
        this.autocompleteLocation(address);
      });
    });
  },

  onKeyPress(event) {
    if(event.key == 'Enter'){ this.refs.link_to_search_page.click(); }
  },

  render() {
    const searchValue = this.state.currentGuessedLocation;
    const href = searchValue ? encodeURI("/search?" + searchValue) : '/search';

    return(
      <section className="find_storage_dropdown">
        <div className={ this.state.modalIsOpen ? "dropdown open" : "dropdown" }>
          <div className="dropdown-menu">
            <GuessedLocation guessedLocation={this.state.currentGuessedLocation}/>

            <Storages storages={this.state.closestStorages}/>

            <div className="reserve_today">
              Reserve storage today and get your first month free!
            </div>
          </div>
        </div>

        <input ref="input" type="text" placeholder="City, Zip Code" className="form-control" onChange={this.somethingIsTyped} onFocus={this.onFocus} onKeyPress={this.onKeyPress}/>

        <a ref="link_to_search_page" href={href} className="button blue search">Search</a>
      </section>
    );
  }
});
