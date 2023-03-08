//
//  CartRowBasketView.swift
//  Shopping
//
//  Created by Meric on 19.08.2022.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct CartRowBasketView: View {
    
    @Binding var Totalprice: String
    let userbasket: UserBasketModel
    @State private var counter: Int = 0
    @ObservedObject  var obser = observer()

    var body: some View {
     
        HStack(alignment: .top){
            AnimatedImage(url: URL(string: userbasket.image)!)
                .resizable()
                .frame(width: 135, height: 135 )
                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
                .padding()
         
            Spacer().frame(width:9)
            
            VStack(alignment:.leading) {
                     Spacer().frame(height:52)
                     HStack {
                        VStack(alignment:.leading,spacing:8){
                            Text(userbasket.name).font(.system(size: 14).bold()).foregroundColor(.black).opacity(0.75).frame(width: 180, height:25, alignment: .leading)
                            Text("Estimated Delivery : 2 days").font(.system(size: 12).bold()).foregroundColor(.black).opacity(0.5).frame(width: 180, height:25, alignment: .leading)
                        }.frame(width: 180, height:50, alignment: .leading)
                        Button {
                            obser.deleteBasket(ToDelete: userbasket)
                        } label: {
                                Spacer().frame(width:15)
                                VStack{
                                Image(systemName: "trash").resizable().frame(width: 19, height:19 ).foregroundColor(.red).opacity(0.7)
                                    Spacer().frame(height:60)
                                }
                            }
                        }
                        Spacer().frame(height:38)
                        HStack {
                            HStack{
                                Text(userbasket.size).font(.system(size: 14).bold()).foregroundColor(.black)
                            }.frame(width: 23, height: 23 )
                                .background(.white)
                                .border(.black).opacity(0.7)
                            Spacer().frame(width:110)
                            HStack{
                                Spacer().frame(width:35)
                                Text(String(userbasket.formattedPrice)).frame(width: 50, height: 30 ).foregroundColor(.black)
                            }
                        }
                        .onAppear
                         {
                            Totalprice = userbasket.formattedPrice
                        }
                        Spacer().frame( height: 44)
            }.frame(width: 200, height: 150)
                .ignoresSafeArea()
            Spacer().frame(width:20)
            
        } // HStack
        .frame(width: 378, height: 160)
            .ignoresSafeArea()
    }
}


