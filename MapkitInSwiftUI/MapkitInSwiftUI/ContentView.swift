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
    var body: some View {
        @Bindable var appData = appData
        
//        Map()
//            .mapStyle(.standard(pointsOfInterest: .including(.cafe))) // Show cafe on map
//        Map(position: $appData.cameraPostion, interactionModes: .zoom)
        Map(position: $appData.cameraPostion, bounds: appData.cameraBound) //Can not moves out of 1000 meter parameter
            
    }
}

#Preview {
    ContentView()
        .environment(ApplicationData.shared)
}
