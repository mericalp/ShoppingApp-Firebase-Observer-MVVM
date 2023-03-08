//
//  UserOrderInformationModel.swift
//  Shopping
//
//  Created by Meric on 22.08.2022.
//

import Foundation

struct UserOrderInformationModel:Identifiable    {
    var id = UUID()
    
    
    var uid: String
    var deliveryType : String
    var Address: String
    var recipient: String
    var phone: String
    
    
    
    
}
