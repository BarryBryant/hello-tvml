//
// Created by Barry Bryant on 4/7/17.
// Copyright (c) 2017 Barry Bryant. All rights reserved.
//

import JavaScriptCore

@obj protocol ResourceLoaderExport: JSExport {
    static func create() -> ResourceLoaderExport
    func loadBundleResource(_ name: String) -> String
}

@objc class ResourceLoader: NSObject, ResourceLoaderExport {

    func loadBundleResource(_ name: String) -> String {
        let path = Bundle.main.path(forResource: name, ofType: nil)
        do {
            return try String(contentsOfFile: path!, encoding: .utf8)
        } catch {
            print("There was a problem loading the bundle resource: \(name)")
            return ""
        }
    }

    static func create() -> ResourceLoaderExport {
        return ResourceLoader()
    }


}