import UIKit
import Flutter
import GoogleMaps  

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyA21sddlpqsprvLpUJUOZIphdGDF6K80h8")


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
