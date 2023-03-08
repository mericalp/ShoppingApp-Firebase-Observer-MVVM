//
//  CartRowOrderView.swift
//  Shopping
//
//  Created by Meric on 20.08.2022.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseAuth

struct CartRowOrderView: View {
    let userbasket: UserOrderModel
    @Binding var isNavigationBarHidden: Bool
    @State var formatter = DateFormatter()
    

    var body: some View {
        
      if Auth.auth().currentUser?.uid == userbasket.uid {
          NavigationLink {} label: {
                    HStack {
                        HStack{
                            AnimatedImage(url: URL(string: userbasket.image)!).resizable()
                            .frame(width: 98, height: 112 )}
                            .cornerRadius(25)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .gray, radius: 10, x: 5, y: 5)
                            .padding()
                        VStack {
                            VStack(spacing:10) {
                                Spacer().frame(height: 10)
                                Text("Delivered to customer ").font(.system(size: 15).bold()).foregroundColor(.green).opacity(0.6)
                                HStack{
                                    Text(userbasket.date,format: Date.FormatStyle().month().day().weekday()).font(.system(size: 14).bold()).foregroundColor(.black).opacity(0.6)
                                    Spacer().frame(width: 79)
                                }
                               
                            }
                            .frame(width:  165, height: 95, alignment: .leading)
                            .cornerRadius(22)
                            Spacer().frame(height: 70)
                        }
                        
                        Spacer().frame(width: 36)
                        
                        VStack(spacing:4) {
                            
                            HStack{
                                Text(String(userbasket.price)).font(.system(size: 16)).foregroundColor(.black)
                                Spacer().frame(width:60)
                             }
                            
                            Spacer().frame(height: 60)
                            
                            HStack{
                                Text("Detail").font(.system(size: 13)).foregroundColor(.black)
                                Image(systemName: "chevron.right").resizable().frame(width: 7, height: 12).foregroundColor(.black)
                                Spacer().frame(width: 60)
                             }
                         }
                         .frame(width:  110, height: 126, alignment: .leading)
                         .cornerRadius(22)
                        Spacer().frame(width: 8)
                        Divider().opacity(0.8)
                    } // HStack
                    .frame(width: 395, height: 120, alignment: .leading)
                    .cornerRadius(22)
                    .navigationBarHidden(true)
                }
           }
     }
}


