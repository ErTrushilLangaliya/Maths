//
//  Operations.swift
//  Statistics
//
//  Created by Trushil on 03/08/22.
//

import Foundation
import UIKit

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}
