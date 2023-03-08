//
//  OrderView.swift
//  Shopping
//
//  Created by Meric on 20.08.2022.
//

import SwiftUI
import FirebaseAuth

struct OrderView: View {
    @ObservedObject  var obser = observer()
    @Binding var isNavigationBarHidden: Bool  
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        VStack {
            Spacer().frame(height:6)
            
            Button {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                HStack(spacing:12) {
                    Image(systemName: "chevron.left").resizable().frame(width: 10, height: 14 ).foregroundColor(.black)
                    Text("Done").foregroundColor(.black).font(.system(size: 16))
                }
                .frame(width: 110, height: 38 )
              
                 Spacer().frame(width:292)
            }
            Spacer().frame(height:30)

            ScrollView(.vertical) {
                ForEach (obser.userOrder) { items in
                    CartRowOrderView(userbasket: items, isNavigationBarHidden: $isNavigationBarHidden)
                 }
               }
            }
            .navigationBarHidden(true)
         }
    }



