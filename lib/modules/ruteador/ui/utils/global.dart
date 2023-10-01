import 'package:intl/intl.dart';

class Global {
//Paths
  static const assetalert  = "assets/images/images_ruteador/images/alert/";
  static const asseticons  = "assets/images/images_ruteador/images/icons/";
  static const assetroutermultimodal  = "assets/images/images_ruteador/images/router_multimodal/";
  static const urlClipp = "https://app.clipp.eco/clipp";

  static const messageerror = 'Estamos teniendo inconvenientes. Por favor inténtalo nuevamente.';
  static const statusOk = 1;
  static const statusError = -1;
  static const warningNotification = 2;
  static var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZFBlcnNvbiI6MTAsImlkZW50aWZpY2F0aW9uIjoiMTEwNTg2NDYyMSIsImZ1bGxuYW1lIjoiUm9ubnkgQ29udGVudG8iLCJuYW1lIjoiUm9ubnkiLCJsYXN0bmFtZSI6IkNvbnRlbnRvIiwiZW1haWwiOiJmcmVkZHlpdmFuOTNAZ21haWwuY29tIiwiaWRBY2NvdW50IjoyMiwidXNlcm5hbWUiOiJyZmNvbnRlbnRvIiwiYWN0aXZlIjp0cnVlLCJpbWFnZSI6IjE2NzgzNzE3ODA2NjQuanBnIiwicmVmcmVzaCI6ZmFsc2UsImNvdW50cnlDb2RlIjoiKzU5MyIsInJvbGUiOjMsImNlbGxwaG9uZSI6Ijk2NzI2NDQwMyIsImlzQmljaWJ1cyI6dHJ1ZSwiaXNDYXJwb29sIjp0cnVlLCJpc0Rpc2FibGVkIjpmYWxzZSwicHJpbmNpcGFsX3N0cmVldCI6IkF2ZW5pZGEgMTIgZGUgYWJyaWwiLCJzZWNvbmRhcnlfc3RyZWV0IjoiRmVkZXJpY28gbWFsbyIsImxhdGl0dWRlIjotMi45MDY0NjQxMTYxMTAxNzIsImxvbmdpdHVkZSI6LTc4Ljk5MDgyMDc2NTc4NjYsImdvb2dsZSI6ZmFsc2UsImlhdCI6MTY5MzM0Mzk2MiwiZXhwIjoxNjk0NjM5OTYyfQ.hEZKbwzZMSzBIiSUsekxd27rRh2n5aodGkHF4XDwZY8";
  static const idInvited = 0;
  static const targetWidth = 80;
  static const typeText = 1;
  static const typeNumber = 2;

  //fonts globales
  static const lettertitle = 'visby';
  static const lettersubtitle = 'visby';
  static const lettercomplementary = 'visby';
  static const lettercasespecial = 'visby';
  static const letternumberbold = 'visby';
  static const letternumber = 'visby';

  // Route Multimodal
  static const routeprincipal = 'PagePrincipal';
  static const routefeaturetrip = 'PageFeatureTrip';
  static const routefilter = 'PageFilter';
  static const routefilterBicycle = 'PageFilterBicycle';
  static const routesearchaddress = 'PageSearchAddres';

  //Fomaters
  static final formatYMd = DateFormat('yyyy-MM-dd');
  static final formatYMdHms = DateFormat('yyyy-MM-dd HH:mm');
  static final formatMdY = DateFormat('MM-dd-yyyy');
  static final formatHms = DateFormat('HH:mm:ss');
  static final formatHm = DateFormat('HH:mm');
  static final formatHhm = DateFormat("HH'h'mm");
}