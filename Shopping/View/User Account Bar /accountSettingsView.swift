//
//  accountSettingsView.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//

import SwiftUI


struct accountSettingsView: View {
    
    var body: some View {
        VStack {
            
       ScrollView(.vertical) {
           Spacer().frame(height:50)
        VStack(alignment: .leading, spacing: 8) {
       
            NavigationLink {
            } label: {
                HStack  {
                    Spacer().frame(width:15)
                    Image(systemName: "person").resizable().frame(width: 21, height: 21 ).foregroundColor(.black)
                    Spacer().frame(width:10)
                    Text("User Information").font(.system(size: 18).bold()).foregroundColor(.black)
                    Spacer().frame(width:170)
                    Image(systemName: "chevron.right").resizable().frame(width: 11, height: 14).foregroundColor(.black)
                
                }.frame(width: 390, height: 60, alignment: .leading)
                    .background(.white   )
                    .cornerRadius(22)
            }
                Divider()
            
            NavigationLink {
                passwordRestView()
            } label: {
                
                HStack  {
                    Spacer().frame(width:15)
                    Image(systemName: "lock").resizable().frame(width: 15, height: 21 ).foregroundColor(.black)
                    Spacer().frame(width:18)
                    Text("Password ").font(.system(size: 18).bold()).foregroundColor(.black)
                    Spacer().frame(width:225)
                    Image(systemName: "chevron.right").resizable().frame(width: 11, height: 14).foregroundColor(.black)
                
                }.frame(width: 390, height: 60, alignment: .leading)
                    .background(.white   )
                    .cornerRadius(22)

            }
        
            Divider()
            
            NavigationLink {
                
            } label: {
                
                HStack  {
                    Spacer().frame(width:15)
                    Image(systemName: "mappin.and.ellipse").resizable().frame(width: 21, height: 21 ).foregroundColor(.black)
                    Spacer().frame(width:16)
                    Text("Adress").font(.system(size: 18).bold()).foregroundColor(.black)
                    Spacer().frame(width:247)
                    Image(systemName: "chevron.right").resizable().frame(width: 11, height: 14).foregroundColor(.black)
                
                }.frame(width: 390, height: 60, alignment: .leading)
                    .background(.white   )
                    .cornerRadius(22)

            }
        
            Divider().opacity(0.7)
        
            NavigationLink {
                
            } label: {
                
                HStack  {
                    Spacer().frame(width:15)
                    Image(systemName: "creditcard").resizable().frame(width: 21, height: 15 ).foregroundColor(.black)
                    Spacer().frame(width:16)
                    Text("Cart Information").font(.system(size: 18).bold()).foregroundColor(.black)
                    Spacer().frame(width:166)
                    Image(systemName: "chevron.right").resizable().frame(width: 11, height: 14).foregroundColor(.black)
                
                }.frame(width: 390, height: 60, alignment: .leading)
                    .background(.white   )
                    .cornerRadius(22)

            }
            Divider().opacity(0.7)
            
            NavigationLink {
                
            } label: {
                
                HStack  {
                    Spacer().frame(width:15)
                    Image(systemName: "globe.americas").resizable().frame(width: 23, height: 23 ).foregroundColor(.black)
                    Spacer().frame(width:14)
                    Text("Change Country").font(.system(size: 18).bold()).foregroundColor(.black)
                    Spacer().frame(width:167)
                    Image(systemName: "chevron.right").resizable().frame(width: 11, height: 14).foregroundColor(.black)
                
                }.frame(width: 390, height: 60, alignment: .leading)
                    .background(.white   )
                    .cornerRadius(22)

            }
            
            Divider().opacity(0.7)
            
        }.frame(width: UIScreen.main.bounds.width, height: 480, alignment: .leading)
          .ignoresSafeArea()
        }
            Spacer().frame(height: -2)
            
            
            VStack{
                
                HStack {
                    Spacer().frame(width:10)

                HStack  {
                    
                    HStack {
                        Image("smartphone").resizable().frame(width: 75, height: 100 )
                    
                    }.frame(width: 80 , height: 135)
                       

                    VStack {
                        HStack {
                            Text("Version: 1.1.12").font(.system(size: 13).bold()).foregroundColor(.black)
                            Spacer().frame(width:45)
                        }
                        Spacer().frame( height:10 )
                        Text("There is a new version of the app!").font(.system(size: 15).bold()).foregroundColor(.black)
                        Spacer().frame( height:30 )
                    }.frame(width: 140 , height: 135)
                  
                    Button { } label: {
                        HStack {
                            Text("Update").font(.system(size: 18).bold()).foregroundColor(.black)
                        }.frame(width: 110 , height: 40)
                            .background(.purple).opacity(0.8)
                            .cornerRadius(20)
                    }
                
                }.frame(width: 360, height: 150 )
                    .background(.white).opacity(0.7)
                    .cornerRadius(25)
                }
             Spacer().frame(height:80)
            
            }.frame(width: UIScreen.main.bounds.width, height: 370, alignment: .leading)
                .background(.thinMaterial)
                .cornerRadius(28)
                .ignoresSafeArea()
        }.ignoresSafeArea()
    }
}

struct accountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        accountSettingsView()
    }
}

