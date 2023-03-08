//
//  DeliveryAddress.swift
//  Shopping
//
//  Created by Meric on 21.08.2022.
//

import SwiftUI
import MapKit
import FirebaseAuth

struct DeliveryAddress: View {
    
    @Binding var showNestedView: Bool
    @Binding var Totalprice: String
    @ObservedObject var obser = observer()
    @Binding var selectedDelivery : String
    @State var chc = false
//    @Binding var rootIsActivee : Bool
     @State var selectedAddress = ""
    @State var selectedRecipient = ""
    @State var selectedPhone = ""
    

    func boxNav() -> some View {
        VStack(spacing:10){
            
            NavigationLink {
                PurchaseScreen( showNestedView: $showNestedView, Totalprice: $Totalprice, selectedDelivery: $selectedDelivery, selectedAddress: $selectedAddress, selectedRecipient: $selectedRecipient, selectedPhone: $selectedPhone)
                  
             } label: {
                ZStack {
                   Circle()
                           .stroke(chc ? Color.green: Color.black,lineWidth: 1)
                           .frame(width: 18, height: 18 )
                   if chc {
                       Image(systemName: "checkmark.circle.fill")
                           .font(.system(size: 18  ))
                           .foregroundColor(Color.green)
                     }
                 }
              }.isDetailLink(false)
          }
      }
    
    var body: some View {
        
        VStack(alignment:.center) {
            
            HStack{
               Image(systemName: "chevron.left").resizable().frame(width: 10, height: 16 ).foregroundColor(.black)
               Text("Back").font(.system(size: 15).bold()).foregroundColor(.black)
               Spacer().frame(width:322)
           }
                
            Spacer().frame(height:18)
            Divider()
            
            ForEach(obser.userOrderinformation) { info in
                if Auth.auth().currentUser?.uid == info.uid {
                     HStack(alignment: .top ) {
                        Spacer().frame(width:13)
                             Button {
                                 withAnimation {
                                     chc.toggle()
                                 }
                                 selectedPhone = info.phone
                                 selectedAddress = info.Address
                                 selectedRecipient = info.recipient
                                
                              } label: {
                                    boxNav()
                               }
                         
                        Spacer().frame(width:20)
                        VStack(alignment:.leading,spacing:8) {
                            
                            // MARK: Username
                            HStack{
                                Text(info.recipient).font(.system(size: 17).bold())
                            }
                            
                            // MARK: Address
                            HStack{
                                Text(info.Address).font(.system(size: 15))
                            }
                            
                            // MARK: Phone
                            HStack{
                                Text(info.phone).font(.system(size: 14))
                            }
                            Spacer()
                        }.frame(width: 300, height: 130,alignment: .leading )
                      
                        NavigationLink { } label: {
                            HStack {
                                Image(systemName: "pencil").resizable().frame(width: 16, height: 16 ).foregroundColor(.black).opacity(0.6)
                            }
                        }
                     }.frame(width: UIScreen.main.bounds.width, height: 150 , alignment: .leading)
                 }
             }
                Divider()
               // MARK: Another Address Link
                Spacer().frame(height:26)
            
                NavigationLink {
                    
                } label: {
                    VStack {
                        HStack {
                            Text("Another Address ").font(.system(size: 16)).foregroundColor(.black)
                        }.frame(width: 350, height: 50 )
                            .background(.white).opacity(0.9)
                            .border(.black)
                  
                    }.frame(alignment: .bottom)
                }
                Spacer().frame(height:150)

            // MARK: Continue
            NavigationLink {
                PurchaseScreen( showNestedView: $showNestedView, Totalprice: $Totalprice, selectedDelivery: $selectedDelivery, selectedAddress: $selectedAddress, selectedRecipient: $selectedRecipient, selectedPhone: $selectedPhone)
            } label: {
                VStack {
                    HStack {
                        Text("Continue").font(.system(size: 16).bold()).foregroundColor(.white)
                    }.frame(width: 350, height: 50 )
                        .background(.black).opacity(0.9)
                    Spacer().frame( height: 90 )
                }.frame(alignment: .bottom)
            }
            .isDetailLink(false)
            
        } // MARK:  Main VStack
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height , alignment: .center)
        .navigationBarHidden(true)
    }
}

struct CheckBox: View {
     @Binding var selectedchc : Bool
     var body: some View  {
         Button {
             selectedchc  = true
         } label: {
             Image(systemName: self.selectedchc == true ? "checkmark.circle.fill" : "circle.fill")
         }
     }
 }

