//
//  SpecialistListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct SpecialistListView: View {
    
    let specializations = [
            "Cardiology",         // القلب والأوعية الدموية
            "Dermatology",        // الجلدية
            "Dentistry",          // الأسنان
            "Psychiatry",         // النفسية
            "Pediatrics",         // الأطفال
            "Orthopedics",        // العظام
            "Neurology",          // المخ والأعصاب
            "Urology",            // المسالك البولية
            "ENT",                // أنف وأذن وحنجرة
            "Ophthalmology",      // الرمد والعيون
            "Surgery",            // الجراحة العامة
            "Obstetrics & Gyn",   // النساء والتوليد
            "Internal Medicine",  // الباطنة
            "Endocrinology",      // السكر والغدد
            "Gastroenterology",   // الجهاز الهضمي
            "Physical Therapy",   // العلاج الطبيعي
            "Nutrition & Obesity",// التخسيس والتغذية
            "Hepatology",         // الكبد
            "Nephrology",         // الكلى
            "Pulmonology",        // الصدر والجهاز التنفسي
            "Radiology",          // الأشعة
            "Clinical Pathology", // التحاليل الطبية
            "Oncology",           // الأورام
            "Vascular Surgery",   // جراحة الأوعية الدموية
            "Rheumatology"        // الروماتيزم والتأهيل
        ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    ForEach(specializations, id: \.self) { specialization in
                        NavigationLink {
                            DoctorListView(specialization: specialization)
                        } label: {
                            SpecializationCard(
                                specializationImage: "specialist",
                                specialization: specialization
                            )
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 12)
            }
        }
    }
}
