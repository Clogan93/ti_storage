const currentQueryString = () => {
  const queryString = window.location.search.replace("?", '');
  return decodeURI(queryString);
}
