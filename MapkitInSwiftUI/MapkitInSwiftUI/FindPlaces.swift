//
//  FindPlaces.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct FindPlaces: View {
    @Environment(ApplicationData.self) private var appData
    @State private var selectedItems: MapSelection<MKMapItem>?
    
    var body: some View {
        @Bindable var appData = appData
        
        Map(position: $appData.cameraPostion, selection: $selectedItems) {
            ForEach(appData.listLocation,id: \.self) { place in
                Marker(item: place)
                    .tag(MapSelection(place))
            }
//            .mapItemDetailSelectionAccessory(.callout)
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
    FindPlaces()
        .environment(ApplicationData.shared)
}
