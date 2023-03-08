//
//  ProductItemView.swift
//  Shopping
//
//  Created by Meriç on 17.08.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductItemView: View {


  @State var isLiked = false
  let product : Product

  var body: some View {

      NavigationLink {
          ProductDetailView(product: product)
      } label: {
  
          VStack  {
              ZStack {
                  AnimatedImage(url: URL(string:product.image)).resizable().frame(width: 175, height: 220 ).cornerRadius(18)
              }
              HStack {
                      Spacer().frame(width:45)
                      Text(product.name).font(.system(size: 15).bold()).foregroundColor(.black)
               } .frame(width: 250, height:15 ,alignment: .leading)
               HStack {
                   Spacer().frame(width:6)
                       Text(product.formattedPrice)
                          .font(.system(size: 16))
                          .foregroundColor(.black)
                          .frame(width:110,height:12)
                 Spacer().frame(width:57)
                        Image("bag").resizable().frame(width: 31, height: 31 ).foregroundColor(.black)
               }
               .frame(width: 250, height: 20 ,alignment: .leading)
           }
      }
  }
}
