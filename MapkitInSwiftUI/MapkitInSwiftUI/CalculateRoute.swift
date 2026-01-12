//
//  CalculateRoute.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct CalculateRoute: View {
    @Environment(ApplicationData.self) private var appData
    let start = CLLocationCoordinate2D(latitude: 40.7580, longitude: -73.9855) // times Square, NYC
    let destination = CLLocationCoordinate2D(latitude: 40.7661, longitude: -73.9776)


    var body: some View {
        @Bindable var appData = appData
        
        Map(position: $appData.cameraPostion) {
            Marker("Start", coordinate: start)
            Marker("Destination", coordinate: destination)
            
            if let route = appData.route {
                MapPolyline(route.polyline)
                    .stroke(.red, lineWidth: 5)
            }
        }
        .onAppear {
            Task {
                await appData.calculateRoute()
            }
        }
    }
}

#Preview {
    CalculateRoute()
        .environment(ApplicationData.shared)
}
