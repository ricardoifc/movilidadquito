class GlobalUrl{
  // static const generallink="http://129.80.155.71:3000/";
  //static const generallink="http://129.80.155.71:6000/"; // Desarrollo
  static const generallink="http://164.92.108.227:3000/"; // Nueva ip
  //enter service count
  static const createCountService="api/person-service/create";

  //parking
  static const urlimageglobal  = "https://moverudev.kradac.com/serviceimg/";
  static const urlimageuser  = "${urlimageglobal}uploads/users/";
  static const refreshtoken="api/auth/refresh-token";

  //Clipp Ruteador
  // Busarcar direccion por nombres
  static const getdirecctionsearch = 'api/address/by-query';
  //Buscar direccion por cordenadas
  static const getdirecctioncoordenate = 'api/address/by-coordinates';
  //Buscar direccion por usuario
  static const getrecentqueries = 'api/address/all-by-user/';
  // Guardame la direccion anterior
  static const savelastsearch = 'api/address/create';


  //Favorite Ruta
  static const savefavorite = 'api/favorite-address/create';
  static const getfavorite = 'api/favorite-address/all-by-user/';
  static const savedeletefavorite = 'api/favorite-address/disable';

  //Ruteador
  //Buscar la mejor ruta
  static const getroute = 'api/route/search';
  //Eliminar ruta
  static const deleteroutetemporal = 'api/route/delete';
  //Post Rutas con tarifas
  static const postroutefee = 'api/route/search-financial';
  static const saveroute = 'api/route-planning-favorite/create';
  static const getroutetravel = "api/route-planning-favorite/";
  static const getvehiclenearby = "https://ktaxifacilsegurorapido.kradac.com/servicios/vehiculos/";
  static const postservicios ="http://testktaxi.kradac.com:91/c/sector/servicios";
}