//
//  layout.swift
//  Shopping
//
//  Created by Meric on 15.08.2022.
//

import SwiftUI

extension Bundle {
    func decode<T: Codable>(_ source: String) -> T {
        
        // MARK:  JSON file
        guard let url = self.url(forResource: source, withExtension: nil) else {
            fatalError("Failed to locate\(source) from bundle")
        }
        
        //MARK: Property
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(source) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodeData = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(source) from bundle")
        }
        return decodeData
    }
}


let advertisements: [Advertisement] = Bundle.main.decode("Advertisement.json")

// MARK: LAYOUT

let columnSpacing: CGFloat = 12
let rowSpacing: CGFloat = 8

var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
}

 var gridLayout2: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}



