//
//  TabBar.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//

import SwiftUI

struct TabBar: View {
    
    @StateObject var viewModel = LoginViewModel(servicee: ForgotPasswordServiceImpl() )

    var body: some View {
         TabView {
            searchView()
                .tabItem {
                    Image(systemName:"magnifyingglass")
                    Text("Search")
                }
            categoryView()
                .tabItem {
                    Image(systemName:"line.3.horizontal")
                    Text("Menu")

                }
            favouriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")

                }
            basketView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Basket")

                }
            loginView().environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "person")
                    Text("My Account")

                }
        }.accentColor(.black)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
