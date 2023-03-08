//
//  cargoScreen.swift
//  Shopping
//
//  Created by Meric on 21.08.2022.
//

import SwiftUI
import FirebaseAuth

 
var delivery = ["HOME DELIVERY","STORE DELIVERY","SAME DAY DELIVERY"]
 
struct cargoScreen: View {
    @Binding var Totalprice: String
    @State var selectedDelivery  = ""
    @State var chc1 : Bool = false
    @State var chc2 : Bool = false
    @State var chc3 : Bool = false
 //    @Binding var rootIsActive : Bool
    @Binding var showNestedView: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading , spacing: 10 ) {
                Spacer().frame(height:25)
                VStack(alignment: .leading ) {
                    HStack{
                        Spacer().frame(width:16)
                        Image(systemName: "xmark").resizable().frame(width: 18, height: 18 ).foregroundColor(.red).opacity(0.6)
                    }
                    Spacer().frame(height:14)
                // HOMEDELIVERY
                Divider()
                HStack(alignment: .top ) {
                    Spacer().frame(width:13)
                    Button {
                        withAnimation {
                            chc1.toggle()
                        }
                        selectedDelivery = "STORE DELIVERY"
                    }label: {
                        ZStack{
                          Circle()
                                  .stroke(chc1 ? Color.green: Color.gray,lineWidth: 1)
                                  .frame(width: 18, height: 18 )
                          if chc1 {
                              Image(systemName: "checkmark.circle.fill")
                                  .font(.system(size: 18  ))
                                  .foregroundColor(Color.green)
                              }
                          }
                     }
                    Text(" STORE DELIVERY   ").font(.system(size: 15).bold()).foregroundColor(.black)
                    Spacer().frame(width:135)
                    Text(" FREE ").font(.system(size: 15).bold()).foregroundColor(.green).opacity(0.7)
                    Spacer().frame(width:5)
                    Image(" ").resizable()  .frame(width: 23, height: 23 )

                }.frame(width: UIScreen.main.bounds.width, height: 50 , alignment: .leading)
                    
                Divider()
                
                // STORE DELIVERY
                HStack {
                    Spacer().frame(width:12)
                    Button {
                        withAnimation {
                            chc2.toggle()
                        }
                        selectedDelivery = "HOME DELIVERY"
                    } label: {
                        ZStack{
                          Circle()
                                  .stroke(chc2 ? Color.green: Color.gray,lineWidth: 1)
                                  .frame(width: 18, height: 18 )
                          if chc2 {
                              Image(systemName: "checkmark.circle.fill")
                                  .font(.system(size: 18  ))
                                  .foregroundColor(Color.green)
                              }
                          }
                          
                    }
                    Text(" HOME DELIVERY        ").font(.system(size: 15).bold()).foregroundColor(.black)

                    Spacer().frame(width:135)
                    Text(" 5$  ").font(.system(size: 15).bold()).foregroundColor(.green).opacity(0.7)
                    Spacer().frame(width:5)
                    Image(" ").resizable()  .frame(width: 23, height: 23 )

                }.frame(width: UIScreen.main.bounds.width, height: 50 , alignment: .leading)
                    
                Divider()
                    
                // SAME DAY DELIVERY
                HStack {
                    Spacer().frame(width:12)
                    Button {
                        withAnimation {
                            chc3.toggle()
                        }
                        selectedDelivery = "SAME DAY DELIVERY"
                    } label: {
                        ZStack{
                          Circle()
                                  .stroke(chc3 ? Color.green: Color.gray,lineWidth: 1)
                                  .frame(width: 18, height: 18 )
                          if chc3 {
                              Image(systemName: "checkmark.circle.fill")
                                  .font(.system(size: 18  ))
                                  .foregroundColor(Color.green)
                              }
                          }
                     }
                    Text(" SAME DAY DELIVERY     ").font(.system(size: 15).bold()).foregroundColor(.black)

                    Spacer().frame(width:100)
                    Text("     8$ ").font(.system(size: 15).bold()).foregroundColor(.green).opacity(0.7)
                    Spacer().frame(width:5)
                    Image(" ").resizable()  .frame(width: 23, height: 23 )
                    }.frame(width: UIScreen.main.bounds.width, height: 50 , alignment: .leading)
                 
                    Divider()
                }
                 Spacer().frame(height:300)
             }.frame(width: UIScreen.main.bounds.width, height: 500, alignment: .leading)
//            .onTapGesture {
//                 chc.toggle()
//            }
            Spacer().frame(height:100)
            
            NavigationLink {
                DeliveryAddress( showNestedView: $showNestedView, Totalprice: $Totalprice, selectedDelivery: $selectedDelivery)
             } label: {
                VStack {
                    HStack {
                        Text("Continue").font(.system(size: 16).bold()).foregroundColor(.white)
                    }.frame(width: 290, height: 50 )
                        .background(.black).opacity(0.9)
                    Spacer().frame( height: 90 )
                }.frame(alignment: .bottom)
            } .isDetailLink(false)

           
            
            
            
        } // MARK: VStack Main
        .navigationBarHidden(true)
//        .toolbar {
//            ToolbarItem (placement: .navigationBarLeading) {
//                Button {
//                    presentationMode.wrappedValue.dismiss()
//                } label: {
//                    HStack{
//                        Image(systemName: "xmark").resizable().frame(width: 20, height: 20 ).foregroundColor(.red).opacity(0.6)
//                    }
//                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationTitle("DELIVERY")
        
    }
}




    
