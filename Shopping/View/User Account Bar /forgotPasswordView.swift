//
//  forgotPasswordView.swift
//  Shopping
//
//  Created by Meriç on 14.08.2022.
//

import SwiftUI

struct forgotPasswordView: View {
    @StateObject private var vm = LoginViewModel(servicee: ForgotPasswordServiceImpl() )
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment: .leading){
            
             VStack(alignment:.leading,spacing: 8) {
                Text("Reset \nPassword").font(.title).foregroundColor(.black)
                Text("Please enter your email address \nto request a password reset.").font(.system(size:14)).foregroundColor(.black).opacity(0.7)
             }
             .frame(width: 325, height: 166, alignment: .leading)
            
             Spacer().frame(height: 25)

             VStack {
                 
                 HStack {
                     Text("").font(.system(size:17)).foregroundColor(.black).opacity(0.9)
                  }
                  .frame(width: 325, alignment: .leading)
                 Spacer().frame(height: 16)
                 
                 TextField(" Email", text: $vm.email)
                    .frame(width: 330, height: 55 )
                    .background(.white)
                    .cornerRadius(16)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.black, lineWidth: 1)
                        )
                 Spacer().frame(height: 13)
            }
            
            Spacer().frame(height: 210)

            VStack(spacing:16) {
                HStack {
                    Spacer().frame(width:18)
                  Button {
                    vm.PasswordReset()
                 } label: {
                     HStack {
                         Text("Send Reset Pasword")
                             .foregroundColor(.white)
                             .font(.system(size: 16).bold())
                      }
                  
                 }
                 .frame(width: 296, height: 55 )
                 .background(.black).opacity(0.9)
                 .cornerRadius(16)
                }
                HStack {
                    Text("    Remember your password?").font(.system(size:14)).foregroundColor(.black).opacity(0.7)
                    Button {
                      } label: {
                         Text("  Login").foregroundColor(.black).font(.system(size: 16).bold())
                     }
                }
              }  .frame(width: 325,alignment: .leading)
            
            Spacer().frame(height:10)

         } // VStack
         .background(
            Rectangle()
               .fill(Color.black).opacity(0.06)
               .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
               .ignoresSafeArea()
          )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left").resizable().frame(width: 11, height: 17).foregroundColor(.black)
                        Text("Back").foregroundColor(.black).font(.system(size: 16))
                    }
                    .frame(width: 77, height: 35)
                    .background(
                        Rectangle()
                            .fill(Color.purple).opacity(0.2)
                      )
                    .cornerRadius(16)
                }
             }
         }
        .ignoresSafeArea()
     }
}

struct forgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        forgotPasswordView()
    }
}

