//
//  LocationMark.swift
//  Shopping
//
//  Created by Meric on 2.09.2022.
//


import SwiftUI

struct StoresMarkView: View {
    
    var body: some View {
        
        VStack(spacing:0) {
            
                 Image(systemName: "mappin")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height:12)
                    .foregroundColor(.red)
                    .offset(y: -3)
                    .padding(.bottom,40)
         }
    }
}

 
