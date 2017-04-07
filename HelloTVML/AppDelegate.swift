//
//  AppDelegate.swift
//  HelloTVML
//

//  Copyright (c) 2017 Barry Bryant. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appController: TVApplicationController?
    
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey : Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let appControllerContext = TVApplicationControllerContext()
        let javascriptURL = Bundle.main.url(forResource: "main", withExtension: "js")
        appControllerContext.javaScriptApplicationURL = javascriptURL!

        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)

        return true
    }
}

extension AppDelegate: TVApplicationControllerDelegate {

    func appController(_ appController: TVApplicationController, evaluateAppJavaScriptIn jsContext: JSContext) {
        jsContext.setObject(ResourceLoader.self, forKeyedSubscript: "NativeResourceLoader" as NSString)
    }
}
