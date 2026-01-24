//
//  ClinicDetailsModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 21/06/2024.
//

import Foundation

struct ClinicDetailsModel: Codable {
    let data: Clinic
    let doctors: [Doctor]
    let reviews: [Review]
}


extension ClinicDetailsModel {

    static func mock(id: String) -> ClinicDetailsModel? {

        guard let clinic = ClinicModel.mockList.first(where: { $0.id == id }) else {
            return nil
        }

        let doctors = Doctor.mockList.filter { $0.clinicId == id }
        let reviews = doctors.flatMap { $0.reviews }

        return ClinicDetailsModel(
            data: Clinic(
                logo: clinic.logo,
                name: clinic.name,
                clinicPhotos: clinic.clinicPhotos,
                specilization: clinic.specilization,
                price: clinic.price,
                location: clinic.location,
                isfavourite: clinic.isfavourite,
                ratingsAverage: clinic.ratingsAverage,
                id: clinic.id
            ),
            doctors: doctors,
            reviews: reviews
        )
    }
}

