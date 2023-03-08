//
//  basketView.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//


import SwiftUI
import Firebase


 

struct basketView: View {
    
    @State var Totalprice = ""
    @State private var counter: Int = 0
    @ObservedObject  var obser = observer()
    @State var showcargoScreen = false //  showcargoScreen Button Animation
    @State var isActive : Bool = false
    @State var showNestedView: Bool = false


    var body: some View {
        VStack {
            Spacer().frame(height:65)
                ScrollView(.vertical){
                    HStack(alignment: .top ){
                              Text("My Basket").font(.system(size: 25).bold()).foregroundColor(.black)
                              Spacer().frame(width:210)
                    }
                    Divider()
                    HStack(spacing:14){
                        Image("omg").resizable().frame(width: 45, height: 45).rotationEffect(.degrees(330))
                        
                        VStack(alignment:.leading, spacing:5){
                            
                            Text("Free shipping!").font(.system(size: 17).bold()).foregroundColor(.green).opacity(0.85)
                            Text("You get free standard shipping to the address").font(.system(size: 14)).foregroundColor(.black)
                        }
                    }.frame(width: 380, height: 50)

                    Divider().opacity(0.8)
                        
                    ForEach(obser.userBasket){ product in
                        HStack {
                            CartRowBasketView(Totalprice: $Totalprice, userbasket: product)
                        }
                    } // ForEach
                   
                    VStack{
                         Spacer().frame(height:23)
                         Divider()
                         HStack{
                             Image("megaphone").resizable().frame(width: 25, height: 24 )
                             Spacer().frame(width:12)
                             Text("Discount code").font(.system(size: 18).bold()).foregroundColor(.black)
                             Spacer().frame(width:150)
                             Text("Add ").font(.system(size: 14).bold()).foregroundColor(.black)
                         }.frame(width: 370, height:40)
                    Divider()
                    }
                    .navigationBarHidden(true)
                } // Scroll View
                .frame( alignment: .topLeading)
 
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.purple)
//
//
             .cornerRadius(15)
 
             Spacer().frame(height:55)
            
            VStack(spacing:-10){
          
//                HStack(alignment: .top,spacing: 6) {
//                    HStack(spacing:10) {
//                        Spacer().frame(width: 8 )
//                        Text("TOTAL").font(.system(size: 19).bold()).foregroundColor(.black)
//                        Text("(VAT included)").font(.system(size: 12).bold()).foregroundColor(.black).opacity(0.75)
//
//                    }.frame(width: 180, height: 30, alignment: .leading)
//
//                    Spacer().frame(width:60)
//                    HStack(spacing:17){
//                        Text(String(Totalprice)).font(.system(size: 20).bold()).foregroundColor(.black)
//                        Button {
//
//                        } label: {
//                            HStack{
//                                Image(systemName: "chevron.up").resizable().frame(width: 13, height: 8).foregroundColor(.black).font(.system(size: 11).bold())
//                            }
//                        }
//                    }.frame(width: 120, height: 30, alignment: .center)
//                }.frame(width: 370, height: 60, alignment: .leading)
//
                
                
//                 NavigationLink {
//                      cargoScreen(Totalprice: $Totalprice)
//                   } label: {
//                    HStack{
//                        Text("CHECKOUT").font(.system(size: 19).bold()).foregroundColor(.white)
//                    }
//                    .frame(width: 340, height: 50)
//                    .background(.green)
//                    .opacity(0.79)
//                    .cornerRadius(5)
//                   }
//                   .isDetailLink(false)
              
                Button(action: { showNestedView = true }) {
                                        HStack{
                                            Text("CHECKOUT").font(.system(size: 19)).foregroundColor(.white)
                                        }
                                        .frame(width: 340, height: 50)
                                        .background(
                                            Rectangle()
                                                .fill(.green)
                                                .cornerRadius(12)
                                         )
                                        .opacity(0.79)
                                        .cornerRadius(12)
                }

                NavigationLink(destination: cargoScreen(Totalprice: $Totalprice, showNestedView: $showNestedView )
                               ,isActive: $showNestedView) {
                                EmptyView()
               }.isDetailLink(false)
  
                .navigationBarHidden(true)

                Spacer().frame(height:15)
            } // MARK:  CHECKOUT VStack
            .frame(width: 370, height: 100, alignment: .bottom)
             
            
            Spacer().frame(height:105)
             .navigationBarHidden(true)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .leading)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
 }



struct basketViewPreview: PreviewProvider {
    static var previews: some View {
        basketView()
    }
}
