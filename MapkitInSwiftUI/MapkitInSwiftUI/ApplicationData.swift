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
    var listLocation: [MKMapItem] = []
    
    private init() {
        let coordinate = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        cameraPostion = MapCameraPosition.region(region)
        cameraBound = MapCameraBounds(centerCoordinateBounds: region, minimumDistance: 200, maximumDistance: 1000)
    }
    
    func findPlaces() async {
        if let region = cameraPostion.region {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = "pizza"
            request.region = region
            
            let search = MKLocalSearch(request: request)
            if let result = try? await search.start() {
                let items = result.mapItems
                await MainActor.run {
                    listLocation = []
                    for place in items {
                        listLocation.append(place)
                    }
                }
            }
        }
    }
    
}
