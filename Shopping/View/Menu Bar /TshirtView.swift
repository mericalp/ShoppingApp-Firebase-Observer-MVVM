//
//  TshirtView.swift
//  Shopping
//
//  Created by Meriç on 16.08.2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct TshirtView: View {
    
    @ObservedObject var obser = observer()
    @State private var isAnimated: Bool = false
    @State var isLiked = true
    @Binding var Gender : String
    @State var SortFilter = false
    @Binding var spacer : Bool
    @Environment(\.presentationMode) var presentationModee
    @State var showFilter = false // Filter Button Animation
    @State  var chc = false     // Checked  join life Filter
    @State var selectedCategory : String = ""
    @State var refresh =  Refreshh(started:false,released: false)

     private func DetView(product:Product) -> some View {
        
        NavigationLink {
            ProductDetailView(product: product)
            
        } label: {
            
            if product.category == "tshirts" {
                if product.gender == Gender {
         
              
               
                    VStack  {
                         // PHOTO
                        ZStack {
                            AnimatedImage(url: URL(string:product.image)).resizable().frame(width: 175, height: 220 ).cornerRadius(18)
                        } // ZStack
                        
                        HStack {
                                Spacer().frame(width:45)
                                Text(product.name).font(.system(size: 15).bold()).foregroundColor(.black)
                         } .frame(width: 250, height:15 ,alignment: .leading)
                            
                          HStack {
                              Spacer().frame(width:6)
                                  Text(product.formattedPrice)
                                     .font(.system(size: 16))
                                     .foregroundColor(.black)
                                     .frame(width:110,height:12)
                            Spacer().frame(width:57)
                                   Image("bag").resizable().frame(width: 31, height: 31 ).foregroundColor(.black)
                            }
                           .frame(width: 250, height: 20 ,alignment: .leading)
 
                     }
             
           
                }
            }
        }
    }

    var body: some View {
        
        VStack{
            Spacer().frame(height:95)

            HStack{
                Text("T-Shirts").foregroundColor(.black).font(.title2)
                Spacer().frame(width:280)
             }
             .frame(width: UIScreen.main.bounds.width,height:50)
             .background(.white)
            
         ScrollView(.vertical, showsIndicators: false ) {
            
            GeometryReader{ reader -> AnyView in
                 DispatchQueue.main.async {
                    if refresh.OffsetStart == 0 {
                        refresh.OffsetStart = reader.frame(in: .global).minY
                    }
                    refresh.offset = reader.frame(in: .global).minY
                    
                    if refresh.offset - refresh.OffsetStart > 90 && !refresh.started {
                        refresh.started = true
                    }

                     
                    if refresh.OffsetStart == refresh.offset && refresh.started && !refresh.released{
                        withAnimation(Animation.linear){refresh.released = true}
                        update()
                        
                    }
                    
                }
                //  print(reader.frame(in: .global).minY)
                return AnyView(Color.black.frame(width: 0, height: 0))
              }
            .frame(width: 0, height: 0)
            
            
            ZStack ( alignment: Alignment(horizontal: .center, vertical: .top )) {
                 // MARK: Arrow and Indicator...
             
                 if refresh.started && refresh.released {
                    ProgressView()
                        .offset(y:-25)
                } else {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 16,weight: .heavy))
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: refresh.started ? 180:0))
                        .offset(y:-30)
                        .animation(.easeIn)
                }
                
                VStack{
                    
                    Spacer().frame(height:45)
                    LazyVGrid(columns: gridLayout2, spacing: 11) {
                            ForEach (obser.product) { product in
                                    DetView(product: product)
                                }
                    } //: GRID
                     .task {
                          spacer = true
                      }
                 
                } //  VSTACK
                .background(.white)
                
            }
            .offset(y:refresh.released ? 40 : -10)
            }
         }
        .navigationBarBackButtonHidden(true)
        .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                         Button {
                            self.presentationModee.wrappedValue.dismiss()
                        } label: {
                            HStack{
                                Image(systemName: "chevron.left").resizable().frame(width: 10, height: 16 ).foregroundColor(.black)
                                Text("Back").font(.system(size: 15).bold()).foregroundColor(.black)
                            }
                        }
                 }
 
                ToolbarItem(placement: .navigationBarTrailing) {
                     Button {
                        withAnimation {
                            showFilter.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "slider.horizontal.3").resizable().frame(width: 16, height: 16).foregroundColor(.black)
                        }.frame(width: 23, height: 39 )
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: $showFilter) {
                        FilteringScreenMenuView(chc: $chc, selectedCategory: $selectedCategory)
                    }
                }
            
            } // Tool Bar
            .background(.black.opacity(0.06))
            .ignoresSafeArea()
    }
 
    func update()  {
       
       print("update data...")
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
           withAnimation(Animation.linear) {
               refresh.released = false
               refresh.started = false
          }
       }
    }
    
 }

