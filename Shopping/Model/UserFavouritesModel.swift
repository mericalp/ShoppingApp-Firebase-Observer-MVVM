//
//  UserFavouritesModel.swift
//  Shopping
//
//  Created by Meric on 18.08.2022.
//

import Foundation


struct UserFavouritesModel: Identifiable,Codable {
    
    var id : String
    var name : String
    var image: String
    var size : String
    var price: String

    var formattedPrice: String { return "$\(price)" }
}
