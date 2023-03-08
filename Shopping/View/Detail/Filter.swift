//
//  Filter.swift
//  Shopping
//
//  Created by Meric on 24.08.2022.
//

import SwiftUI

// MARK: - FILTER SCREEN ( MENU VIEW )
struct FilteringScreenMenuView:View {
    @Binding  var chc : Bool
    @Environment(\.presentationMode) var presentationMode
    //  MARK: FILTER
    @Binding var selectedCategory : String

    @State var filtersColor = [
        FilterItem2(color: "Black", c: .black, checked: false),
        FilterItem2(color: "Blue", c: .blue ,checked: false),
        FilterItem2(color: "Violet", c: .purple, checked: false),
        FilterItem2(color: "Green", c: .green, checked: false),
        FilterItem2(color: "Brown", c: .brown, checked: false),
    ]
    @State var filtersSize = [
        FilterItem3(Size: "S", checked: false),
        FilterItem3(Size: "M", checked: false),
        FilterItem3(Size: "L", checked: false),
        FilterItem3(Size: "XL", checked: false),
        FilterItem3(Size: "XXL", checked: false),
    ]
    
    var body: some View {
      
        
        
        let firstt3 =  filtersColor.prefix(upTo: 3)
        let lastt2 = filtersColor.suffix(2)
        let first3objectt = Array(firstt3)
        let last3objectt = Array(lastt2)
        
        let firsttt3 =  filtersSize.prefix(upTo: 3)
        let lasttt2 = filtersSize.suffix(2)
        let first3objecttt = Array(firsttt3)
        let last3objecttt = Array(lasttt2)
        
VStack(spacing:33){
    VStack {
        Button {
            withAnimation {
                presentationMode.wrappedValue.dismiss()
            }
        } label: {
            HStack {
                Image(systemName: "xmark").resizable().frame(width: 17, height: 17)
                    .foregroundColor(Color.red).opacity(0.75)
                Spacer().frame(width:340)
            }
        }
        
        HStack {
            Spacer().frame(width:150)
            Text("Filtering")
                .font(.title2)
                .foregroundColor(.black)
            Spacer()
        } .padding([.horizontal,.top])
          .padding(.bottom,10)
                
                Spacer().frame(height:20)
                
              HStack(spacing:8) {
                Text("Join Life ").font(.system(size: 16).bold()).foregroundColor(.black).opacity(0.6)
                Image(systemName:"leaf").resizable().frame(width: 21, height: 21 ).foregroundColor(.green).opacity(0.6)
                Spacer().frame(width:220)
                  
                  ZStack{
                    Circle()
                            .stroke(chc ? Color.green: Color.gray,lineWidth: 1)
                            .frame(width: 18, height: 18 )
                    if chc {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 18  ))
                            .foregroundColor(Color.green)
                        }
                    }.onTapGesture {
                        chc.toggle()
                    }
              }
        }
        HStack  {
            Text("Color").font(.system(size: 16).bold()).foregroundColor(.black)
            Spacer().frame(width:310)
        }
        HStack{
            ForEach(first3objectt) { filter in
                CardView2(filterColor: filter,  selectedCategory: $selectedCategory)
            }
        }
        HStack {
            ForEach(last3objectt) { filter in
                CardView2(filterColor: filter,  selectedCategory: $selectedCategory)
            }
        }
        HStack  {
            Text("Size").font(.system(size: 16).bold()).foregroundColor(.black)
            Spacer().frame(width:310)
        }
        HStack{
            ForEach(first3objecttt) { filter in
                CardView3(filterSize: filter,  selectedCategory: $selectedCategory)
            }
        }
        HStack {
            ForEach(last3objecttt) { filter in
                CardView3(filterSize: filter,  selectedCategory: $selectedCategory)
            }
        }
    
    Spacer().frame(height:150)
    }
    .padding(.bottom,1)
    .padding(.top,10)
    }
}





// MARK: - Filter Screen ( SEARCH VIEW )
struct FilteringScreen:View {
    @Binding  var chc : Bool
    @Environment(\.presentationMode) var presentationMode
    //  MARK: FILTER
    @Binding var selectedCategory : String
    @State var filters = [
        FilterItem(title: "tshirts", checked: false),
        FilterItem(title: "pants", checked: false),
        FilterItem(title: "thirtsMan", checked: false),
        FilterItem(title: "Accessory", checked: false),
        FilterItem(title: "Jacket", checked: false),
    ]
    @State var filtersColor = [
        FilterItem2(color: "Black", c: .black, checked: false),
        FilterItem2(color: "Blue", c: .blue ,checked: false),
        FilterItem2(color: "Violet", c: .purple, checked: false),
        FilterItem2(color: "Green", c: .green, checked: false),
        FilterItem2(color: "Brown", c: .brown, checked: false),
    ]
    @State var filtersSize = [
        FilterItem3(Size: "S", checked: false),
        FilterItem3(Size: "M", checked: false),
        FilterItem3(Size: "L", checked: false),
        FilterItem3(Size: "XL", checked: false),
        FilterItem3(Size: "XXL", checked: false),
    ]
    
    var body: some View {
        
        let first3 =  filters.prefix(upTo: 3)
        let last2 = filters.suffix(2)
        let first3object = Array(first3)
        let last3object = Array(last2)
        
        let firstt3 =  filtersColor.prefix(upTo: 3)
        let lastt2 = filtersColor.suffix(2)
        let first3objectt = Array(firstt3)
        let last3objectt = Array(lastt2)
        
        let firsttt3 =  filtersSize.prefix(upTo: 3)
        let lasttt2 = filtersSize.suffix(2)
        let first3objecttt = Array(firsttt3)
        let last3objecttt = Array(lasttt2)
        
VStack(spacing:33){
    VStack {
        Button {
            withAnimation {
                presentationMode.wrappedValue.dismiss()
            }
        } label: {
            HStack {
                Image(systemName: "xmark").resizable().frame(width: 17, height: 17)
                    .foregroundColor(Color.red).opacity(0.75)
                Spacer().frame(width:340)
            }
        }
        
        HStack {
            Spacer().frame(width:150)
            Text("Filtering")
                .font(.title2)
                .foregroundColor(.black)
            
            Spacer()
            
         

        } .padding([.horizontal,.top])
          .padding(.bottom,10)
                
                Spacer().frame(height:20)
                
              HStack(spacing:8) {
                
                 Text("Join Life ").font(.system(size: 16).bold()).foregroundColor(.black).opacity(0.6)
                  Image(systemName:"leaf").resizable().frame(width: 21, height: 21 ).foregroundColor(.green).opacity(0.6)
                    Spacer().frame(width:220)
                    
                  ZStack{
                    Circle()
                            .stroke(chc ? Color.green: Color.gray,lineWidth: 1)
                            .frame(width: 18, height: 18 )
                    if chc {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 18  ))
                            .foregroundColor(Color.green)
                        }
                    }.onTapGesture {
                        chc.toggle()
                    }
                }
            }
        HStack  {
            Text("Topic").font(.system(size: 16).bold()).foregroundColor(.black)
            Spacer().frame(width:310)
        }
        HStack{
            ForEach(first3object) { filter in
                CardView(filter: filter, selectedCategory: $selectedCategory)
            }
        }
        
        HStack {
            ForEach(last3object) { filter in
                CardView(filter: filter, selectedCategory: $selectedCategory)
            }
        }
          
        HStack  {
            Text("Color").font(.system(size: 16).bold()).foregroundColor(.black)
            Spacer().frame(width:310)
        }
        
        HStack{
            ForEach(first3objectt) { filter in
                CardView2(filterColor: filter,  selectedCategory: $selectedCategory)
            }
        }
        
        HStack {
            ForEach(last3objectt) { filter in
                CardView2(filterColor: filter,  selectedCategory: $selectedCategory)
            }
        }
            
        HStack  {
            Text("Size").font(.system(size: 16).bold()).foregroundColor(.black)
            Spacer().frame(width:310)
        }
        
        HStack{
            ForEach(first3objecttt) { filter in
                CardView3(filterSize: filter,  selectedCategory: $selectedCategory)
            }
        }
        
        HStack {
            ForEach(last3objecttt) { filter in
                CardView3(filterSize: filter,  selectedCategory: $selectedCategory)
            }
        }
    }
    .padding(.bottom,1)
    .padding(.top,10)
   
    }
}

