//
//  Dimensions.swift
//  Roshetta
//
//  Created by Auto-Agent on 2026-01-23.
//

import Foundation

/// Standardized dimensions for UI elements
enum Dimensions {
    // MARK: - Corner Radius
    static let cornerRadiusSmall: CGFloat = 8.0
    static let cornerRadiusMedium: CGFloat = 12.0
    static let cornerRadiusLarge: CGFloat = 20.0
    static let cornerRadiusXLarge: CGFloat = 24.0
    
    // MARK: - Shadow (More subtle per Apple HIG)
    static let shadowRadius: CGFloat = 3.0
    static let shadowOpacity: Double = 0.15
    static let shadowX: CGFloat = 0.0
    static let shadowY: CGFloat = 2.0
    
    // MARK: - Icon Sizes
    static let iconXSmall: CGFloat = 8.0
    static let iconSmall: CGFloat = 12.0
    static let iconMedium: CGFloat = 16.0
    static let iconLarge: CGFloat = 24.0
    static let iconXLarge: CGFloat = 32.0
    
    // MARK: - Avatar/Image Sizes
    static let avatarSmall: CGFloat = 48.0
    static let avatarMedium: CGFloat = 64.0
    static let avatarLarge: CGFloat = 96.0
    static let avatarXLarge: CGFloat = 136.0
    
    // MARK: - Button Sizes
    /// Minimum touch target size per Apple HIG
    static let minTouchTarget: CGFloat = 44.0
    static let buttonHeightSmall: CGFloat = 44.0
    static let buttonHeightMedium: CGFloat = 50.0
    static let buttonHeightLarge: CGFloat = 56.0
    
    // MARK: - Card Dimensions
    static let cardImageSmall: CGFloat = 72.0
    static let cardImageMedium: CGFloat = 128.0
    static let cardImageLarge: CGFloat = 184.0
}
