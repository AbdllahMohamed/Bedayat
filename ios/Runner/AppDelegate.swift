import UIKit
import Flutter
import Firebase
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyB4h35uVPGWTDugCwRYT-z-b7a8rDdj_Fk")
    if(FirebaseApp.app() == nil){
        FirebaseApp.configure()
    }
//    [GMSServices provideAPIKey:@"AIzaSyBkpAmJJ3xHr3GdMWKVuq_z5wuWdeVMkjU"];
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
