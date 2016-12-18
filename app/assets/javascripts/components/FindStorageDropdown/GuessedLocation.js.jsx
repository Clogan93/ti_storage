const GuessedLocation = (props) => 
  <div className="guessed_and_view_all">
    <div className="guessed">{props.guessedLocation ? props.guessedLocation : 'No such location in US'}</div>
    <a href="/locations" className="view_all">View All Locations</a>
    <div className="clearfix"></div>
  </div>