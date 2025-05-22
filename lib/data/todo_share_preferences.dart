
import 'package:bloc_update/data/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoSharePreferences {
  Future<void> saveTodo(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);

    print('Saved todo with key: $key and value: $value');
  }

  Future<String?> getTodo(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> deleteTodo(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);

    print('Deleted todo with key: $key');
  }

  Future<void> clearAllTodos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<Map<String, String>> getAllTodos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys().fold<Map<String, String>>(
      {},
      (map, key) => map..[key] = prefs.getString(key)!,
    );
  }

}