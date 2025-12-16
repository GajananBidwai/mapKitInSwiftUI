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
    var route: MKRoute?
    var lastLocation = CLLocation()
    var isAuthorized: Bool = false
    
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

   
    func calculateRoute() async {
        let start = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403)
        let destination = CLLocationCoordinate2D(latitude: 18.5866, longitude: 73.8134)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .automobile
        
        do {
            let response = try await MKDirections(request: request).calculate()
            await MainActor.run {
                self.route = response.routes.first
            }
        } catch {
            print("Route calculation failed:", error)
        }
    }
    
    func requestAuthorization() {
        Task {
            do {
                let updates = CLLocationUpdate.liveUpdates()
                for try await update in updates {
                    if let loc = update.location {
                        lastLocation = loc
                        
                        if !isAuthorized {
                            let coordinate = CLLocationCoordinate2D(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                            cameraPostion = MapCameraPosition.region(region)
                            isAuthorized = true
                        }
                    } else {
                        checkError(update: update)
                    }
                }
            } catch {
                print("Error requesting location authorization:", error)
            }
        }
    }
    
    func checkError(update: CLLocationUpdate) {
        if update.authorizationDeniedGlobally {
            print("Authorization denied globally")
            isAuthorized = false
        } else if update.authorizationDenied {
            print("Authorization denied for this app")
            isAuthorized = false
        } else if update.authorizationRestricted {
            print("Authorization restricted")
            isAuthorized = false
        } else if update.accuracyLimited {
            print("Accuracy limited")
            isAuthorized = false
        } else if update.insufficientlyInUse {
            print("Insufficiency in use")
            isAuthorized = false
        }
    }
    
}
