//
//  AccessibilityIdentifiers.swift
//  Roshetta
//
//  Created by Auto-Agent on 2026-01-23.
//

import Foundation

/// Centralized accessibility identifiers for UI testing and VoiceOver support
enum AccessibilityIdentifiers {
    
    // MARK: - Home Screen
    enum Home {
        static let homeSlider = "home_slider"
        static let categoryDoctor = "category_doctor"
        static let categoryClinic = "category_clinic"
        static let categoryCenter = "category_center"
        static let categorySpecialist = "category_specialist"
        static let seeAllDoctors = "see_all_doctors"
        static let seeAllClinics = "see_all_clinics"
        static let seeAllCenters = "see_all_centers"
        static let searchButton = "search_button"
        static let menuButton = "menu_button"
    }
    
    // MARK: - Profile Screen
    enum Profile {
        static let profileImage = "profile_image"
        static let userName = "user_name"
        static let userLocation = "user_location"
        static let accountRow = "profile_account_row"
        static let privacyPolicyRow = "profile_privacy_policy_row"
        static let rateUsRow = "profile_rate_us_row"
        static let aboutUsRow = "profile_about_us_row"
        static let contactUsRow = "profile_contact_us_row"
    }
    
    // MARK: - Auth Screen
    enum Auth {
        static let googleButton = "auth_google_button"
        static let facebookButton = "auth_facebook_button"
        static let appleButton = "auth_apple_button"
        static let termsText = "auth_terms_text"
    }
    
    // MARK: - Doctor/Clinic/Center Cards
    enum Cards {
        static let doctorCard = "doctor_card"
        static let clinicCard = "clinic_card"
        static let centerCard = "center_card"
        static let bookmarkButton = "bookmark_button"
        static let ratingStars = "rating_stars"
    }
    
    // MARK: - Data History
    enum DataHistory {
        static let genderMale = "gender_male_button"
        static let genderFemale = "gender_female_button"
        static let nextButton = "next_button"
        static let backButton = "back_button"
    }
    
    // MARK: - Side Menu
    enum SideMenu {
        static let menuContainer = "side_menu_container"
        static let homeTab = "side_menu_home"
        static let profileTab = "side_menu_profile"
        static let reservationsTab = "side_menu_reservations"
        static let notificationsTab = "side_menu_notifications"
    }
}
