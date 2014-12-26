import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  let dataModel = DataModel()
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    let navigationController = window!.rootViewController as UINavigationController
    let controller = navigationController.viewControllers[0] as AllListsViewController
    controller.dataModel = dataModel
    
    let notificationSettings = UIUserNotificationSettings(forTypes: .Alert | .Sound, categories: nil)
    UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    
    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    saveData()
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
  }
  
  func applicationWillTerminate(application: UIApplication) {
    saveData()
  }
  
  func saveData() {
    dataModel.saveChecklists()
  }
}
