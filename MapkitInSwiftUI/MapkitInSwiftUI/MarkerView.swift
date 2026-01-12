//
//  Marker.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit


struct MarkerView: View {
    @Environment(ApplicationData.self) private var appData
    var coordinate = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403)
    
    var body: some View {
        @Bindable var appData = appData
        
        Map(position: $appData.cameraPostion) {
            Marker("Blue Ridge", coordinate: coordinate)
                .tint(.blue)
        }
    }
}

#Preview {
    MarkerView()
        .environment(ApplicationData.shared)
}
