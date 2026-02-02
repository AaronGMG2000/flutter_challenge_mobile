import UIKit
import Flutter
import UserNotifications 

@main
@objc class AppDelegate: FlutterAppDelegate, NativeNotificationApi {
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    NativeNotificationApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: self)
    
    UNUserNotificationCenter.current().delegate = self
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([.alert, .sound])
  }

  func showLocalNotification(payload: NotificationPayload) throws {
    let content = UNMutableNotificationContent()
    content.title = "Te ha gustado:"
    content.body = payload.title
    content.sound = .default

    let request = UNNotificationRequest(
        identifier: "like_\(payload.id)",
        content: content,
        trigger: nil
    )
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error)")
        }
    }
  }
}