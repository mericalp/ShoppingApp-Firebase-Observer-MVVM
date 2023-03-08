//
//  AdvertisementTabView.swift
//  Shopping
//
//  Created by Meric on 24.08.2022.
//

import SwiftUI

struct AdvertisementTabView: View {
  var body: some View {
    TabView {
      ForEach(advertisements) { adver in
        AdvertisementTabItem(advertisement: adver)
          .padding(.bottom, 30)
         
      }
    } //: TAB
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
      
  }
}
