//
//  passwordRestView.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//

import SwiftUI

struct passwordRestView: View {
    
//    @State private var email = ""
    @State var errString : String?
    @State var showAlert = false
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            
            Image("unlock").resizable().frame(width: 190, height: 200)
            
            VStack(spacing:10) {
                Text("Create New Password").font(.system(size: 28)).foregroundColor(.black)
                Text("  You new password must be different from      \n                previously used passwords.").font(.system(size: 16)).foregroundColor(.black).opacity(0.5)
             }
            
            Spacer().frame(height:60)
            
            VStack(spacing:14){
                
                 TextField("    Enter Current Password", text: $password)
                    .frame(width: 330, height: 55  )
                    .overlay{
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.purple.opacity(0.9),lineWidth: 1)
                    }
    
                TextField("  Enter Current Password", text: $password)
                    .frame(width: 330, height: 55  )
                    .overlay{
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.purple.opacity(0.9),lineWidth: 1)
                    }
             }
            Spacer().frame(height:80)

            VStack {
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Create")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                    }
                    .frame(width: 300, height: 52)
                    .overlay{
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.purple.opacity(0.9),lineWidth: 3)
                    }
                    .background(.purple.opacity(0.4))
                    .cornerRadius(16)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            Rectangle()
                .fill(Color.black.opacity(0.06))
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left").resizable().frame(width: 8, height: 15)
                            .foregroundColor(.white)
                     }
                    .frame(width: 55, height: 40 )
                    .background(
                          Rectangle()
                             .fill(.purple.opacity(0.4))
                             .ignoresSafeArea()
                     )
                    .cornerRadius(55)
                }
             }
        }
        .ignoresSafeArea()
    }
}

struct passwordRestView_Previews: PreviewProvider {
    static var previews: some View {
        passwordRestView()
    }
}
