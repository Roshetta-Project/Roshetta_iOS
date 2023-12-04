//
//  DoctorDetailsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct DoctorDetailsView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 4){
                    StatusImageView(image: "user")
                    Text("Dr. Abdalzem Saleh")
                        .foregroundColor(Color("text"))
                        .font(.custom(GFFonts.popinsSemiBold, size: 20))
                    HStack {
                        ForEach(0 ..< 5) { index in
                            Image(systemName: index < 3 ? "star.fill" : "star")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width:15,height: 15)
                        }
                    } //HStack
                    
                    Group{
                        Text("About Doctor")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:20, leading: 20 ,bottom: 0, trailing: 0))
                        
                        AboutCardView(aboutText: "Dr. Abdalazem is a highly skilled and compassionate dentist dedicated to providing comprehensive oral care to his patients. With a wealth of knowledge and experience in dentistry, he excels in diagnosing and treating various dental conditions, ranging from routine cleanings to complex procedures. ")
                    }//:Group
                    
                    Group{
                        Text("Specialization")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:16, leading: 20 ,bottom: 0, trailing: 0))
                        SpecializationCard(specializationImage: "Dentist", specialization: "Dentist")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:8, leading: 20 ,bottom: 0, trailing: 0))
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
                        Text("Clinic")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:16, leading: 20 ,bottom: -8, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: -10) {
                                ForEach(1..<6) { _ in
                                    ClincCard(image: Image("Clinic"),
                                              name: "Care",
                                              rate: 3,
                                              price: "300",
                                              location: "Mansoura")
                                }
                            }
                            .padding([.leading, .trailing], 5)
                        }
                    }//:Group
                    
                    Group{
                        Text("Location")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:-5, leading: 20 ,bottom: -8, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(1..<6) { _ in
                                    locationCard(location: "New Damietta, Damietta")
                                }
                            }
                            .padding(EdgeInsets(top:16, leading: 20 ,bottom: 20, trailing: 20))
                        }
                    }//:Group
                    Group{
                        Text("Reviews")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top:-8, leading: 20 ,bottom: 0, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(1..<6) { _ in
                                    ReviewCard(userName: "Sami Ahmed", description: "He is agood doctor and he is good good bbbbnbbb", review: "3")
                                }
                            }
                            .padding(EdgeInsets(top:10, leading: 20 ,bottom: 20, trailing: 20))
                        }
                    } //:Group
                    
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
                            .frame(width: 24,   height: 24)
                            .foregroundColor(Color("text"))
                    }
                }
            )
            
        }//:NavigationStack
    }
}

struct DoctorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailsView()
    }
}
