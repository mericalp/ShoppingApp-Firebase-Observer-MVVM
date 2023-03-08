//
//  observer.swift
//  Shopping
//
//  Created by Meriç on 15.08.2022.
//


import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth


class observer: ObservableObject {
    
@Published var product  = [Product]()
@Published var userBasket = [UserBasketModel]()
@Published var userOrder = [UserOrderModel]()
@Published var userOrderinformation = [UserOrderInformationModel]()
@Published var UserFavourites = [UserFavouritesModel]()
    
    init() {
        
        // MARK: -Product
        let db = Firestore.firestore()
        db.collection("Products").getDocuments { snap, err in
            if err != nil {
                print(err?.localizedDescription)
                return
            }
            for i in snap!.documents {
                let name = i.get("name") as! String
                let image = i.get("image") as! String
                let price = i.get("price") as! Int
                let description = i.get("description") as! String
                let size = i.get("size") as? String
                let productdetail = i.get("productDetail") as? [ String] ?? [String]()
                let category = i.get("category") as! String
                let gender = i.get("gender") as! String
                let id = i.documentID
                
                self.product.append(Product(id: UUID(), name: name, image: image, size: size, price: price, description: description, ProductDetail: productdetail,category: category, gender: gender))
            }
        }
        
        
        // MARK: -UserBasket
        db.collection("UserBasket").addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                        print("asdsad")
                        return
                 }
                 DispatchQueue.main.async {
                        // Get all the documents and create Todos
                        self.userBasket = documents.map{ i -> UserBasketModel in
                            let data = i.data()
                            let name = data["name"] as? String ?? ""
                            let price = data["price"] as? String ?? ""
                            let image = data["image"] as? String ?? ""
                            let size = data["size"] as? String ?? ""
                            // Create a Todo item for each document returned
                            return UserBasketModel(id: i.documentID, name: name, image: image, size: size, price: price)
                }
            }
        }
        
        // MARK: -UserOrderinformation
        db.collection("UserOrderInformation").addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                        print("asdsad")
                        return
                 }
                 DispatchQueue.main.async {
                        // Get all the documents and create Todos
                        self.userOrderinformation = documents.map{ i -> UserOrderInformationModel in
                            let data = i.data()
                            let recipient = data["recipient"] as? String ?? ""
                            let phone = data["phone"] as? String ?? ""
                            let Address = data["Address"] as? String ?? ""
                            let deliveryType = data["deliveryType"] as? String ?? ""
                            let uid = data["uid"] as? String ?? ""
                            // Create a Todo item for each document returned
                            return UserOrderInformationModel(id:UUID(),uid:uid , deliveryType: deliveryType, Address: Address, recipient: recipient, phone: phone)
                 }
             }
         }
        
        
        
        // MARK: -UserOrder
        db.collection("UserOrder").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("no documents")
                return
            }
            self.userOrder = documents.map({ queryDocumentSnapshot -> UserOrderModel in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let price = data["price"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let size = data["size"] as? String ?? ""
                let uid = data["uid"] as? String ?? ""

                return UserOrderModel(id: UUID(), uid:uid, name: name, image: image, size: size, price: price, date: Date() )
            })
          }
        
        
        // MARK: -UserFavourites
        db.collection("UserFavourites").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("no documents")
                return
            }
                    
            self.UserFavourites = documents.map{ i -> UserFavouritesModel in
                let data = i.data()
                let name = data["name"] as? String ?? ""
                let price = data["price"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let size = data["size"] as? String ?? ""
                // Create a Todo item for each document returned
                return UserFavouritesModel(id: i.documentID, name: name, image: image, size: size, price: price)
            }
            
        }
    }
    
    func deleteBasket(ToDelete: UserBasketModel) {
        let db = Firestore.firestore()
        db.collection("UserBasket").document(ToDelete.id).delete {
            error in
            if error == nil {
                DispatchQueue.main.async {
                    self.userBasket.removeAll{ item in
                        return item.id == ToDelete.id
                    }
                }
            }
        }
        
    }
    
    func deleteFavourite(ToDelete: UserFavouritesModel) {
        let db = Firestore.firestore()
        db.collection("UserFavourites").document(ToDelete.id).delete {
            error in
            if error == nil {
                DispatchQueue.main.async {
                    self.UserFavourites.removeAll{ item in
                        return item.id == ToDelete.id
                    }
                }
            }
        }
        
    }

}


