class LocationModel {
  final lat, lon;

  LocationModel(this.lat, this.lon);

  static LocationModel locationItems(Map<String, double> location) {
    double lat = location['latitude'];
    double lon = location['longitude'];
    
    return LocationModel(lat, lon);
  }
}
