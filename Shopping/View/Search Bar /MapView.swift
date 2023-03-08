//
//  MapView.swift
//  Shopping
//
//  Created by Meric on 2.09.2022.
//

import SwiftUI
import MapKit


struct MapView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var vm: StoresViewModel
    let maxWdithForIPad: CGFloat = 700
 
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion,annotationItems: vm.locations,annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    StoresMarkView()
                        .scaleEffect(vm.mapLocations == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocaitons(location: location)
                        }
                     }
                  }
               )
                .ignoresSafeArea()
            
           VStack(spacing:0) {
                    Spacer()
                     ZStack{
                        ForEach(vm.locations){ location in
                            if vm.mapLocations == location {
                                StoresDetailView(location: location)
                                    .shadow(color: Color.black.opacity(0.2), radius: 20 )
                                    .padding()
                                    .frame(maxWidth:maxWdithForIPad)
                                    .frame(maxWidth: .infinity)
                                    .transition(AnyTransition.opacity.animation(.easeInOut))
                            }
                        }
                     }
              }
         }
         .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            StoresDetailView(location: location)
          }
         .navigationBarBackButtonHidden(true)
         .toolbar {
             ToolbarItem(placement: .navigationBarLeading) {
                 Button {
                     presentationMode.wrappedValue.dismiss()
                 } label: {
                     HStack{
                         Image(systemName: "chevron.left").resizable() .frame(width: 8, height: 14).foregroundColor(.white)
                         }
                        .frame(width: 50, height: 32)
                         .background(
                            Rectangle()
                                .fill(.black)
                                .cornerRadius(44)
                          )
                         .cornerRadius(44)
                 }
             }
         }
    }
}

struct MapView_Previews: PreviewProvider {

    static var previews: some View {
        MapView().environmentObject(StoresViewModel())
    }
}
