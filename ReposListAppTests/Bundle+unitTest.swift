//
//  Bundle+unitTest.swift
//  ReposListAppTests
//
//  Created by Ebrahim Attalla on 1/5/22.
//

import Foundation

extension Bundle{
    public class var unitTest:Bundle{
        return Bundle(for: ReposListAppTests.self)
    }
}
