//
//  LocationDetail.swift
//  Shopping
//
//  Created by Meric on 2.09.2022.
//


import SwiftUI
import MapKit


 
struct StoresDetailView: View {
    
    let location : StoreModel
    @EnvironmentObject private var vm: StoresViewModel
    
    var body: some View {
        HStack{
            HStack(alignment: .bottom,spacing: 0) {
                VStack(alignment:.leading ,spacing:16) {
                    titleSection
                }
                 VStack(spacing:4){
                     nextButton
                 }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y:65)
                )
            .cornerRadius(10)
        }
        .frame(width: 355, height: 100 )
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}
 
extension StoresDetailView  {
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }.frame(maxWidth: .infinity,alignment: .leading)
    }
    
 
    
    private var nextButton : some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 132, height: 42 )
                .foregroundColor(.white)
        }
            .background(.black)
            .cornerRadius(33)
    }
}

