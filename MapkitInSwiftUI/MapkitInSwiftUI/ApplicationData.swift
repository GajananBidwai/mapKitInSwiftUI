//
//  ApplicationData.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 15/12/25.
//

import Foundation
import Observation
import MapKit
import _MapKit_SwiftUI

@Observable class ApplicationData: @unchecked Sendable {
    var cameraPostion: MapCameraPosition
    var cameraBound: MapCameraBounds
    static let shared: ApplicationData = ApplicationData()
    
    
    private init() {
        let coordinate = CLLocationCoordinate2D(latitude: 40.767382, longitude: -73.97313286)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        cameraPostion = MapCameraPosition.region(region)
        cameraBound = MapCameraBounds(centerCoordinateBounds: region, minimumDistance: 200, maximumDistance: 1000)
    }
    
}
