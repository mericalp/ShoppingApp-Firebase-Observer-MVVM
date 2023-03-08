//
//  ForgotPasswordService.swift
//  Shopping
//
//  Created by Meriç on 13.08.2022.
//

import Foundation
import Combine
import FirebaseAuth

protocol ForgotPasswordService {
    func sendPasswordReset(to email: String) -> AnyPublisher<Void,Error>
}

final class ForgotPasswordServiceImpl: ForgotPasswordService {
    func sendPasswordReset(to email: String) -> AnyPublisher<Void,Error> {
        
        Deferred {
            Future { promise in
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                    }
             }
         }
        .eraseToAnyPublisher()
    }
}
