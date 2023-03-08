//
//  ProductDetailView.swift
//  Shopping
//
//  Created by Meric on 19.08.2022.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI
import HalfASheet
import FirebaseAuth

var sizes = ["S","M","L","X","XL"]

struct ProductDetailView: View {
    
  // MARK: - PROPERTY
    @ObservedObject var obser = observer()
    @State var isLiked = true
    @State var selectedSize = ""
    @State private var isshowing = false
    var product : Product
    @Environment(\.presentationMode) var presentationMode
    

    // MARK: - BODY

    var body: some View {
        
    VStack(alignment: .leading, spacing: 5, content: {

      ZStack( content: {
          VStack(alignment:.leading) {
               TabView {
                  ForEach(product.ProductDetail ?? ["asdasd"], id: \.self) { item in
                      AnimatedImage(url: URL(string: item)).resizable()
                          .frame(width: 380, height:  800 ,alignment: .leading )
                          .rotationEffect(.degrees(360))
                          .ignoresSafeArea()
                    }
              } //: TAB
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
              .rotationEffect(.degrees(360))
              Spacer().frame(height: isshowing ? 300 : 0)
           }
          
          VStack{
              Spacer().frame(height: 620)
                  
              Button {
                  // MARK: Action
                  withAnimation {
                      isLiked.toggle()
                  }
                  addFavorite()
              }label: {
                  HStack{
                      Spacer().frame(width:320)
                      Image(systemName: isLiked ? "heart" : "heart.fill" ).resizable().frame(width: 30, height: 25).foregroundColor(.red)
                  }
              }
              
             Spacer().frame(height: 30)
               VStack {
                  Spacer().frame(height: 55)
                  VStack {
                      
                      Spacer().frame(height: 55)
                      VStack(spacing:12){
                          Spacer().frame(height: 2)
                          HStack{
                              
                          }
                           .frame(width: 70 , height: 6, alignment: .center)
                           .background(
                                Rectangle().fill(.black.opacity(0.15))
                                    .cornerRadius(33)
                              )
                            .cornerRadius(33)
                          
                             HStack {
                              Spacer().frame(width:10)
                              Text(product.name).font(.system(size: 16)).foregroundColor(.black).opacity(0.8).frame(width: 230,alignment: .leading )
                              Spacer().frame(width:90)
                              Text(product.formattedPrice).font(.system(size: 18).bold()).foregroundColor(.black)
                              
                             }
                            .frame(width: UIScreen.main.bounds.width  , height: 45, alignment:.leading)
                      }.frame(width: UIScreen.main.bounds.width  , height: 45, alignment:.leading)
                  }
 
                  VStack{
                      VStack{
                          Divider().opacity(0.8)
                      }.frame(width: UIScreen.main.bounds.width , height: 12)
                     
                       HStack {
                          Spacer().frame(width:7)
 
                          VStack{
                              AnimatedImage(url: URL(string: product.image)).resizable().frame(width:80, height: 58 ).cornerRadius(15)
                            }
                          
                          Divider().opacity(0.8)
                          HStack {
                              VStack{
                                  Button {
                                      withAnimation {
                                          isshowing.toggle()
                                      }
                                  } label: {
                                      Text("SIZE").font(.system(size: 21).bold()).foregroundColor(.black)
                                  }
                                }
                        }
                        .frame(width: 120, height: 65)
                           
                        Divider().opacity(0.8)
                          if selectedSize == "" {
                              Button {
                                addBasket()
                              } label: {
                               HStack {
                                   Text("Add").font(.system(size: 21).bold()).foregroundColor(.white)
                            
                                  }
                                    .frame(width: 175, height: 60)
                                      .background(
                                        Rectangle()
                                            .fill(.green.opacity(0.2))
                                            
                                        )
                                  Spacer().frame(width: 16 )
                              }
                          } else {
                                  Button {
                                    addBasket()
                                  } label: {
                                   HStack {
                                       Text("Add").font(.system(size: 21).bold()).foregroundColor(.white)
                                       Spacer().frame(width: 15 )
                                        }
                                         .frame(width: 175, height: 60)
                                         .background(
                                            Rectangle()
                                                .fill(.green.opacity(0.7))
                                         )
                                    Spacer().frame(width: 16)
                                    }
                            }
                      }.frame(width: 380, height: 50, alignment: .bottom)
                  }
                  HalfASheet(isPresented: $isshowing) {
                  
                      VStack{
                           Spacer().frame(width:60)
                           Spacer().frame( height:25)
                       HStack(alignment:.center, spacing:12) {
                           NavigationLink {
                              
                          } label: {
                              Spacer().frame(width:70)
                              HStack(alignment:.center, spacing:12) {
                                  Spacer().frame(width:35)
                                  Image(systemName: "lines.measurement.horizontal").resizable().frame(width: 25, height: 20 ).foregroundColor(.black).opacity(0.8)
                                  Text("SEE MEASUREMENTS").font(.system(size: 15).bold()).foregroundColor(.black).opacity(0.7).frame(width: 160, height: 30 )
                                  
                                  Text("NEW").font(.system(size: 11)).frame(width: 42 ,  height: 20).foregroundColor(.white).background(.orange).opacity(0.7).cornerRadius(33)
                                  Spacer().frame(width:45)
                               }
                              .frame(width: 420,height: 60)
                              .background(
                                Rectangle()
                                    .fill(.black.opacity(0.06))
                                    .cornerRadius(22)
                              )
                              .cornerRadius(22)
                              .offset(x:-95)
                            }
                       }
                      Spacer().frame(height:8)
                      HStack  {
                          Text("Model: 185cm tall and size L").foregroundColor(.black).font(.system(size: 16).bold()).opacity(0.6)
                          Spacer().frame(width:115)
                      }
                      .frame(alignment:.leading)
                      
                      Spacer().frame(height:17)
                      
                      HStack(alignment: .top, spacing: 10 ) {
                           VStack( spacing: 8) {
                              Spacer().frame(height:21)
                              Divider()
                             
                              Spacer().frame( height: 75 )
                              ForEach(sizes,id: \.self) { i in
                                  Divider()
                                  Button{
                                      selectedSize = i
                                   } label:{
                                      HStack {
                                          Text("\(i)").font(.system(size: 16))
                                           .padding(.vertical,8)
                                          .padding(.horizontal,15)
                                          .background ( .thinMaterial)
                                       }
                                        .frame(width: 380,height:35,alignment: .leading)
                                        .foregroundColor(selectedSize == i ? .red.opacity(0.9) : .black)
 
                                      Spacer().frame(width:135)
                                   }
                              }.frame(width: 397, height: 20, alignment: .leading)
                          }
                          Spacer().frame(width:105)
                      } // HStack Finish
                      .padding()
                      .frame(width: 350, height: 120,alignment: .center )
                      .background(.thinMaterial)
                     
                      .ignoresSafeArea()
                      Spacer().frame(height:720)
                  }
              }.height(.proportional(0.50))
                    Spacer().frame(height:83)
                      .ignoresSafeArea()
              }.frame(width: UIScreen.main.bounds.width, height: isshowing ? 630 : 230 , alignment: .bottomLeading).background(.thinMaterial).cornerRadius(22)
                  .ignoresSafeArea()
      }

      })
      .padding(.horizontal)
      .background(  )
      .ignoresSafeArea(.all, edges: .all)
        
    })
    .zIndex(0)
    .ignoresSafeArea(.all, edges: .all)
    .background(   )
 
  }

     func addBasket() {
        let fireStore = Firestore.firestore()
        let userDictionary = ["name" : product.name,"image": product.image, "price": product.formattedPrice,"size": selectedSize,"uid": Auth.auth().currentUser?.uid]
        
        fireStore.collection("UserBasket").addDocument(data: userDictionary) { (error) in
             if error != nil {
                    print(error?.localizedDescription)
             }
             else {}
           }
        }
    
    func addFavorite() {
        let fireStore = Firestore.firestore()
        let userDictionary = ["name" : product.name,"image": product.image, "price": product.formattedPrice,"size": selectedSize]
        
        fireStore.collection("UserFavourites").addDocument(data: userDictionary) { (error) in
             if error != nil {
                    print(error?.localizedDescription)
             }
           }
        }
    
    

}



