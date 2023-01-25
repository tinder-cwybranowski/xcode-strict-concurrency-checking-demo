//
//  Example.swift
//  xcode-strict-concurrency-checking-demo
//
//  Created by Connor Wybranowski on 1/25/23.
//

import Foundation

public enum Example {

    private static var value: String = "string"

    public static func exampleMethod() {
        DispatchQueue.global().async {
            self.value.append("async")
        }
        _ = value
    }
}
