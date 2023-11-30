//
//  CenterDetailsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct CenterDetailsView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:4){
                    Image("clinc")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 160)
                        .clipShape(Ellipse())
                        .overlay(
                            Ellipse()
                                .stroke(Color("main"), lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
                    HStack(spacing: 0){
                        Text("Family Care ")
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 20))
                        
                        Text("Clinic ")
                            .foregroundColor(Color("text").opacity(0.6))
                            .font(.custom(GFFonts.popinsMedium, size: 20))
                    }//:HStack
                    
                    HStack {
                        ForEach(0 ..< 5) { index in
                            Image(systemName: index < 4 ? "star.fill" : "star")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width:15,height: 15)
                        }
                    } //HStack
                    
                    ImageScroll()
                        .padding(EdgeInsets(top:8, leading: 10 ,bottom: 5, trailing: 10))
                    Group{
                        Text("Doctors")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:0, leading: 20 ,bottom: 0, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(1..<6) { _ in
                                    DoctorCard(image: Image("user"),
                                               name: "Dr Abdalazem Saleh",
                                               specialization: "Dentist",
                                               rate: 5,
                                               price: "400",
                                               location: "Mansoura")
                                }
                            }//:HStack
                            .padding(EdgeInsets(top:10, leading: 20 ,bottom: 20, trailing: 20))
                        }//:ScrollView
                    }//Group
                    
                    Group{
                        Text("Specializations")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:0, leading: 20 ,bottom: 0, trailing: 0))
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing: 10) {
                                ForEach(0..<4, id: \.self) { _ in
                                    SpecializationCard(specializationImage: "Dentist", specialization: "Dentist")
                                }
                            }//:Hstack
                            .padding(EdgeInsets(top:10, leading: 20 ,bottom: 20, trailing: 20))
                        }//:ScrollView
                    }//:Group
                    
                    Group{
                        Text("Price")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:16, leading: 20 ,bottom: 0, trailing: 0))
                        
                        PriceCard(image: "Price", price: "300")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:8, leading: 20 ,bottom: 0, trailing: 0))
                    }//:Group
                    
                    Group{
                        Text("Location")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:16, leading: 20 ,bottom: 0, trailing: 0))
                        
                        locationCard(location: "Mansoura")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:8, leading: 20 ,bottom: 0, trailing: 0))
                    }//:Group
                    
                    Group{
                        Text("Reviews")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:16, leading: 20 ,bottom: 0, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(1..<6) { _ in
                                    ReviewCard(userName: "Sami Ahmed", description: "He is agood doctor and he is good good bbbbnbbb", review: "3")
                                }
                            }
                            .padding(EdgeInsets(top:10, leading: 20 ,bottom: 20, trailing: 20))
                        }
                    }//:Group
                    GFBookButoon(tilte: "Book Now")
                }//:VStack
            }//:ScrollView
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        // back
                    }) {
                        Image(systemName: "chevron.backward")
                            .frame(width: 20,height: 20)
                            .foregroundColor(Color("text"))
                    }
                },
                trailing: HStack {
                    Button(action: {
                        // fav button
                    }) {
                        Image(systemName: "bookmark")
                            .frame(width: 24,   height: 24)        .foregroundColor(Color("text"))
                    }
                }
            )
        }//:NavigationStack
    }
}

struct CenterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CenterDetailsView()
    }
}

