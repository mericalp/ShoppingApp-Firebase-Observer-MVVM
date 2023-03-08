//
//  LocationData.swift
//  Shopping
//
//  Created by Meric on 2.09.2022.
//
 
import Foundation
import MapKit

class LocationData  {
            
         static let locations: [StoreModel] = [
            
            StoreModel(
                name: "Mersin",
                cityName: "Forum",
                coordinates: CLLocationCoordinate2D(latitude: 36.7854754087272, longitude: 34.588686200079565)
                ),
            
            StoreModel(
                name: "Istanbul",
                cityName: "Golet Mall",
                coordinates: CLLocationCoordinate2D(latitude: 41.06787031106211, longitude: 28.690748482986077)
                ),
            StoreModel(
                name: "Istanbul",
                cityName: "Mall of Istanbul",
                coordinates: CLLocationCoordinate2D(latitude: 41.0676506881821, longitude: 28.808069500838116)
                ),
         
         ]
 }

 
