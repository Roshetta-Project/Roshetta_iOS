//
//  Typography.swift
//  Roshetta
//
//  Created by Auto-Agent on 2026-01-23.
//

import SwiftUI

/// Typography system following Apple Human Interface Guidelines
/// Supports Dynamic Type for accessibility
enum Typography {
    // MARK: - Large Titles
    static let largeTitle = Font.custom(GFFonts.SeguiBold, size: 34)
    
    // MARK: - Titles
    static let title1 = Font.custom(GFFonts.SeguiBold, size: 28)
    static let title2 = Font.custom(GFFonts.SeguiBold, size: 22)
    static let title3 = Font.custom(GFFonts.SeguiSemiBold, size: 20)
    
    // MARK: - Headline & Body
    static let headline = Font.custom(GFFonts.SeguiSemiBold, size: 17)
    static let body = Font.custom(GFFonts.Segui, size: 17)
    static let bodyBold = Font.custom(GFFonts.SeguiBold, size: 17)
    
    // MARK: - Callout & Subheadline
    static let callout = Font.custom(GFFonts.Segui, size: 16)
    static let subheadline = Font.custom(GFFonts.Segui, size: 15)
    
    // MARK: - Footnote & Caption
    static let footnote = Font.custom(GFFonts.Segui, size: 13)
    static let caption1 = Font.custom(GFFonts.Segui, size: 12)
    static let caption2 = Font.custom(GFFonts.Segui, size: 11)
}

// MARK: - View Extension for Easy Typography Application
extension View {
    /// Apply large title typography
    func typographyLargeTitle() -> some View {
        self.font(Typography.largeTitle)
    }
    
    /// Apply title1 typography
    func typographyTitle1() -> some View {
        self.font(Typography.title1)
    }
    
    /// Apply title2 typography
    func typographyTitle2() -> some View {
        self.font(Typography.title2)
    }
    
    /// Apply title3 typography
    func typographyTitle3() -> some View {
        self.font(Typography.title3)
    }
    
    /// Apply headline typography
    func typographyHeadline() -> some View {
        self.font(Typography.headline)
    }
    
    /// Apply body typography
    func typographyBody() -> some View {
        self.font(Typography.body)
    }
    
    /// Apply body bold typography
    func typographyBodyBold() -> some View {
        self.font(Typography.bodyBold)
    }
    
    /// Apply callout typography
    func typographyCallout() -> some View {
        self.font(Typography.callout)
    }
    
    /// Apply subheadline typography
    func typographySubheadline() -> some View {
        self.font(Typography.subheadline)
    }
    
    /// Apply footnote typography
    func typographyFootnote() -> some View {
        self.font(Typography.footnote)
    }
    
    /// Apply caption1 typography
    func typographyCaption1() -> some View {
        self.font(Typography.caption1)
    }
    
    /// Apply caption2 typography
    func typographyCaption2() -> some View {
        self.font(Typography.caption2)
    }
}
