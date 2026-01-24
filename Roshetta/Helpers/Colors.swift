//
//  Colors.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-27.
//

import SwiftUI

enum Colors {
    // MARK: - Brand Colors
    /// Primary brand color - used for main actions and highlights
    static let main = Color("main")
    /// Secondary brand color - used for supporting elements
    static let secondary = Color("secondary")
    /// Text color - primary text color
    static let text = Color("text")
    /// Menu bar background color
    static let MenuBar = Color("MenuBar")
    
    // MARK: - Semantic Colors
    /// Background color for main views
    static let background = Color(UIColor.systemBackground)
    /// Surface color for cards and elevated elements
    static let surface = Color(UIColor.secondarySystemBackground)
    /// Grouped background for lists and forms
    static let groupedBackground = Color(UIColor.systemGroupedBackground)
    /// Error state color
    static let error = Color.red
    /// Success state color
    static let success = Color.green
    /// Warning state color
    static let warning = Color.orange
    
    // MARK: - Label Colors (Adaptive to light/dark mode)
    /// Primary label - highest contrast text
    static let primaryLabel = Color(UIColor.label)
    /// Secondary label - medium contrast text
    static let secondaryLabel = Color(UIColor.secondaryLabel)
    /// Tertiary label - lowest contrast text
    static let tertiaryLabel = Color(UIColor.tertiaryLabel)
    /// Placeholder text color
    static let placeholderLabel = Color(UIColor.placeholderText)
    
    // MARK: - Separator Colors
    /// Standard separator color
    static let separator = Color(UIColor.separator)
    /// Opaque separator color
    static let opaqueSeparator = Color(UIColor.opaqueSeparator)
}
