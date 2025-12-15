//
//  ContentView.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 15/12/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @Environment(ApplicationData.self) private var appData
    var coordinate = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403)
    var savvyHomes = CLLocationCoordinate2D(latitude: 18.5963, longitude: 73.7396)
    
    var body: some View {
        @Bindable var appData = appData
        
//        Map()
//            .mapStyle(.standard(pointsOfInterest: .including(.cafe))) // Show cafe on map
//        Map(position: $appData.cameraPostion, interactionModes: .zoom)
//        Map(position: $appData.cameraPostion, bounds: appData.cameraBound) //Can not moves out of 1000 meter parameter
        
//        Map(position: $appData.cameraPostion) {
//            Marker("Blue Ridge", coordinate: coordinate)
//                .tint(.blue)
            
//            Annotation("Blue ridge", coordinate: coordinate) {
//                Image(.sample)
//                    .resizable()
//                    .frame(width: 50, height: 50)
//            }
            
//            MapCircle(center: coordinate, radius: 100)
//                .foregroundStyle(.blue)
//                .mapOverlayLevel(level: .aboveRoads)
            
//            MapPolyline(coordinates: [coordinate, savvyHomes])
//                .stroke(.red, lineWidth: 5)
//        }
        Map(position: $appData.cameraPostion) {
            ForEach(appData.listLocation,id: \.self) { place in
                Marker(item: place)
            }
        }
        .onMapCameraChange { context in
            appData.cameraPostion = .region(context.region)
            Task(priority: .background) {
                await appData.findPlaces()
            }
        }
    }
        
}

#Preview {
    ContentView()
        .environment(ApplicationData.shared)
}
