//
//  productModel.swift
//  Shopping
//
//  Created by Meriç on 15.08.2022.
//

import Foundation

struct Product: Codable, Identifiable {
    
    var id = UUID()
    var name : String
    var image: String
    var size : String?
    var price: Int
    let description: String
    var ProductDetail: [String]?
    var category : String
    var gender : String
    
    var productArray1: String { return ProductDetail?[0] ?? "" }
    var productArray2: String { return ProductDetail?[1] ?? ""}
    var productArray3: String { return ProductDetail?[2] ?? ""}
    var productArray4: String { return ProductDetail?[3] ?? ""}

    
    var formattedPrice: String { return "$\(price)" }
    

    
}
