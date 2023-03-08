//
//  Refresh.swift
//  Shopping
//
//  Created by Meric on 2.09.2022.
//

import SwiftUI

struct Refresh: View {
    
     @State var refresh =  Refreshh(started:false,released: false)
    
    var body: some View {
        
         VStack {
            Spacer().frame(height:80)
            HStack{
                Text("T-Shirts").foregroundColor(.purple).font(.title2)
                Spacer().frame(width:280)
             }
             .frame(width: UIScreen.main.bounds.width,height:50)
             .background(.white)
            ScrollView(.vertical, showsIndicators: false) {
                
                // - geometry reader for calculationg position
                GeometryReader{ reader -> AnyView in
                     DispatchQueue.main.async {
                        if refresh.OffsetStart == 0 {
                            refresh.OffsetStart = reader.frame(in: .global).minY
                        }
                        refresh.offset = reader.frame(in: .global).minY
                        
                        if refresh.offset - refresh.OffsetStart > 90 && !refresh.started {
                            refresh.started = true
                        }
 
                        if refresh.OffsetStart == refresh.offset && refresh.started && !refresh.released{
                            withAnimation(Animation.linear){refresh.released = true}
                            update()
                         }
                     }
                    //  print(reader.frame(in: .global).minY)
                    return AnyView(Color.black.frame(width: 0, height: 0))
                  }
                .frame(width: 0, height: 0)
                
                 ZStack ( alignment: Alignment(horizontal: .center, vertical: .top )) {
                     // MARK: Arrow and Indicator...
 
                    if refresh.started && refresh.released {
                        ProgressView()
                            .offset(y:-45)
                    } else {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 16,weight: .heavy))
                            .foregroundColor(.black)
                            .rotationEffect(.init(degrees: refresh.started ? 180:0))
                            .offset(y:-30)
                            .animation(.easeIn)
                    }
                    
                    VStack{
                     
                    } //  VSTACK
                    .background(.white)
                    
                }.offset(y:refresh.released ? 40 : -10)
         }
    }
    .background(.black.opacity(0.06))
    .ignoresSafeArea()
   }
    
     func update()  {
        
        print("update data...")
        
         DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear) {
                 refresh.released = false
                refresh.started = false
            }
        }
    }
}

// MARK:  Refresh Model

struct Refreshh {
    var OffsetStart: CGFloat = 0
    var offset: CGFloat = 0
    var started: Bool
    var released: Bool
}
 
 
struct Refresh_Previews: PreviewProvider {
    static var previews: some View {
        Refresh()
    }
}
