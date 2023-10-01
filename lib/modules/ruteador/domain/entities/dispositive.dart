class Dispositive {
  String? _imei;

  Dispositive();

  String get imei => _imei!;

  set imei(String value) {
    _imei = value;
  }

  @override
  String toString() {
    return 'Dispositive{_imei: $_imei}';
  }
}
