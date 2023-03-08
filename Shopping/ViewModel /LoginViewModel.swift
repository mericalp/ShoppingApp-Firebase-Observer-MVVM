//
//  LoginViewModel.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//
import AuthenticationServices
import Combine
import Foundation
import Firebase
import FirebaseAuth


protocol ForgotPasswordModel {
    func PasswordReset()
    var servicee: ForgotPasswordService { get }
    var email: String { get }
    init(servicee: ForgotPasswordService)
}
 
class LoginViewModel : ObservableObject, ForgotPasswordModel {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var fullname : String = ""
    @Published var username : String = ""
 
    @Published var signedIn : Bool  = false
    @Published var userSession : FirebaseAuth.User?
    @Published var registerUser : Bool = false
    
    let servicee: ForgotPasswordService
    private var subscriptions = Set<AnyCancellable>()
    
     required init(servicee: ForgotPasswordService) {
        self.signedIn = false
        self.userSession = Auth.auth().currentUser
        self.servicee = servicee
     }
 
    func login(withEmail email : String , password : String)  {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Debug Login error \(err.localizedDescription)")
                return
            }
            guard let user = result?.user else { return}
            self.userSession = user
            print("Debug: ")
         }
    }
    
    func register(withEmail email:String, password:String, username:String ) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("debug register error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession  = user
                            
        print("debug register \(email)")
    
            let data = ["email": email,
                        "username":username.lowercased(),
                        "uid":user.uid ]
            Firestore.firestore().collection("UserInfo").document(user.uid).setData(data) { _ in
                    
                
            print("Debug : did upload user data ")
                   
            }
        }
        
    }
    
    
   
    func PasswordReset() {
        servicee.sendPasswordReset(to: email).sink { res in
                switch res {
                    case .failure(let err):
                        print("Failed:\(err)")
                    default: break
                    }
                } receiveValue: {
                    print("Sent Password Reset Request")
                }
                .store(in: &subscriptions)
    }
 
    func signOut()  {
        userSession = nil
        try? Auth.auth().signOut()
    }
 
}



