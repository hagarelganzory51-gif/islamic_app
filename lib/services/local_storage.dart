import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveTasbihCount(int count) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('tasbih_count', count);
  }

  static Future<int> getTasbihCount() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt('tasbih_count') ?? 0;
  }

  static Future<void> savePrayerNotification(
    String prayerName,
    bool value,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(
      'notification_$prayerName',
      value,
    );
  }

  static Future<bool> getPrayerNotification(
    String prayerName,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(
          'notification_$prayerName',
        ) ??
        false;
  }
}