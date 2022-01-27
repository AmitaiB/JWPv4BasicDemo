//
//  Dictionary+PrettyPrint.swift
//  TestApp
//
//  Created by Amitai Blickstein on 6/2/19.
//  Copyright © 2019 JWPlayer. All rights reserved.
//

import Foundation

class PrettyPrinter {
    static func print(json tryJSON: Any) -> String {
        var result = "\(tryJSON)"
        do {
            guard JSONSerialization.isValidJSONObject(tryJSON) else { return result }
            let data = try JSONSerialization.data(withJSONObject: tryJSON, options: .prettyPrinted)
            guard let string = String(data: data, encoding: .utf8) else { return result }
            result = string
        } catch {
            Swift.print("\nJSON printing error, falling back on `description` method\n")
        }
        
        return result
    }
}

extension Dictionary where Key: ExpressibleByStringLiteral {
    @discardableResult
    func prettyPrint() -> String {
        var result = ""
        for (key, value) in self {
            if value is Dictionary {
                result += "\"\(key)\" : {...} \n"
            } else {
                result += "\"\(key)\" : \(value)\n"
            }
        }
        return result
    }
}

// OR, in alphabetical order

extension Dictionary where Key: ExpressibleByStringLiteral & Comparable {
    @discardableResult
    func prettyPrint(sorted: Bool) -> String {
        var result = ""
        for (key, value) in self.sorted(by: {$0.0 < $1.0 }) {
            result += "\"\(key)\" :  \(value)\n"
        }
        return result
    }
}
