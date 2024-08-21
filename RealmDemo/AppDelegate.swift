//
//  AppDelegate.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let url = DatabaseHelper.shared.getDatabasePath(){
            print("Database URL:", url)
        }
        window = UIWindow(frame: UIScreen.main.bounds)

        makingRootFlow()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func makingRootFlow() {
        guard let window = window else {
            print("Error: window is nil")
            return
        }
        
        let isLoggedIn = UserSession.shared.isLoggedIn()
        
        
        if isLoggedIn {
            let controller = HomeVC.instantiate(fromAppStoryboard: .Home)
            let nav = UINavigationController(rootViewController: controller)
            window.rootViewController = nav
        } else {
            let controller = LoginVC.instantiate(fromAppStoryboard: .Main)
            let nav = UINavigationController(rootViewController: controller)
            window.rootViewController = nav
        }

        window.makeKeyAndVisible()

        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)

    }
    func goToDashboard() {
        let rootViewController = self.window!.rootViewController as! UINavigationController
        let controller_TabBar = HomeVC.instantiate(fromAppStoryboard: .Main)
        rootViewController.setViewControllers([controller_TabBar], animated: true)
    }

}

