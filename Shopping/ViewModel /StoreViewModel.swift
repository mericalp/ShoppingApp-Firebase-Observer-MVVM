//
//  StoreViewModel.swift
//  Shopping
//
//  Created by Meric on 1.09.2022.
//

import Foundation
import MapKit
import SwiftUI

class StoresViewModel: ObservableObject {
    
    // All loaded locaitons
    @Published var locations: [StoreModel]
    // Current location on map
    @Published var mapLocations: StoreModel {
        didSet {
            updateMapRegion(locations: mapLocations)
        }
    }
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    // show location detail via sheet
    @Published var sheetLocation: StoreModel? = nil
    
    init() {
        let locations = LocationData.locations
        self.locations = locations
        self.mapLocations = locations.first!
        
    }
    
    private func updateMapRegion(locations:StoreModel) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: locations.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationsList(){
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
            
        }
    }
    
    func showNextLocaitons(location:StoreModel){
        withAnimation(.easeInOut) {
            mapLocations = location
            showLocationsList = false
        }
        
    }
    
    // MARK:
    func nextButtonPressed() {
        
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocations}) else {
            print("Could not find current index in location array! Should never happend ")
            return
        }
            
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // next index is not valid
            // restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocaitons(location: firstLocation)
            return
        }
        
        // next index IS Valid
        let nextLocation = locations[nextIndex]
        showNextLocaitons(location: nextLocation)
            
    }
    
    
}

