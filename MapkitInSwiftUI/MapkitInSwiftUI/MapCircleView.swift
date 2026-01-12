//
//  MapCircleView.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct MapCircleView: View {
    @Environment(ApplicationData.self) private var appData
    var coordinate = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403)
    
    var body: some View {
        @Bindable var appData = appData
        
        Map(position: $appData.cameraPostion) {
            MapCircle(center: coordinate, radius: 100)
                .foregroundStyle(.blue)
                .mapOverlayLevel(level: .aboveRoads)
        }
    }
}

#Preview {
    MapCircleView()
        .environment(ApplicationData.shared)
        
}
