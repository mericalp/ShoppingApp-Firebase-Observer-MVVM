//
//  searchView.swift
//  Shopping
//
//  Created by Meriç on 12.08.2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct searchView: View {
    
    var gender = ["female","male"]
    @State var selectedGender = ""
    @State var selectedCategory : String = ""
    @State var isLiked = false
    @State private var StringArray = [String]()
    @State  var chc = false     // Checked  join life Filter
    @State var showFilter = false // Filter Button Animation
    @State  var isEdit  = true
    @ObservedObject var obser = observer()
    @State var text = ""
    @StateObject private var storesvm = StoresViewModel()
    
    private func DetView(product:Product) -> some View {
    
        NavigationLink {
            ProductDetailView(product: product)
        } label: {
            if product.category == selectedCategory {
                if product.gender == selectedGender {
                 VStack {
                        ZStack{
                            AnimatedImage(url: URL(string:product.image)).resizable().frame(width: 175, height: 220 ).cornerRadius(18)
                            Button {
                                isLiked.toggle()
                            } label: {
                        
                                Image(systemName: isLiked ? "heart.fill" : "heart" ).resizable().frame(width: 21, height: 16).foregroundColor(.red)
                                    .offset(x: 70, y: -95)
                            }
                        }
                     HStack {
                             Spacer().frame(width:45)
                             Text(product.name).font(.system(size: 15).bold()).foregroundColor(.black)
                      } .frame(width: 250, height:15 ,alignment: .leading)
                         
                       HStack {
                           Spacer().frame(width:6)
                               Text(product.formattedPrice)
                                  .font(.system(size: 16))
                                  .foregroundColor(.black)
                                  .frame(width:110,height:12)
                         Spacer().frame(width:57)
                                Image("bag").resizable().frame(width: 31, height: 31 ).foregroundColor(.black)
                         }
                        .frame(width: 250, height: 24 ,alignment: .leading)
                 }
                 .frame(alignment:.leading)
                 .navigationBarHidden(true)
                }
            }
        }
    }
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false ) {
            ZStack {
                VStack {
                    Spacer().frame(height:50 )
                    Text("Search").font(.system(size: 20)).foregroundColor(.black)
                    Spacer().frame(height: 8 )
                     HStack {
                        searchBarView(text: $text, edit: $isEdit)
                            .onSubmit {
                                addItem()
                          }
                      }
                 if !isEdit {
                        HStack {
                            Spacer().frame(width:20)
 
                    ForEach(gender,id: \.self) { i in
                        Divider()
                        Button{
                            selectedGender = i
                        } label:{
                            HStack {
                                Text("\(i)").font(.system(size: 16))
                                 .foregroundColor(selectedGender == i ? .black : .black.opacity(0.4))
                            }.frame(width: 70, height: 32 )
                                 .border(selectedGender == i ? .black : .black.opacity(0.4))
                            }
                     }
                            
                   Spacer().frame(width:120)
                            
                    Button {
                        withAnimation {
                            showFilter.toggle()
                        }
                    } label: {
                        HStack {
                            Text("Filters")
                        }.frame(width: 90, height: 39 )
                            .border(Color.black).opacity(0.8)
                            

                    }
                        .padding(.trailing)
                      .padding(.top,10)
                      .fullScreenCover(isPresented: $showFilter) {
                          FilteringScreen(chc: $chc, selectedCategory: $selectedCategory)
                      }
                    }
                  }
                    
            if isEdit {

                VStack{
              
                Divider().opacity(2)
                HStack{
                    Spacer().frame(width: 30 )
                    NavigationLink {
                        // Map
                        MapView()
                            .environmentObject(storesvm)
                        
                    } label: {
                        HStack{
                            VStack{
                                Image("store").resizable().frame(width: 31, height: 31 ).opacity(0.7)
                                Text("Stores").font(.system(size: 15)).foregroundColor(.black)
                            }
                        }.frame(width: 70, height: 50 )
                    }
                    Spacer().frame(width:62)
                    NavigationLink {
                     // QR scanner
                    } label: {
                        HStack{
                             VStack{
                                Image("barcode").resizable().frame(width: 31, height: 31 ).opacity(0.7)
                                Text("Scanner").font(.system(size: 15)).foregroundColor(.black)
                            
                            }.frame(width: 70, height: 50 )

                        }.frame(width: 50, height: 50 )
                    }
                    Spacer().frame(width:62)
                    
                    Button {
                        
                    } label: {
                        HStack{
                            VStack{
                                Image("microphone").resizable().frame(width: 31, height: 31 ).opacity(0.7)
                                Text("Voice").font(.system(size: 15)).foregroundColor(.black)
                            
                            }.frame(width: 70, height: 50 )

                        }.frame(width: 50, height: 50 )
                    }
                    Spacer().frame(width:44)
                    // Spacer().frame(width:22)
                }
                .frame(width: 380, height: 100,alignment: .center )
            
                    HStack {
                        
                    }.frame(width: 380, height: 10)
                        .background(.ultraThinMaterial)
                    
                    
        //  MARK: MOST RECENT
                  VStack{
                    HStack{
                        Text("MOST RECENT SEARCHES ").font(.system(size: 17))
                        Spacer().frame(width:90)

                        Button {
                            StringArray.removeAll()
                        } label: {
                                    Text("Clear All").font(.system(size: 13).bold()).opacity(0.3)
                           }
                        }
                      Spacer().frame(height:18)
                      HStack{
                            ForEach(0..<StringArray.count, id: \.self) { item in
                                HStack{
                                    Text("\(StringArray[item])")
                                }.frame(width:85, height: 33 )
                                    .background(.ultraThinMaterial)
                                     .cornerRadius(25)
                                }
                      }
                      Spacer().frame(width:100)
                }.frame(width: 380, height: 100 )
               
               HStack {
                   
               }.frame(width: 380, height: 10)
                            .background(.ultraThinMaterial)
       
                    
      //  MARK: TRENDING

                VStack{
                    Spacer().frame(height:25    )

                    HStack{
                        Text(" TRENDING  ").font(.system(size: 17))
                        Spacer().frame(width:270)
                    }
                    
                 Spacer().frame(height:27)
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            HStack {
                                Text("Colorfully").font(.system(size: 13)).foregroundColor(.black)
                            }
                            .frame(width:85, height: 33 )
                            .background(.thinMaterial).cornerRadius(25)
                            
                            HStack {
                              Text("Basic").font(.system(size: 13)).foregroundColor(.black)
                            }
                            .frame(width:85, height: 33 )
                            .background(.thinMaterial).cornerRadius(25)
                      
                            HStack {
                              Text(" Jacket").font(.system(size: 13)).foregroundColor(.black)
                            }
                            .frame(width:85, height: 33 )
                            .background(.thinMaterial).cornerRadius(25)
                          
                              HStack {
                                Text(" Jeans").font(.system(size: 13)).foregroundColor(.black)
                              }
                              .frame(width:85, height: 33 )
                              .background(.thinMaterial).cornerRadius(25)
                          
                              HStack {
                                Text(" Shorts").font(.system(size: 13)).foregroundColor(.black)
                              }
                              .frame(width:85, height: 33 )
                              .background(.thinMaterial).cornerRadius(25)
                                
                              HStack {
                                Text(" T-shirt").font(.system(size: 13)).foregroundColor(.black)
                              }
                              .frame(width:85, height: 33 )
                              .background(.thinMaterial).cornerRadius(25)
                        }
                    }
                    
                    Spacer().frame(height:40)

                }.frame(width: 380, height: 100,alignment: .center )
                
                    
                HStack {
                
                }
                .frame(width: 380, height: 13)
                .background(.ultraThinMaterial)
                        
                        // MARK:  TOP SEARCH
                            VStack{
                                Spacer().frame(height:11)
                                HStack{
                                    Text("  TOP SEARCH  ").font(.system(size: 17))
                                    Spacer().frame(width:270)
                                }
                                
                                Spacer().frame(height:20)

                                ScrollView(.horizontal,showsIndicators: false) {
                                    HStack{
                                        Spacer().frame(width:7)
                                        HStack   {
                                       
                                             HStack {
                                                VStack{
                                                        Image("blackpants").resizable().frame(width: 165, height: 210 )
                                                    }
                                                
                                            }
                                             .frame(width: 165, height: 210, alignment: .leading)
                                             .cornerRadius(20)
                        
                                            
                                            HStack {
                                                VStack{
                                                        Image("blackpants3").resizable().frame(width: 165, height: 210 )
                                                    }
                                                
                                            }
                                             .frame(width: 165, height: 210, alignment: .leading)
                                             .cornerRadius(20)
                                            
                                            
                                            HStack {
                                                VStack{
                                                        Image("blackpants2").resizable().frame(width: 165, height: 210 )
                                                    }
                                            }
                                             .frame(width: 165, height: 210, alignment: .leading)
                                             .cornerRadius(20)
                                            
                                            HStack {
                                                VStack{
                                                        Image("top1").resizable().frame(width: 165, height: 210 )
                                                 }
                                            }
                                             .frame(width: 165, height: 210, alignment: .leading)
                                             .cornerRadius(20)
                                        }
                                    }
                                }
                            }
                        }
              } else {
                  
                  ZStack{
                          LazyVGrid(columns: gridLayout2, spacing: 10){
                              
                              if selectedCategory != "" {
                                  ForEach (obser.product) { product in
                                        DetView(product: product)
                                  }
                              } else {
                                  if selectedCategory == "" {
                                  ForEach(obser.product.filter({$0.name.contains(text) })) { product in
                                          ProductItemView(product: product)
                                    }
                                  } else {
                                      ForEach (obser.product) { product in
                                            DetView(product: product)
                                      }
                                  }
                                  
                                }
                            }
                            Spacer()
                        }
                          .ignoresSafeArea()
                          .background( Color.black.opacity(0.3).ignoresSafeArea().opacity(showFilter ? 1 : 0 ) )
                    }
                }
                .navigationBarHidden(true)
                .ignoresSafeArea()
            } // Vstack
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
    
    func addItem() {
        if text != "" {
            StringArray.append(String(text))
            text = ""
        }
    }
}

struct FilterItem: Identifiable {
    var id = UUID().uuidString
    var title : String
    var checked: Bool
}

struct FilterItem2: Identifiable {
    var id = UUID().uuidString
    var color : String
    var c : Color
    var checked: Bool
}

struct FilterItem3: Identifiable {
    var id = UUID().uuidString
    var Size : String
    var checked: Bool
}

struct CardView:View {

        @State var filter : FilterItem
        @ObservedObject var obser = observer()
        @Binding var selectedCategory : String // filter that is binded to the view

        var body: some View {
            
        HStack(spacing:15) {
                
          Button {
            print(filter.title)
            if self.selectedCategory != self.filter.title {
                self.selectedCategory = ""
                self.selectedCategory = self.filter.title
            }
        } label: {
            Text(filter.title).frame(width: 110, height: 35).background(.thinMaterial).cornerRadius(25)
        }.foregroundColor(.black).opacity(0.9)

            
        }

                
        }
}

struct CardView2:View {

        @State var filterColor : FilterItem2
        @ObservedObject var obser = observer()
        @Binding var selectedCategory : String // filter that is binded to the view
        var body: some View {
            
        HStack(spacing:15) {
          Button {
          print("button pressed")
          print(filterColor.color)
            if self.selectedCategory != self.filterColor.color{
                self.selectedCategory = ""
                self.selectedCategory = self.filterColor.color
            }
        } label: {
            HStack(spacing:5) {
                Spacer().frame(width: 4 )

                HStack {
                    
                }.frame(width: 17, height: 17 )
                    .background(filterColor.c)
                    .cornerRadius(55)
                Spacer().frame(width: 5 )
                
                Text(filterColor.color).font(.system(size: 17).bold()).foregroundColor(.black).opacity(0.7)
               
                Spacer().frame(width: 5 )
                    }.frame(width: 110, height: 35).background(.thinMaterial).cornerRadius(25)
                }.foregroundColor(.black).opacity(0.9)
            }
        }
}
struct CardView3:View {

        @State var filterSize : FilterItem3
        @ObservedObject var obser = observer()
        @Binding var selectedCategory : String // filter that is binded to the view
        var body: some View {
        HStack(spacing:15) {
                          Button {
        print("button pressed")
        print(filterSize.Size)
             if self.selectedCategory != self.filterSize.Size{
                self.selectedCategory = ""
                self.selectedCategory = self.filterSize.Size
            }
        } label: {
            Text(filterSize.Size).frame(width: 110, height: 35).background(.thinMaterial).cornerRadius(25)
        }.foregroundColor(.black).opacity(0.9)
            }
        }
}


struct searchView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}
