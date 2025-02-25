import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
    });
    await _safeInitAsync(() async {
      _direccion = await secureStorage.getString('ff_direccion') ?? _direccion;
    });
    await _safeInitAsync(() async {
      _ncard = await secureStorage.getString('ff_ncard') ?? _ncard;
    });
    await _safeInitAsync(() async {
      _servicio = await secureStorage.getString('ff_servicio') ?? _servicio;
    });
    await _safeInitAsync(() async {
      _userRole = await secureStorage.getString('ff_userRole') ?? _userRole;
    });
    await _safeInitAsync(() async {
      _date = (await secureStorage.getStringList('ff_date'))
              ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
              .toList() ??
          _date;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    secureStorage.setString('ff_email', value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  String _direccion = '';
  String get direccion => _direccion;
  set direccion(String value) {
    _direccion = value;
    secureStorage.setString('ff_direccion', value);
  }

  void deleteDireccion() {
    secureStorage.delete(key: 'ff_direccion');
  }

  String _ncard = '';
  String get ncard => _ncard;
  set ncard(String value) {
    _ncard = value;
    secureStorage.setString('ff_ncard', value);
  }

  void deleteNcard() {
    secureStorage.delete(key: 'ff_ncard');
  }

  String _servicio = '';
  String get servicio => _servicio;
  set servicio(String value) {
    _servicio = value;
    secureStorage.setString('ff_servicio', value);
  }

  void deleteServicio() {
    secureStorage.delete(key: 'ff_servicio');
  }

  int _number = 0;
  int get number => _number;
  set number(int value) {
    _number = value;
  }

  String _userRole = '';
  String get userRole => _userRole;
  set userRole(String value) {
    _userRole = value;
    secureStorage.setString('ff_userRole', value);
  }

  void deleteUserRole() {
    secureStorage.delete(key: 'ff_userRole');
  }

  List<DateTime> _date = [];
  List<DateTime> get date => _date;
  set date(List<DateTime> value) {
    _date = value;
    secureStorage.setStringList('ff_date',
        value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void deleteDate() {
    secureStorage.delete(key: 'ff_date');
  }

  void addToDate(DateTime value) {
    date.add(value);
    secureStorage.setStringList('ff_date',
        _date.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeFromDate(DateTime value) {
    date.remove(value);
    secureStorage.setStringList('ff_date',
        _date.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeAtIndexFromDate(int index) {
    date.removeAt(index);
    secureStorage.setStringList('ff_date',
        _date.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void updateDateAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    date[index] = updateFn(_date[index]);
    secureStorage.setStringList('ff_date',
        _date.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void insertAtIndexInDate(int index, DateTime value) {
    date.insert(index, value);
    secureStorage.setStringList('ff_date',
        _date.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
