//
//  ManCategoryView.swift
//  Shopping
//
//  Created by Meriç on 16.08.2022.
//

import SwiftUI

struct ManCategoryView: View {
    @State var gender : String = "male"
    @State var spacer: Bool = false

    var body: some View {
        
        ScrollView(.vertical)  {
            VStack(alignment:.leading,spacing: 20)  {
                
                if spacer == true {
                    Spacer().frame(height:80)

                }
                
                // Arrivals
                 HStack{
                    Spacer().frame(width:107)
                    AdvertisementTabView()
                        .frame(width:350,height: 165)
                 }
                
                    NavigationLink {
                        TshirtView( Gender: $gender, spacer: $spacer)
                    } label: {
                        VStack{
                            HStack{
                                Spacer().frame(width:40)
                                Image("tshirtman").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                                Spacer().frame(width:30)
                                Text(" T-SHIRTS").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:100)
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
                                Spacer().frame(width:70)
                                Image("nauticamann").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                               
                                ZStack{
                                    Text("NAUTICA").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:90)
                                    Text("NEW COLLECTION").font(.system(size: 13).bold()).opacity(0.8).foregroundColor(.yellow).offset(x: 100, y:-17).frame(width: 200 )
                                }.frame(width:150)
                          
                                Spacer().frame(width:200)
                                
                            }.frame(height: 80 )
                            Divider().background(Color.white).opacity(0.8)
                        }
                    }
                    
                   NavigationLink {
                       PantsView(Gender: $gender, spacer: $spacer)
                    } label: {
                        VStack {
                            HStack{
                                Spacer().frame(width:89)
                                Image("pantsman").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                                Spacer().frame(width:11)

                                ZStack{
                                    Text("   TROUSERS").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:120)
                                    Text("NEW COLLECTION").font(.system(size: 13).bold()).opacity(0.8).foregroundColor(.yellow).offset(x: 100, y:-17).frame(width: 200 )
                                }.frame(width:150)
                                Spacer().frame(width:221)
                            }.frame(height: 80 )
                            Divider().background(Color.white).opacity(0.8)
                        }
                    }
                    

                    Button {
                        print("asdasd")
                    }label: {
                        VStack{
                            HStack{
                                Spacer().frame(width:86)
                                Image("accessoryman").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                                Spacer().frame(width:25)

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
                            Spacer().frame(width:68)
                            Image("jacketsman").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                            Spacer().frame(width:12)

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
                        VStack {
                            HStack{
                                Spacer().frame(width:95)
                                Image("sweatshirtsman").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                                Spacer().frame(width:34)

                                ZStack{
                                    Text(" SWEATSHIRTS").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:160)
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
                            Spacer().frame(width:68)
                            Image("shortswomen").resizable().frame(width:85   , height:85 ).cornerRadius(15)
                           
                            ZStack{
                                Text("SHORTS").font(.system(size: 20).bold()).opacity(0.85).foregroundColor(.black).frame(width:90)
                            }.frame(width:150)
                      
                            Spacer().frame(width:203)
                        }.frame(height: 80 )
                        Divider().background(Color.white).opacity(0.8)
                    }
                }
                }.frame( alignment: .top)
            }.frame(alignment:.top)
             .navigationBarHidden(true)
    }
}


