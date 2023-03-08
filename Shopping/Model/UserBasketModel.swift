//
//  UserBasketModel.swift
//  Shopping
//
//  Created by Meric on 18.08.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct UserBasketModel: Identifiable,Codable {
//    @DocumentID var id: String?
    // var uid : String
    var id : String
    var name : String
    var image: String
    var size : String
    var price: String
    

    var formattedPrice: String { return "\(price)" }
}
