//
//  PlistServices.swift
//  Register
//
//  Created by Trương Thắng on 3/12/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation

class PlistServices {
    func getDictionaryFrom(plist: String) -> Dictionary<AnyHashable, Any>? {
        var result : Dictionary<AnyHashable, Any>?
        let fileNameComponents = plist.components(separatedBy: ".")
        guard let filePath = Bundle.main.path(forResource: fileNameComponents.first ?? "", ofType: fileNameComponents.last ?? "") else {
            return nil
        }
        guard FileManager.default.fileExists(atPath: filePath) == true else {
            return nil
        }
        
        guard let data = FileManager.default.contents(atPath: filePath) else {
            return nil
        }
        do {
            guard let root = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? Dictionary<AnyHashable, Any> else {
                return nil
            }
            result = root
            
        } catch {
            print("Error: PropertyListSerialization error")
        }
        // 1: Kiểm tra các giá trị lấy ra từ plist
        
        // print("get \(plist): \n \(result) ")
        return result
        
    }
}
