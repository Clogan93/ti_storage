// {
//   distance: {
//     text: "1,805 km"
//     value: 1805222 ---- in meters
//   }
//   duration: Object
//   status: "OK"
// }
const googleDistanceToMiles = (distanceToOriginObject) => {
  if (!distanceToOriginObject || distanceToOriginObject.status !== 'OK'){ return '?' }
  const meters = distanceToOriginObject.distance.value;
  const miles = meters * 0.000621371;

  const roundTo = 10;
  const roundedMiles = Math.round(miles * roundTo)/roundTo;
  return roundedMiles
}
