
import 'dart:convert';

import 'package:bloc_update/data/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoSharePreferences {
  Future<void> saveTodo(String key, Todo value) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(value.toJson());
    await prefs.setString(key, jsonString);

    print('Saved todo with key: $key and value: $jsonString');
  }

  Future<Todo?> getTodo(String key) async {
    print('Getting todo with key: $key');
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    return value?.isNotEmpty == true ? Todo.fromJson(jsonDecode(value!)) : null;
  }

  Future<void> deleteTodo(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);

    print('Deleted todo with key: $key');
  }

  Future<void> clearAllTodos() async {
    print('Clearing all todos');
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<List<Todo>> getAllTodos() async {
    print('Getting all todos');
    final prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys();
    final todos = <Todo>[];

    for (final key in keys) {
      print('Key: $key');
      final jsonString = prefs.getString(key);
      if (jsonString?.isNotEmpty == true) {
        try {
          final jsonMap = jsonDecode(jsonString!) as Map<String, dynamic>;
          todos.add(Todo.fromJson(jsonMap));
        } catch (e) {
          debugPrint('Lỗi decode todo với key $key: $e');
        }
      }
    }
    return todos;
  }
}