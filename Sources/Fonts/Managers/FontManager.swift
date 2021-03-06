//
//  File.swift
//  
//
//  Created by Matheus Gois on 18/07/21.
//

import SwiftUI

// Struct

public struct FontManager {

    // Static Methods

    public static func registerFonts() {
        ["Bold", "ExtraBold", "Medium", "Regular"].forEach { registerFont("Montserrat-"+$0) }
    }

    public static func registerFont(
        _ name: String,
        fileExtension: String = "ttf"
    ) {
        guard let fontURL = Bundle.module.url(
                forResource: name,
                withExtension: fileExtension
        ) else {
            print("No font named \(name)")
            return
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
        print(error ?? "Successfully registered font: \(name)")
    }
}
