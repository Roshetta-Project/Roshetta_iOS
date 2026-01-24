//
//  Spacing.swift
//  Roshetta
//
//  Created by Auto-Agent on 2026-01-23.
//

import Foundation

/// Standardized spacing values following 4pt grid system (Apple HIG)
enum Spacing {
    /// 2.0 - Minimal spacing for very tight layouts
    static let xxxSmall: CGFloat = 2.0
    /// 4.0 - Extra small spacing
    static let xSmall: CGFloat = 4.0
    /// 8.0 - Small spacing, standard for compact elements
    static let small: CGFloat = 8.0
    /// 12.0 - Medium-small spacing
    static let mediumSmall: CGFloat = 12.0
    /// 16.0 - Medium spacing, most commonly used
    static let medium: CGFloat = 16.0
    /// 24.0 - Large spacing for section separation
    static let large: CGFloat = 24.0
    /// 32.0 - Extra large spacing
    static let xLarge: CGFloat = 32.0
    /// 40.0 - Extra extra large spacing
    static let xxLarge: CGFloat = 40.0
    /// 48.0 - Maximum spacing for major sections
    static let xxxLarge: CGFloat = 48.0
}
