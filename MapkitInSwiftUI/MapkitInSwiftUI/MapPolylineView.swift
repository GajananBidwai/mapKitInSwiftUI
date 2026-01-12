//
//  MapPolylineView.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct MapPolylineView: View {
    @Environment(ApplicationData.self) private var appData
    var coordinate = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403)
    var savvyHomes = CLLocationCoordinate2D(latitude: 18.5963, longitude: 73.7396)
    
    var body: some View {
        @Bindable var appData = appData
        
        Map(position: $appData.cameraPostion) {
            MapPolyline(coordinates: [coordinate, savvyHomes])
                .stroke(.red, lineWidth: 5)
        }
    }
}

#Preview {
    MapPolylineView()
        .environment(ApplicationData.shared)
        
}
