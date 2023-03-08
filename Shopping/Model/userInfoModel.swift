//
//  userInfoModel.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct UserInfoModel : Identifiable,Decodable {
    
    @DocumentID var id : String?

    var uid : String
    var email : String
    var username: String
    
}
