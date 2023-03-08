//
//  AdvertisementTabItem.swift
//  Shopping
//
//  Created by Meric on 24.08.2022.
//

import SwiftUI



struct AdvertisementTabItem: View {
  // MARK: - PROPERTY
  
  let advertisement: Advertisement
  
  // MARK: - BODY
  
  var body: some View {
    Image(advertisement.image)
      .resizable()
      .frame(width: 365, height: 125 )
      .scaledToFit()
      .cornerRadius(21)
  }
}

// MARK: - PREVIEW

