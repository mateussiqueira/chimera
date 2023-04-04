import Flutter
import UIKit
import IterableSDK
import UserNotifications

public class SwiftIterablePlugin: NSObject, FlutterPlugin, UNUserNotificationCenterDelegate {

  private static var CHANNEL_NAME: String = "grupoq.io/iterable"
  private var METHOD_NAME_INIT_SECRETS: String = "initSecrets"
  private var METHOD_NAME_INITIALIZE: String = "initialize"
  private var METHOD_NAME_CONFIGURE: String = "configure"
  private var METHOD_NAME_DISABLE: String = "disable"
  private var PARAM_NAME_API_KEY: String = "apiKey"
  private var PARAM_NAME_EMAIL: String = "email"

  private static var channel: FlutterMethodChannel? = nil
  private static var apiKey = ""

  public static func register(with registrar: FlutterPluginRegistrar) {
      channel = FlutterMethodChannel(name: SwiftIterablePlugin.CHANNEL_NAME, binaryMessenger: registrar.messenger())
    let instance = SwiftIterablePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel!)

    registrar.addApplicationDelegate(instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
       case METHOD_NAME_INIT_SECRETS:
            initSecrets(arguments: call.arguments, result: result)
        case METHOD_NAME_INITIALIZE:
            initialize(result: result, launchOptions: nil)
        case METHOD_NAME_CONFIGURE:
            configureIterable(arguments: call.arguments, result: result)
        case METHOD_NAME_DISABLE:
            disablePush(result: result)
        default:
            result(FlutterMethodNotImplemented)
    }
  }

  private func initSecrets(arguments: Any?, result: FlutterResult) {
    let args = arguments as? Dictionary<String, String>
    SwiftIterablePlugin.apiKey = args?[PARAM_NAME_API_KEY] ?? ""
    result(nil)
  }

  private func initialize(result: FlutterResult, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    let config = IterableConfig()
    IterableAPI.initialize(apiKey: SwiftIterablePlugin.apiKey,launchOptions: launchOptions, config: config)
    result(nil)
  }

  private func configureIterable(arguments: Any?, result: FlutterResult) {
    let args = arguments as? Dictionary<String, String>
    let email = args?[PARAM_NAME_EMAIL] ?? ""

    IterableAPI.email = email
    registerForPushNotifications()
    result(nil)
  }
    
  func registerForPushNotifications() {
    UNUserNotificationCenter.current()
        .requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            guard granted else { return }

            DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
  }
    
  private func disablePush(result: FlutterResult) {
    IterableAPI.disableDeviceForAllUsers()
    result(nil)
  }

  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable : Any] = [:]) -> Bool {
    UNUserNotificationCenter.current().delegate = self
    return true
  }
    
  public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    IterableAPI.register(token: deviceToken)
  }
    
  public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("Failed to register for remote notifications with error: \(error))")
  }
  
  public func userNotificationCenter(_: UNUserNotificationCenter, willPresent _: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.badge, .sound, .alert])
  }
    
  public func userNotificationCenter(_ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void) {
    IterableAppIntegration.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
  }

  public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    IterableAppIntegration.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: nil)
  }
}
