// ignore_for_file: prefer_typing_uninitialized_variables

class CachingServices {
  CachingServices(this.preferences) {
    preferences = preferences;
  }

  late var preferences;

  // save string
  saveString({required String key, required String value}) {
    preferences.put(key, value);
  }

  // save integer
  saveInteger({required String key, required int value}) {
    preferences.put(key, value);
  }

  // save double
  saveDouble({required String key, required double value}) {
    preferences.put(key, value);
  }

  // save boolean
  saveBoolean({required String key, required bool value}) {
    preferences.put(key, value);
  }

  // save list
  saveList({required String key, required dynamic list}) {
    preferences.put(key, list);
  }

  // get data
  getSaveData({required String key}) {
    return preferences.get(key);
  }

  // delete data
  deleteData({required String key}) {
    preferences.delete(key);
  }

  // save map data
  saveFromMap({required Map<String, dynamic> map}) {
    for (var key in map.keys) {
      if (map[key]!.runtimeType == int) {
        saveInteger(key: key, value: map[key]);
      } else if (map[key]!.runtimeType == double) {
        saveDouble(key: key, value: map[key]);
      } else if (map[key]!.runtimeType == bool) {
        saveBoolean(key: key, value: map[key]);
      } else if (map[key]!.runtimeType == String) {
        saveString(key: key, value: map[key]);
      }
    }
  }
}
