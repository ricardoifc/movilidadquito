import 'dart:ui';

abstract class ApiInterfaceRouteMultimodal {
  Future responseDirectionCoordinate(double latitude, double longitude,
      VoidCallback? Function(int code, dynamic data) callback);

  Future responseDirectionSearch(String query, String city, String country,
      VoidCallback? Function(int code, dynamic data) callback);

  Future responseRecentQueries(
      int idUser, VoidCallback? Function(int code, dynamic data) callback);

  Future responseFavorite(
      int idUser, VoidCallback? Function(int code, dynamic data) callback);

  Future responseSaveFavorite(int placeId, int idUser,
      VoidCallback? Function(int code, dynamic data) callback);

  Future responseSaveLastSearch(int placeId, int idUser,
      VoidCallback? Function(int code, dynamic data) callback);

  Future responseDeleteFavorite(int placeId, int idUser,
      VoidCallback? Function(int code, dynamic data) callback);

  Future responseRoute(
      int numItineraries,
      double startLatitude,
      double startLongitude,
      double endLatitude,
      double endLongitude,
      String mode,
      String startTime,
      String startDate,
      String imei,
      int idUser,
      double maxWalkDistance,
      bool wheelchair,
      String optimize,
      double triangleTimeFactor,
      double triangleSlopeFactor,
      double triangleSafetyFactor,
      bool stateFilter,
      int idSector,
      VoidCallback? Function(int code, dynamic data) callback);

  Future responseDeleteRouteTemporal(int idUser, String imei,
      VoidCallback? Function(int code, dynamic data) callback);


  Future getVehicle(double latitud, double longitud, var zoom,
      VoidCallback? Function(int code, dynamic data) callback);

  Future responseServicios(
      int user,
      double? latitudOrigen,
      double? longitudOrigen,
      double? latitudDestino,
      double? longitudDestino,
      int? idSector,
      String? imei, VoidCallback? Function(int code, dynamic data) callback);
}
