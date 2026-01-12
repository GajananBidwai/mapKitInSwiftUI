//
//  DetailSheet.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct DetailSheet: View {
    @Environment(ApplicationData.self) private var appData
    @State private var selectedItems: MapSelection<MKMapItem>?
    @State private var showCallout: Bool = false
    
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
        .onChange(of: selectedItems) { oldValue, newValue in
            if let item = newValue?.value {
                print(item.name ?? "Undefined")
                print(item.placemark.locality ?? "Undefined")
                print(item.phoneNumber ?? "Undefined")
            }
            if newValue != nil {
                showCallout = true
            }
        }
        .mapItemDetailSheet(isPresented: $showCallout, item: selectedItems?.value, displaysMap: true)    }
}

#Preview {
    DetailSheet()
        .environment(ApplicationData.shared)
}
