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
    var lookScene: MKLookAroundScene?
    var openView: Bool = false
    
    private init() {
        let coordinate = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403) // Pune
//        let coordinate = CLLocationCoordinate2D(latitude: 40.7580, longitude: -73.9855) // times Square, NYC
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
    
    func lookAround() {
        guard let region = cameraPostion.region else { return }
        
        Task {
            let request = MKLookAroundSceneRequest(coordinate: region.center)

            do {
                if let scene = try await request.scene {
                    await MainActor.run {
                        self.lookScene = scene
                        self.openView = true
                    }
                } else {
                    print("Look Around not available at this location")
                }
            } catch {
                print("Look Around error:", error)
            }
        }
    }

    
    
}
