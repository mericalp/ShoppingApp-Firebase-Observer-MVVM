//
//  PurchaseScreen.swift
//  Shopping
//
//  Created by Meric on 20.08.2022.
//


import SwiftUI
import Firebase
import FirebaseAuth


struct PurchaseScreen: View {
    @Binding var showNestedView: Bool
    @State private var shouldTransit: Bool = false //    add order Firebase
    @Binding var Totalprice: String
    @EnvironmentObject var viewModel: LoginViewModel
    @ObservedObject var obser = observer()
    @Environment(\.presentationMode) var presentationMode
    @State var promoCode :String = ""
    @State var Invoice :Bool = false
    @Binding var  selectedDelivery: String
    @Binding var selectedAddress :String
    @Binding var selectedRecipient :String
    @Binding var selectedPhone :String
    @State var date =  Date()
    @State private var selection: String? = nil
    @State var showFinishOrder = false // Filter Button Animation


//    @Binding var rootIsActive : Bool

    func addOrder(product:UserBasketModel) {
        let fireStore = Firestore.firestore()
        let userDictionary = ["name" : product.name,"image": product.image, "price": product.formattedPrice,"size": product.size, "uid":Auth.auth().currentUser?.uid,"delivery":selectedDelivery,"addres":selectedAddress,"recipient":selectedRecipient,"phone":selectedPhone,"date":date ] as [String : Any]
        fireStore.collection("UserOrder").addDocument(data: userDictionary) { (error) in
             if error != nil {
                    print(error?.localizedDescription)
             }
        }
    }
    
    private func OrderView(product:UserBasketModel) -> some View {
         ScrollView(.vertical){ }
         .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
    }
    
    // MARK: BODY
    var body: some View {
        
        VStack(alignment:.leading) {
            Spacer().frame(height:52)
            HStack{
                Spacer().frame(width:16)
              Image(systemName: "chevron.left").resizable().frame(width: 10, height: 16 ).foregroundColor(.black)
              Text("Cancel").font(.system(size: 15).bold()).foregroundColor(.black)
            }
            Spacer().frame(height:23)
            Divider()
            ScrollView(.vertical){
                VStack(spacing:0){
                    Group {
                    
                    // MARK: Payment
                    HStack(alignment: .top) {
                        Text("Payment").font(.system(size: 18)).foregroundColor(.black)
                        Spacer().frame(width:280)
                    }
                    Spacer().frame(height:5)

                    HStack(alignment: .top) {
                        Text("Entry Payment Method").font(.system(size: 15).bold()).foregroundColor(.black).opacity(0.5).offset(y:5)
                        Spacer().frame(width:155)
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Image(systemName: "pencil").resizable().frame(width: 16, height: 16 ).foregroundColor(.black).opacity(0.6)
                            }.frame(width: 30, height: 30 )
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width,height:60)
                        .background(.thinMaterial)
                    Spacer().frame(height:11)
              }
              Group {
                    // MARK: PROMO CODE -- TEXTFIELD
                    HStack(alignment: .top) {
                        Spacer().frame(width:8)

                            TextField("  Entry Promo Code ", text: $promoCode)
                                .frame(width: 230, height: 48)
                                .background(.white)
                                .cornerRadius(10)
                                .border(.gray).opacity(0.6)
                        Spacer().frame(width:15)
                        HStack{
                            Text("Add").foregroundColor(.white)
                        }
                        .frame(width: 120, height: 48  )
                        .background(.gray)
                    }.frame(alignment:.leading)
                  Spacer().frame(height:15)
                  Divider()
                  Spacer().frame(height:15)

                  // MARK: Invoice
                    HStack(alignment: .top) {
                        Text("Invoice").font(.system(size: 18)).foregroundColor(.black)
                        Spacer().frame(width:290)
                    }
                  Spacer().frame(height:11)

                  HStack(alignment: .top) {
                      Spacer().frame(width:22)
                      Text("E-Invoice ").font(.system(size: 15).bold()).foregroundColor(.black).opacity(0.5).offset(y:5)
                      // MARK: TOOGLE Invoice
                      Toggle("", isOn: $Invoice)
                      Spacer().frame(width:19)

                      
                      
                  }
                  .frame(width: UIScreen.main.bounds.width,height:60)
                      .background(.thinMaterial)
                  
                  Spacer().frame(height:11)

                  // MARK: Product
                    HStack(alignment: .top) {
                        Text("Product").font(.system(size: 18)).foregroundColor(.black)
                        Spacer().frame(width:284)
                    }
              }
                  Spacer().frame(height:11)
                    
               Group {
                  HStack(alignment: .top) {
                      Text("Products").foregroundColor(.black).font(.system(size: 16)).opacity(0.6)
                      Spacer().frame(width: 265)
                      Image(systemName: "chevron.up").resizable().frame(width: 15, height: 9).foregroundColor(.black).opacity(0.6)
                  }
                  .frame(width: UIScreen.main.bounds.width,height:60)
                      .background(.thinMaterial)
                   Spacer().frame(height:20)
                   HStack(alignment: .top) {
                       Text("Legal Sections").font(.system(size: 18)).foregroundColor(.black)
                       Spacer().frame(width:229)
                   }
                   Spacer().frame(height:18)
                   Divider()

                   NavigationLink { } label: {
                       HStack {
                           Text("Terms and conditions of purchase").font(.system(size: 15)).foregroundColor(.black)
                           Spacer().frame(width:115)
                           Image(systemName: "chevron.right").resizable().frame(width: 10, height: 15 ).foregroundColor(.black).opacity(0.7)
                       }.frame( height: 60)
                   }
                   Spacer().frame(height:5)
                   Divider()

                   NavigationLink { } label: {
                       HStack(alignment:.center) {
                           Text("Distance Selling Contract").font(.system(size: 15)).foregroundColor(.black)
                           Spacer().frame(width:174)
                           Image(systemName: "chevron.right").resizable().frame(width: 10, height: 15 ).foregroundColor(.black).opacity(0.7)
                       }.frame( height: 60,alignment:.center)
                   }
                  }
                    Group {
                        Spacer().frame(height:5)
                        Divider()
                        NavigationLink { } label: {
                            HStack {
                                Text("Cancellation Policy").font(.system(size: 15)).foregroundColor(.black)
                                Spacer().frame(width:215)
                                Image(systemName: "chevron.right").resizable().frame(width: 10, height: 15 ).foregroundColor(.black).opacity(0.7)
                            }.frame( height: 60)
                        }
                        Divider()
                        Spacer().frame(height:5)
                        
                    }
               }
            }
            
            VStack{
                HStack(){
                    VStack(alignment: .leading, spacing: 5){
                        Text("TOTAL").foregroundColor(.black).opacity(0.8).font(.system(size: 18).bold())
                        Text("(vad include)").foregroundColor(.black).opacity(0.5).font(.system(size: 13))

                    }
                    Spacer().frame(width:230)
                    HStack{
                        Text(String(Totalprice)).foregroundColor(.black).opacity(0.8).font(.system(size: 19).bold())
                    }
                }
                
                Spacer().frame(height:20)
             
                 Button {
                     withAnimation {
                        showFinishOrder.toggle()
                     }
                     
                        for product in obser.userBasket {
                          addOrder(product: product)
                           obser.deleteBasket(ToDelete: product)
                      }
                } label: {
                    HStack {
                         Text("Confirm Payment").foregroundColor(.white).font(.system(size: 16).bold())
                     }
                     .frame(width: 270, height: 40)
                     .background(.black).opacity(0.9)
                 }
                .fullScreenCover(isPresented: $showFinishOrder) {
                    FinishOrderView(showNestedView: $showNestedView )
                }
                
                Spacer().frame(height:65)
                
            }.frame(width: UIScreen.main.bounds.width, height: 180 )
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .navigationBarHidden(true)
    }
}

