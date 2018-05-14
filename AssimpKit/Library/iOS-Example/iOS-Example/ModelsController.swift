//
//  ModelsController.swift
//  iOS-Example
//
//  Created by Bram De Geyter on 14/05/2018.
//  Copyright © 2018 Showpad. All rights reserved.
//

import Foundation
import AssimpKit

@objcMembers
class ModelsController: NSObject {
    var currentModelPath: String? = nil
    let docsDir: String
    let modelFiles: [String]
    
    override init() {
        let bundlePath = Bundle.main.resourcePath
        docsDir = bundlePath?.appending("/assets/") ?? ""
        if let files = FileManager.default.subpaths(atPath: docsDir) {
            modelFiles = files.filter {
                return SCNScene.canImportFileExtension(($0 as NSString).pathExtension)
            }
        } else {
            modelFiles = []
        }
        super.init()
    }
    
    func filePath(at index:Int) -> String? {
        let file = modelFiles[index]
        return docsDir.appending(file)
    }
}
