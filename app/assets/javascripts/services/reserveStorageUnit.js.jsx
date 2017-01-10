const reserveStorageUnit = (id) => {
  $.ajax({
    url: `/storage_units/${id}/reserve`,
    type: "POST"
  });
}
