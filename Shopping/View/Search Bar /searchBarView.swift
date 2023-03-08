//
//  searchBarView.swift
//  Shopping
//
//  Created by Meriç on 15.08.2022.
//

import SwiftUI


struct searchBarView: View {
    
    @Binding var text : String
    @State private var isEditing = false
    @Binding var edit : Bool
    
    var body: some View {
        HStack {
       
                TextField("What are you searching for? ",text: $text)
                    .padding(15)
                    .padding(.horizontal,25)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .overlay(
                     
                        HStack {
                         Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                .padding(.leading,15)
                        
                        if isEditing {
                            Button {
                                self.text = ""
                            } label: {
                            Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing,8)
                                }
                            }
                        }
                    )
                    .onTapGesture {
                        self.edit = false
                        self.isEditing = true
                       
                    }

            if isEditing {
                Button {
                    self.edit = true
                    self.isEditing = false
                } label: {
                    Text("cancel")
                }
                    .padding(.trailing,10)
                    .transition(.move(edge: .trailing))
            }
        }.frame(width: 370, height: 40)
            .cornerRadius(15)
        
    }
    
}




