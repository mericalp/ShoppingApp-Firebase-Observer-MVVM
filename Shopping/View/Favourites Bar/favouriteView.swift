//
//  favouriteView.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//

import SwiftUI

struct favouriteView: View {
  
    @ObservedObject  var obser = observer()
    
    var body: some View {
        VStack() {
            Spacer().frame(height:65)
            ScrollView(.vertical) {
                HStack(alignment: .top ){
                    Text("Wishlist").font(.system(size: 25).bold()).foregroundColor(.black)
                    HStack(spacing:0) {
                    Text("(").foregroundColor(.black)
                    Text("\(obser.UserFavourites.count)").font(.system(size: 17).bold()).foregroundColor(.black)
                    Text(")").foregroundColor(.black)
                    }
                        Spacer().frame(width:234)
                }
                VStack {
                   Divider()
                   ForEach (obser.UserFavourites) { items in
                       CartRowFavouritesView( userItem: items)
                       Divider().background(Color.white)
                   }
                }
            }
          .navigationBarHidden(true)
        }.frame( maxWidth: .infinity,maxHeight: .infinity, alignment: .trailing)
        .ignoresSafeArea()
    }
}




