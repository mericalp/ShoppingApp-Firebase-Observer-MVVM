//
//  loginView.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import SDWebImageSwiftUI
import Firebase
import GoogleSignIn

extension View {

    func hLeading()-> some View {
        self
            .frame(maxWidth:.infinity , alignment: .leading )
    }
    
    func hTrailing()-> some View {
        self
            .frame(maxWidth:.infinity , alignment: .trailing )
    }
    
    func hCenter()-> some View {
        self
            .frame(maxWidth:.infinity , alignment: .center )
    }
}



struct loginView: View {
    @State var showOrderView = false //showOrderView
    @EnvironmentObject var viewModel: LoginViewModel
    @State var xx = ""
    @State var isNavigationBarHidden: Bool = true

    
    func handleLogin()  {
        // Google
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // configuration object
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewContt()) { [self] user , error in
             if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken
            else {
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            
            // Firebase
            Auth.auth().signIn(with: credential) { result , err in
                if let err = err {
                    return
                }
                guard let  user = result?.user else {
                    return
                }
            }
        }
    }
    
    var body: some View {
        if viewModel.userSession == nil {
        
            VStack(spacing:0)  {
                Spacer().frame(height:50)
                HStack {
                    VStack{
                        Spacer().frame(height:75)
                         Text("Welcome\nBack").font(.system(size: 44).bold() ).opacity(0.72)
                            .foregroundColor(Color.white)
                            .frame(maxWidth:.infinity,alignment:.leading)
                            .frame(width: 200, height: 255,alignment: .leading )
                            .padding()
                        Spacer().frame(height:32)

                    }

                    Spacer().frame(width:115)

                }
                .frame(width: UIScreen.main.bounds.width, height: 170 )
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(red: 189/255, green: 178/255, blue: 255/255).opacity(0.7), Color(red: 205/255, green: 180/255, blue: 219/255)]), startPoint: .top, endPoint: .bottom)
                )
                Spacer().frame(height:110)

                ScrollView(.vertical) {
                
                    VStack {
                        Spacer().frame(height:20)
                        Group {
                        HStack() {
                            Spacer().frame(width:25)
                            Text(viewModel.registerUser ? "Register Now" :"Login")
                                .font(.system(size: 33).bold())
                                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .leading )
                                .padding()
                        }
 
                        TextField("Email",text: $viewModel.email )
                        .frame(width: 333, height: 30 )
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(25)
         
                        .padding(.top,6)
                        SecureField("Password",text: $viewModel.password )
                        .frame(width: 333, height: 30 )
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(25)
                        

                        if viewModel.registerUser {
                            TextField("username",text: $viewModel.username )
                                .frame(width: 333, height: 30 )
                                .padding()
                                .background(.ultraThinMaterial)
                                .cornerRadius(25)
                        }

                        HStack {
                            Spacer().frame(width: 210)
                            NavigationLink  {
                               forgotPasswordView()
                            } label: {
                                Text( "Forgot Your Password ?")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black).opacity(0.6)
                                    .padding()
                                    .frame(width: 200 )
                             }
                          }
                        }
                        
                        Spacer().frame( height: 30 )
                        
                        Button {
                         //   viewModel.login(withEmail: email, password: password)
                            if viewModel.registerUser {
               
                                viewModel.register(withEmail: viewModel.email, password: viewModel.password, username: viewModel.username )
                            } else {
                                viewModel.login(withEmail: viewModel.email, password: viewModel.password)

                            }
                            
                        } label: {
                            VStack{
                            Text(viewModel.registerUser ? "Register" : "Login")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding()
                                .hCenter()
                                .background {
                                    RoundedRectangle(cornerRadius: 322 )
                                        .fill( LinearGradient(gradient: Gradient(colors: [Color(red: 189/255, green: 178/255, blue: 255/255).opacity(0.7), Color(red: 205/255, green: 180/255, blue: 219/255)]), startPoint: .top, endPoint: .bottom)) //  .fill(Color(" ") )

                                }
                                .frame(width: 275, height: 25 )
                                Spacer().frame( height: 25 )

                            }

                        }
                        .padding(.vertical,2)
                        .disabled(viewModel.email == "" || viewModel.password == "" )
                        .opacity(viewModel.email == "" || viewModel.password == "" ? 0.5 : 1)


                        HStack {
                            Divider().frame(width: 90 ).rotationEffect(.degrees(90)).foregroundColor(.black)
                            Spacer().frame(width:11)
                            Text("Or continue with").font(.system(size: 15)).foregroundColor(.black)
                            Spacer().frame(width:11)
                             Divider().frame(width: 90 ).rotationEffect(.degrees(90)).foregroundColor(.black)
                         }
                        
                        Spacer().frame(height:30)
                        
                        HStack(spacing:80){
                            Button {
                                // APPLE
                                
                            } label: {
                                     VStack{
                                         Text("")
                                    }.frame(width: 80, height: 80)
                                        .background(
                                            Image("apple").resizable().frame(width: 70, height: 70)
                                                .cornerRadius(20)
                                    )
                               }
                            
                            Button {
                                handleLogin()
                             } label: {
                                VStack{
 
                                }.frame(width: 80, height: 80)
                                    .background(
                                        Image("google").resizable().frame(width: 70, height: 70)
                                        .cornerRadius(20)
                                        .background(.ultraThinMaterial)
                                        .cornerRadius(17)
                                        )
                             }
                           } // Button HStack Google Apple
 
                        Spacer().frame( height: 20 )
                        
                     Group {
                        Button  {
                            withAnimation {
                                viewModel.registerUser.toggle()
                            }
                        } label: {
                            HStack(spacing:0){
                                Spacer().frame( width: 87 )
                                Text(viewModel.registerUser ? "   Have an account?" : "   Not a remember?" ).font(.system(size: 13))
                                    .hCenter()
                                 Text(viewModel.registerUser ? "back to login" : "Create Account").font(.system(size: 14))
                                    .foregroundColor(.blue)
                                    .hCenter()
                                Spacer().frame( width: 86 )
                            }
                         }.padding(.top,8)
                        
                     }

                    HStack{
                    }.frame(width: UIScreen.main.bounds.width, height: 230)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: 650 )
                .background(.white)
                .cornerRadius(45)
                .padding(.top,-108)

                .onAppear{
                   self.isNavigationBarHidden = true
                }
                .navigationBarHidden(self.isNavigationBarHidden)
                
             }
            .background(
                Color(red: 205/255, green: 180/255, blue: 219/255)
            )
                .ignoresSafeArea()
                .onAppear{
                   self.isNavigationBarHidden = true
                }
                .navigationBarHidden(self.isNavigationBarHidden)

        } else {
            if let user = Auth.auth().currentUser {
                VStack {
                      VStack(spacing:25) {
                        VStack(spacing:0){
                            VStack {
                                HStack(spacing:30){
                                    HStack(spacing: 22){
                                        
                                        VStack(spacing:2) {
                                            HStack() {
                                                Text("Hello,").font(.system(size: 19).bold()).foregroundColor(.black)
                                                Spacer().frame(width:170)

                                            }
                                            HStack {
                                                Spacer().frame(width:22)
                                                    HStack{
                                                        Text(user.email ?? "").font(.system(size: 14).bold()).foregroundColor(.black).frame(width: 165, height: 20 )
                                                        }
                                                    HStack{
                                                        Text("Verify").font(.system(size: 11).bold()).foregroundColor(.white)
                                                        Image(systemName: "chevron.right").resizable().frame(width: 6, height: 6 ).foregroundColor(.white)
                                                     }
                                                    .frame(width: 59, height: 16)
                                                    .background(.red).opacity(0.9)
                                                    .cornerRadius(25)
                                                    .offset(x:-12,y: -10)
                                            }
                                            Spacer().frame(height:11)
                                        }.frame(width: 230 , height: 100 , alignment: .leading)
                                    }
                                    Spacer().frame(width:7)
                                    Image(systemName: "bell.badge").resizable().frame(width: 25, height: 25).foregroundColor(.black).offset(x:-15,y: -19)
                                }
                                .frame(width:330, height: 92)
                                .background(.thinMaterial)
                                .cornerRadius(20)
                                Spacer().frame(height:72)
                                    .onAppear{
                                       self.isNavigationBarHidden = true
                                    }
                                    .navigationBarHidden(self.isNavigationBarHidden)
                            }
                            .frame(width: UIScreen.main.bounds.width,height: 10)
                            .background(Color.purple).opacity(0.6)

                            // User Information:
                            Divider()
                            
                            // Detail:
                            HStack(spacing:15) {
                                
                                VStack(spacing:8) {
                                    Image("history").resizable().frame(width: 22, height: 22 )
                                Text("Visited Before").font(.system(size: 13).bold())
                                }

                                VStack(spacing:8) {
                                    Image("voucher").resizable().frame(width: 23, height: 24 )
                                Text("Coupons").font(.system(size: 13).bold())
                                }
                                VStack(spacing:8) {
                                    Image("bot").resizable().frame(width: 24, height:24)
                                    Text("Assistant").font(.system(size: 13).bold())
                                }
                                VStack(spacing:8) {
                                    Image("envelope").resizable().frame(width: 22, height: 22 )
                                    Text("New Message").font(.system(size: 13).bold())
                                }
                            }.frame(width:350, height: 80)
                                .background(.thinMaterial)
                                .cornerRadius(10)
                        }
                    
                      // My Wallet
                        HStack {
                            HStack{
                                Text("My Wallet").font(.system(size: 22).bold())
                            }
                            Spacer().frame(width: 155 )
                        Text("****$")
                        Image(systemName: "chevron.right").resizable().frame(width: 12, height:12)
                        }.frame(width:350, height: 60)
                            .background(.thinMaterial)
                            .cornerRadius(10)
                        
                        VStack(spacing:1) {
                            Spacer().frame(height:1)
                            HStack{
                                NavigationLink { } label: {
                                    Text("Orders").font(.system(size: 22).bold())
                                }
                                Spacer().frame(width:190)
                                Text("Detail").font(.system(size: 13).bold())
                                Image(systemName: "chevron.right").resizable().frame(width: 12, height:12)
                            }
                            Spacer().frame(height:2)
                            Divider()
                            HStack(spacing:30){
                                
                                // MARK: Order View
                                Button {
                                    withAnimation {
                                        showOrderView.toggle()
                                    }
                                } label: {
                                    VStack(spacing:12 ) {
                                         Image("bag2").resizable().frame(width: 33, height: 36 )
                                         Text("Orders ").font(.system(size: 13).bold()).foregroundColor(.black)
                                        }
                                }
                                .fullScreenCover(isPresented: $showOrderView) {
                                    OrderView(isNavigationBarHidden: $isNavigationBarHidden)
                                        .environment(\.locale, Locale(identifier: "eng"))
                                }
                              
                                VStack(spacing:20) {
                                    Image("returnn").resizable().frame(width: 30, height: 29 ).offset(y:4)
                                    Text("Return").font(.system(size: 13).bold())
                                }
               
                                VStack(spacing:17) {
                                    Spacer().frame(height:1)
                                    Image("upload").resizable().frame(width: 30, height: 30 ).offset(y:-1)
                                    Text("  Product \nComment").font(.system(size: 13).bold())
                                }
                             
                                VStack(spacing:23) {
                                    Image("searchh").resizable().frame(width: 24, height: 24 ).offset(y:7)
                                     Text(" Buy Again").font(.system(size: 13).bold())
                                }
                            }
                        }.frame(width:355, height: 135)
                            .background(.thinMaterial)
                            .cornerRadius(10)
                        
                        VStack {
                            Spacer().frame( height: 3)
                            Text(" ").frame(height:1)
                            Text(" Account & Help").font(.system(size: 20).bold()).offset(x: -100)
                            Divider()
                            
                            VStack{
            
                                NavigationLink {
                                    accountSettingsView()
                                } label: {
                                    HStack(spacing:7){
                                        Spacer().frame(width: 1 )
                                        Image(systemName:"gearshape").resizable().frame(width: 24, height: 24 ).foregroundColor(.black)
                                        Text(" Account Settings ").font(.system(size: 17).bold()).foregroundColor(.black).opacity(0.8).frame(width: 145 , height: 15)
                                        Spacer().frame(width:107)
                                        Image(systemName: "chevron.right").resizable().frame(width: 8, height: 12)
                                     }
                                     .frame(width: 340, height: 45 , alignment: .leading)
                                     .background(.thinMaterial)
                                     .cornerRadius(21)
                                }
                                
                                Divider()
                                    
                                NavigationLink { } label: {
                                    HStack(spacing:7) {
                                        Spacer().frame(width:2)
                                        Image(systemName:"questionmark.circle").resizable().frame(width: 24, height: 24 ).foregroundColor(.black)
                                        Text("Help  ").font(.system(size: 17).bold()).foregroundColor(.black).opacity(0.8)
                                        Spacer().frame(width:205)
                                        Image(systemName: "chevron.right").resizable().frame(width: 8, height: 12)
                                      }
                                        .frame(width: 340, height: 50 , alignment: .leading)
                                        .background(.thinMaterial)
                                        .cornerRadius(21)
                                    }
                                
                                Divider()

                                Button {
                                    viewModel.signOut()
                                } label: {
                                    HStack(spacing:7){
                                     Spacer().frame(width:5)
                                    Image("logout-2").resizable().frame(width: 24, height: 24 ).foregroundColor(.black)
                                    Text("Logout ").font(.system(size: 17).bold()).foregroundColor(.black).opacity(0.8)
                                    Spacer().frame(width:205)
                                 }
                                    .frame(width: 340, height: 50 , alignment: .leading)
                                    .background(.thinMaterial)
                                    .cornerRadius(21)
                                }
                            }
                            Spacer().frame(height:11)
 
                     }.frame(width: 360, height:240)
                        .background(.thinMaterial)
                        .ignoresSafeArea()
                        .cornerRadius(10)
                        
                    }.frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
                      

                }
                .ignoresSafeArea()
                .navigationBarHidden( true )
            }
            
        }
          
           
    }
}


extension loginView {
    
    func GetRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getRootViewContt() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let  root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
    
}
