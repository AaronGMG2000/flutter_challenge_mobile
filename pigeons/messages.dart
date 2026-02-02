import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/native_bridge/notification_api.g.dart',
    dartPackageName: 'flutter_challenge_model',
    kotlinOut: 'android/app/src/main/kotlin/com/maga/flutter_challenge_model/NotificationApi.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.maga.flutter_challenge_model'),
    swiftOut: 'ios/Runner/NotificationApi.g.swift',
  ),
)
class NotificationPayload {
  final int id;
  final String title;
  final String body;

  NotificationPayload({required this.id, required this.title, required this.body});
}

@HostApi()
abstract class NativeNotificationApi {
  void showLocalNotification(NotificationPayload payload);
}
