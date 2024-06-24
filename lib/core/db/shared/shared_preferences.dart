import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static StorageRepository? _storageUtil;
  static SharedPreferences? _preferences;

  // Stream controller to broadcast preference changes
  static final StreamController<String> _preferenceChangeController =
      StreamController<String>.broadcast();

  // Stream getter to listen for preference changes
  static Stream<String> get preferenceChangeStream =>
      _preferenceChangeController.stream;

  static Future<StorageRepository> getInstance() async {
    if (_storageUtil == null) {
      final secureStorage = StorageRepository._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageRepository._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /////// LIST

  static List<String> getList(String key, {List<String> defValue = const []}) {
    if (_preferences == null) return List.empty(growable: true);
    return _preferences!.getStringList(key) ?? List.empty(growable: true);
  }

  static Future<bool>? putList(String key, List<String> value) {
    if (_preferences == null) return null;
    return _preferences!.setStringList(key, value);
  }

  static Future<bool>? updateList(String key, List<String> value) {
    if (_preferences == null) return null;
    return _preferences!.setStringList(key, value);
  }

  static Future<bool>? deleteList(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  // Save List<bool>
  static Future<bool>? putBoolList(String key, List<bool> value) {
    if (_preferences == null) return null;
    List<String> boolStrings =
        value.map((boolValue) => boolValue.toString()).toList();
    return _preferences!.setStringList(key, boolStrings);
  }

  // Get List<bool>
  static List<bool> getBoolList(String key, {List<bool> defValue = const []}) {
    if (_preferences == null) return defValue;
    List<String>? boolStrings = _preferences!.getStringList(key);
    if (boolStrings == null) return defValue;
    return boolStrings.map((boolString) => boolString == 'true').toList();
  }

  // Delete List<bool>
  static Future<bool>? deleteBoolList(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  // save List<double>
  static Future<bool>? putdoubleList(String key, List<double> value) {
    if (_preferences == null) return null;
    List<String> doubleStrings =
        value.map((doubleValue) => doubleValue.toString()).toList();
    return _preferences!.setStringList(key, doubleStrings);
  }

  // Get List<double>
  static List<double> getdoubleList(String key,
      {List<double> defValue = const []}) {
    if (_preferences == null) return defValue;
    List<String>? doubleStrings = _preferences!.getStringList(key);
    if (doubleStrings == null) return defValue;
    return doubleStrings
        .map((doubleString) => double.parse(doubleString))
        .toList();
  }

  // Delete List<double>
  static Future<bool>? deletedoubleList(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  /////// STRING

  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }

  static Future<bool?>? putString(String key, String value) async {
    if (_preferences == null) return null;
    Future<bool> success = _preferences!.setString(key, value);
    if (await success) {
      // Notify listeners that a preference has changed
      _preferenceChangeController.add(key);
    }
    return Future.value(success);
  }

  static Future<bool?>? deleteString(String key) async {
    if (_preferences == null) return null;
    Future<bool> success = _preferences!.remove(key);
    if (await success) {
      // Notify listeners that a preference has changed
      _preferenceChangeController.add(key);
    }
    return Future.value(success);
  }

  /// INT
  static int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getInt(key) ?? defValue;
  }

  static Future<bool?>? putInt(String key, int value) async {
    if (_preferences == null) return null;
    Future<bool> success = _preferences!.setInt(key, value);
    if (await success) {
      // Notify listeners that a preference has changed
      _preferenceChangeController.add(key);
    }
    return Future.value(success);
  }

  static Future<bool?>? deleteInt(String key) async {
    if (_preferences == null) return null;
    Future<bool> success = _preferences!.remove(key);
    if (await success) {
      // Notify listeners that a preference has changed
      _preferenceChangeController.add(key);
    }
    return Future.value(success);
  }

  ///// DOUBLE

  static double getDouble(String key, {double defValue = 0.0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getDouble(key) ?? defValue;
  }

  static Future<bool?>? putDouble(String key, double value) async {
    if (_preferences == null) return null;
    Future<bool> success = _preferences!.setDouble(key, value);
    if (await success) {
      // Notify listeners that a preference has changed
      _preferenceChangeController.add(key);
    }
    return Future.value(success);
  }

  static Future<bool?>? deleteDouble(String key) async {
    if (_preferences == null) return null;
    Future<bool> success = _preferences!.remove(key);
    if (await success) {
      // Notify listeners that a preference has changed
      _preferenceChangeController.add(key);
    }
    return Future.value(success);
  }

  //////////  BOOLEAN

  static bool getBool(String key, {bool defValue = false}) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  static Future<bool?>? putBool(String key, bool value) async {
    if (_preferences == null) return null;
    Future<bool> success = _preferences!.setBool(key, value);
    if (await success) {
      // Notify listeners that a preference has changed
      _preferenceChangeController.add(key);
    }
    return Future.value(success);
  }

  static Future<bool?>? deleteBool(String key) async {
    if (_preferences == null) return null;
    Future<bool> success = _preferences!.remove(key);
    if (await success) {
      // Notify listeners that a preference has changed
      _preferenceChangeController.add(key);
    }
    return Future.value(success);
  }
}
