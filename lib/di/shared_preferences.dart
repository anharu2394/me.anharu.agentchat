import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

/// SharedPreferencesのインスタンスを非同期に生成
@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) async {
  return SharedPreferences.getInstance();
}
