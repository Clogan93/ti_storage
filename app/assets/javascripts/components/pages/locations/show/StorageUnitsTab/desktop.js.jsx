const Locations_Show_StorageUnitsTab_desktop = React.createClass({

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

  renderSizeOptions() {
    const sizes = this.props.sizes.map((size, key) => {
      const activeClass = (size.title === this.state.currentSizeFilter) ? 'active' : '';
      return <div key={key} className={"size_option " + activeClass} onClick={() => this.filterForSize(size.title)}>
        <div className="size">{size.title}</div>
        <div className="description">{size.explanation}</div>
      </div>
    });
    return <div className="size_options">
      {sizes}
    </div>
  },

  renderStorageUnits() {
    const units = this.state.filteredStorageUnits.map((unit, key) =>
      <StorageUnit_desktop key={key} storageUnit={unit}/>
    );

    return <div className="table_body">
      {units}
    </div>
  },

  render() {
    return <div className="storage_units_tab desktop">
      <section className="select_size_and_sizing_guide">
        <div className="select_size">
          <h3 className="blue_heading">Select size</h3>
          <p>Treasure Island Storage units are in accordance to industry standard sizes. The dimensions are displayed  with width, depth, and if noted, height.</p>

          {this.renderSizeOptions()}
        </div>

        <SizingGuidePreview/>
      </section>

      <section className="table_of_storage_units">
        <div className="table_head">
          <section className="size">Size</section>
          <section className="features">Features</section>
          <section className="unit_monthly_price">Monthly price</section>
        </div>
        {this.renderStorageUnits()}
      </section>
    </div>
  }
});
