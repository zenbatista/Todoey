//
//  AppDelegate.swift
//  Todoey
//
//  Created by Harald Batista on 1/1/18.
//  Copyright © 2018 zenbatista. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        print(NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true).last! as String)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
// Phone call came in.
    
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
 
        print("applicationDidEnterBackground")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate")
    }


}

