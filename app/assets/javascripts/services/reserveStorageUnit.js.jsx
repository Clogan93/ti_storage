const reserveStorageUnit = (unit) => {
  $.ajax({
    url: unit.reserve_path,
    type: "POST"
  });
}
