import 'package:movilidadquito/modules/ruteador/domain/entities/person.dart';

abstract class LocalRepositoryInterface {
   Future saveUser(DataPerson user);
   Future<DataPerson?> getUser();
   Future deleteUser();
   Future saveStatusNotification(bool status);
   Future<bool?> getStatusNotification();
   Future deleteStatusNotification();
   Future deleteTravel();
   Future saveNewNotification(bool status);
   Future<bool?> getNewNotification();
   Future deleteNewNotification();
   Future saveFilterRange(double range);
   Future<double?> getRangeFilter();

}