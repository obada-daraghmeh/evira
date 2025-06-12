import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/backend_const.dart';
import '../../../../core/errors/exceptions/exception.dart';

abstract class SearchLocalDataSource {
  Future<Unit> addToHistory({required String title});
  Future<List<String>> get fetchHistory;
  Future<Unit> deleteFromHistory({required String title});
  Future<Unit> get clearHistory;
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  static const _boxName = BackendConst.searchHistoryBox;
  static const _key = BackendConst.searchHistoryKey;
  static Box get _box => Hive.box(_boxName);

  @override
  Future<Unit> addToHistory({required String title}) async {
    try {
      final history = await fetchHistory;
      final newHistory = [
        title,
        ...history.where((q) => q != title),
      ].take(10).toList();

      await _box.put(_key, newHistory);
      return unit;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<String>> get fetchHistory async {
    try {
      final raw = await _box.get(_key);
      if (raw is List) {
        return List<String>.from(raw);
      }
      return [];
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Unit> deleteFromHistory({required String title}) async {
    try {
      final history = await fetchHistory;
      final newHistory = history.where((q) => q != title).toList();
      await _box.put(_key, newHistory);
      return unit;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Unit> get clearHistory async {
    try {
      await _box.clear();
      return unit;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
