//
//  CenterDetailsModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 30/06/2024.
//

import Foundation
struct CenterDetailsModel: Codable {
    let data: Center
    let doctors: [Doctor]
    let reviews: [Review]
}

extension CenterDetailsModel {

    static func mock(id: String) -> CenterDetailsModel? {

        guard let center = CenterModel.mockList.first(where: { $0.id == id }) else {
            return nil
        }

        let doctors = Doctor.mockList.filter { $0.center.id == id }
        let reviews = doctors.flatMap { $0.reviews }

        return CenterDetailsModel(
            data: Center(
                logo: center.logo,
                name: center.name,
                centerPhotos: center.centerPhotos,
                specilization: center.specilization,
                price: center.price,
                location: center.location,
                isfavourite: center.isfavourite,
                ratingsAverage: center.ratingsAverage,
                id: center.id
            ),
            doctors: doctors,
            reviews: reviews
        )
    }
}
