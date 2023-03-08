//
//  ShoppingApp.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct ShoppingApp: App {
    @State private var isLoading = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZStack {
//                    if isLoading {
//                        ProgressView()
//                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
//                            .scaleEffect(2)
//                    }else {
//                        TabBar()
//                    }
                    TabBar()
                }.onAppear {
                    startFakeCall()
                }
            }
        }
    }
    func startFakeCall(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
    
    func application(_ application:UIApplication,open url: URL,options:[UIApplication.OpenURLOptionsKey:Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
