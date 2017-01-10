const Locations_Show_StorageUnitsTab_mobile = React.createClass({

  propTypes: {
    sizes: React.PropTypes.array.isRequired,
    storageUnits: React.PropTypes.array.isRequired
  },

  getInitialState(){
    return {
      filteredStorageUnits: this.props.storageUnits,
      currentSizeFilter: 'all units'
    }
  },

  filterForSize(sizeTitle){
    const filteredStorageUnits = this.props.storageUnits.filter((unit) => {
      return (sizeTitle == 'all units') ? true : unit.size_in_text === sizeTitle
    });

    this.setState({
      currentSizeFilter: sizeTitle,
      filteredStorageUnits
    });
  },

  renderDropdownMenu() {
    const options = this.props.sizes.map((size, key) =>
      <a key={key} className="dropdown-item" onClick={() => this.filterForSize(size.title)}>{size.title}</a>
    );

    return <div className="dropdown-menu">
      {options}
    </div>
  },

  renderStorageUnits() {
    const units = this.state.filteredStorageUnits.map((unit, key) =>
      <StorageUnit_mobile key={key} storageUnit={unit}/>
    );

    return <section className="storage_units">
      {units}
    </section>
  },

  render() {
    return <div className="storage_units_tab mobile">
      <section className="select_size_and_sizing_guide">
        <div className="lable">Select Size</div>
        <div className="dropdown">
          <div className="dropdown-toggle" data-toggle="dropdown">
            {this.state.currentSizeFilter}
          </div>

          {this.renderDropdownMenu()}
        </div>
        <SizingGuidePreview/>
      </section>

      {this.renderStorageUnits()}
    </div>
  }

});