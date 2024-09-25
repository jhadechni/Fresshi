import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<T?> retrieveData<T>(String key) async {
    dynamic value;
    final type = T.toString();
    switch (type) {
      case 'bool':
        value = _sharedPreferences!.getBool(key);
        logInfo("LocalPreferences getBool with key $key got $value");
        break;
      case 'double':
        value = _sharedPreferences!.getDouble(key);
        break;
      case 'int':
        value = _sharedPreferences!.getInt(key);
        break;
      case 'String':
        value = _sharedPreferences!.getString(key);
        break;
      case 'List<String>':
        value = _sharedPreferences!.getStringList(key);
        break;
      default:
        logError("Type $type is not supported for key $key");
        return null;
    }
    return value as T?;
  }

  Future<void> storeData<T>(String key, T value) async {
    final type = T.toString();
    switch (type) {
      case 'bool':
        _sharedPreferences!.setBool(key, value as bool);
        logInfo("LocalPreferences setBool with key $key got $value");
        break;
      case 'double':
        _sharedPreferences!.setDouble(key, value as double);
        break;
      case 'int':
        _sharedPreferences!.setInt(key, value as int);
        break;
      case 'String':
        _sharedPreferences!.setString(key, value as String);
        break;
      case 'List<String>':
        _sharedPreferences!.setStringList(key, value as List<String>);
        break;
      default:
        logError("Type $type is not supported for key $key");
        break;
    }
  }
}
