//
//  WomenCategoryView.swift
//  Shopping
//
//  Created by Meriç on 16.08.2022.
//

import SwiftUI

struct WomenCategoryView: View {
    @State var gender : String = "female"
    @State var spacer: Bool = false
    var body: some View {

        ScrollView(.vertical)  {
            VStack(alignment:.leading,spacing: 20)  {
                
                if spacer == true {
                    Spacer().frame(height:80)

                }
                    // Arrivals
                HStack{
                    Spacer().frame(width:93)
                    AdvertisementTabView()
                        .frame(width:350,height: 165)
                 }
          
                NavigationLink {
                    TshirtView( Gender: $gender, spacer: $spacer)
                    } label: {
                        VStack{
                            HStack{
                                Spacer().frame(width:35)
                                Image("womentshirts").resizable().frame(width:85, height:85 ).cornerRadius(15)
                                Spacer().frame(width:30)
                                Text(" T-SHIRTS").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:100)
                                Spacer().frame(width:200)
                            }.frame(height: 80 )
                        Divider().background(Color.white).opacity(0.8)
                        }
                     
                    }
                    
                NavigationLink {
                        
                    }label: {
                        
                        VStack{
                            HStack{
                                Spacer().frame(width:60)
                                Image("nautica").resizable().frame(width:85,height:85 ).cornerRadius(15)
                               
                                ZStack{
                                    Text("NAUTICA ").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:90)
                                    Text("NEW COLLECTION").font(.system(size: 13).bold()).opacity(0.8).foregroundColor(.yellow).offset(x: 100, y:-17).frame(width: 200 )
                                }.frame(width:150)
                                Spacer().frame(width:200)
                            }.frame(height: 80 )
                            Divider().background(Color.white).opacity(0.8)
                        }
                    }
                    
                NavigationLink {
                    PantsView(Gender: $gender, spacer: $spacer)
                }label: {
                        VStack {
                        
                            HStack{
                                Spacer().frame(width:60)
                                Image("pantswomen").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                                Spacer().frame(width:10)

                                ZStack{
                                    Text("  TROUSERS ").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:150)
                                    Text("NEW COLLECTION").font(.system(size: 13).bold()).opacity(0.8).foregroundColor(.yellow).offset(x: 100, y:-17).frame(width: 200 )
                                }.frame(width:150)
                             

                                Spacer().frame(width:200)

                            }.frame(height: 80 )
                            Divider().background(Color.white).opacity(0.8)
                        }
                      
                    }
                    

                    Button {
                        print("asdasd")
                    }label: {
                        VStack{
                        
                            HStack{
                                Spacer().frame(width:60)
                                Image("dresses").resizable().frame(width:85   , height:85 ).cornerRadius(15)

                                ZStack{
                                    Text("DRESSES").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:90)
                                }.frame(width:150)
                          
                                Spacer().frame(width:200)
                            }.frame(height: 80 )
                            Divider().background(Color.white).opacity(0.8)

                        }
                    }
                    
                    Button {
                        print("asdasd")
                    }label: {
                        VStack {
                            HStack{
                                Spacer().frame(width:76)
                                Image("accessory").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                                Spacer().frame(width:24)

                                ZStack{
                                    Text("ACCESSORY").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:120)
                                }.frame(width:150)
                          
                                Spacer().frame(width:200)
                            }.frame(height: 80 )
                            Divider().background(Color.white).opacity(0.8)

                        }
                      
                    }
                    
                    Button {
                        print("asdasd")
                    }label: {
                        VStack{
                            HStack{
                                Spacer().frame(width:60)
                                Image("jacketwomen").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                               
                                ZStack{
                                    Text("JACKETS ").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:90)
                                }.frame(width:150)
                          
                                Spacer().frame(width:200)
                            }.frame(height: 80 )
                            Divider().background(Color.white).opacity(0.8)

                        }
                 
                    }
                    
                    Button {
                        print("asdasd")
                    }label: {
                        VStack{
                            HStack{
                                Spacer().frame(width:60)
                                Image("shortswomen").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                               
                                ZStack{
                                    Text("SHORTS").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:90)
                                }.frame(width:150)
                          
                                Spacer().frame(width:200)
                            }.frame(height: 80 )
                            Divider().background(Color.white).opacity(0.8)
                        }
                    }
                }.frame( alignment: .top)
                   
            }.frame(alignment:.top)
        .navigationBarHidden(true)
    }
}


