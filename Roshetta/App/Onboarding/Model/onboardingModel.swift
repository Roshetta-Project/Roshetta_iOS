//
//  onboardingModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-27.
//

import Foundation
import SwiftUI

struct OnbordingModel: Identifiable {
    var id: Int
    let image: Image
    let title: String
    let descrption: String
}

extension OnbordingModel {
    static let onboardingData: [OnbordingModel] = [
        .init(id: 0,
              image: Images.onboarding1,
              title: "Find Professional Doctor.",
              descrption: "You can search for doctors based on their specialization, ensuring that you find the right healthcare provider for your specific needs, whether it's a general practitioner or specialist."),
        .init(id: 1,
              image: Images.onboarding2,
              title: "Your family is in good hands.",
              descrption: "Our app places a strong emphasis on family well-being, offering comprehensive healthcare solutions for both you and your cherished family members."),
        .init(id: 2,
              image: Images.onboarding3,
              title: "You have our support, always.",
              descrption: "The app provides a dedicated support channel, such as a help center or a chat support feature, where users can seek assistance for any questions or issues they encounter while using the app.")
    ]
}
