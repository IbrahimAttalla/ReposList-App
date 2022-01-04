//
//  Double + RoundToPrecentage.swift
//
//  Created by Dalia Hosny on 4/22/20.
//  Copyright © 2020 Dalia Hosny. All rights reserved.
//

import Foundation

extension Double {
    func roundTo(decimalPlaces: Int) -> String {
        return NSString(format: "%.\(decimalPlaces)f" as NSString, self) as String
    }
}
