//
//  categoryView.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//

import SwiftUI


struct categoryView: View {
    @State var spacing: Bool = true
    @State var currentTab: Int = 0
     var body: some View {
        ZStack(alignment: .top ) {
            TabView(selection: self.$currentTab) {
                WomenCategoryView().tag(0)
                ManCategoryView().tag(1)
            }.tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            CategoryBar(currentTab: self.$currentTab)
             
                
        }
    }
}


struct CategoryBar : View{
    
    @Binding var currentTab : Int
    @Namespace var namespace  // allow geometry effects
    
    var tabBarOptions : [String] = ["Women","Man"]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing:18) {
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)),id: \.0) {  index ,name in  //  ( 0,women)  ( 1,man )
                    BarItem(currentTab: self.$currentTab, namespace: self.namespace, tabBarItemName: name, tab: index)
                        
                }
            }.padding(.horizontal)
             
        } .background(.white)
            .frame(height: 80)
            .edgesIgnoringSafeArea(.all)
           
    }
}


struct BarItem : View {

    @Binding var currentTab : Int
    let namespace : Namespace.ID
    
    var tabBarItemName : String
    var tab : Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack{
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.black .frame(height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace,properties: .frame)
                } else {
                    Color.clear.frame(height: 2 )
                }
            }.animation(.spring(), value: self.currentTab)
        }.buttonStyle(.plain)
    }
}

