//
//  FinishOrderView.swift
//  Shopping
//
//  Created by Meric on 1.09.2022.
//

import SwiftUI

struct FinishOrderView: View {
    @Binding var showNestedView: Bool
    @State var showSecond = false
    @State var showThird = false
    @State var backToFirst = false
    @State var showNestedView2: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment:.leading) {
              Spacer().frame(height:160)
             HStack{
                Spacer().frame(width:120)
                 Image("checked").resizable().frame(width: 150, height: 140)
             }
            
            Spacer().frame(height:40)

            HStack {
                Spacer().frame(width:70)
                VStack(spacing:5){
                    Text("Your order has been received").foregroundColor(.black).font(.system(size: 19))
                    Text("#6431245").foregroundColor(.black).font(.system(size: 19))
                }
             }
            Spacer().frame(height:80)

            HStack {
                Spacer().frame(width: 70)
                
                Button {
                    showNestedView = false
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    HStack{
                         Text("   Back to shopping").font(.system(size: 15).bold()).foregroundColor(.white)
                    }
                    .frame(width: 260, height: 50 )
                    .background(
                         Rectangle()
                             .fill(Color.green.opacity(0.5))
                             .cornerRadius(16)
                    )
                }
            }
            Spacer().frame(height:370)
         }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,alignment: .leading)
            .background(
                Rectangle()
                    .fill(.black.opacity(0.06))
                )
        .navigationBarHidden(true)

     }
}


 
