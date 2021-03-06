//
//  DSButtonTheme.swift
//  
//
//  Created by Matheus Gois on 08/08/21.
//

import Foundation

public protocol DSButtonTheme: AnyObject {
    // shape
    var titleColor: UIColor { get }
    var titleFont: UIFont { get }
    var backgroundColor: UIColor { get }
    var selectedBackgroundColor: UIColor { get }
    var borderWidth: CGFloat { get }
    var borderColor: UIColor { get }
}

public enum DSButtonThemeStyle {
    case primary
    case secondary

    var style: DSButtonTheme {
        switch self {
        case .primary:
            return DSPrimaryButtonTheme()
        case .secondary:
            return DSSecondaryButtonTheme()
        }
    }
}
