//
//  CartRowFavouritesView.swift
//  Shopping
//
//  Created by Meric on 23.08.2022.
//


import SwiftUI
import SDWebImageSwiftUI
 
struct CartRowFavouritesView: View {

    let userItem : UserFavouritesModel
    @ObservedObject var obser = observer()
    var body: some View {
        
        HStack {
            Spacer().frame(width: 80)
            AnimatedImage(url: URL(string: userItem.image)!)
                .resizable()
                .frame(width: 100, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
                .padding()
             
            HStack {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text(userItem.name).font(.system(size: 15).bold()).opacity(0.9).frame(width: 180, height:20,alignment: .leading)
                        Spacer().frame(height:20)
                        Button {
                            obser.deleteFavourite(ToDelete: userItem)
                        } label: {
                              Spacer().frame(width:35)
                              VStack {
                                  Image(systemName: "trash").resizable().frame(width: 19, height:19 ).foregroundColor(.red).opacity(0.7)
                                  Spacer().frame(height:8)
                              }
                         }
                    }
                    
                    Spacer().frame(height: 20)
                    
                    NavigationLink{
                        // Buy
                        
                    } label: {
                        HStack(alignment:.center) {
                            Text("Add To Basket").font(.system(size: 13).bold()).foregroundColor(.black)
                         }
                         .frame(width: 220, height: 25,alignment: .center)
                         .background(.white).opacity(0.75)
                         .border(.black)
                     }
                    
                    Spacer().frame(height: 25)

                    HStack {
                         Spacer().frame(width:200)
                        HStack {
                            Text(String(userItem.price)).font(.system(size: 17))
                        }.frame(width: 50, height: 20)
                    }
                    
                }
                .padding([.top, .bottom])
            }
            Spacer().frame(width: 88)
        }
        .frame(width:370  )
     }
 }
 

