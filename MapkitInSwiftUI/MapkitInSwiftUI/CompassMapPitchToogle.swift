//
//  CompassMapPitchToogle.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct CompassMapPitchToogle: View {
    @Environment(ApplicationData.self) private var appData
    @State private var selectedItems: MapSelection<MKMapItem>?
    @Namespace var mapSpace
    
    var body: some View {
        @Bindable var appData = appData
        
        Map(position: $appData.cameraPostion)
            .mapControlVisibility(.hidden)
            .safeAreaInset(edge: .top) {
                HStack {
                    MapCompass(scope: mapSpace)
                        .padding(5)
                        .background {
                            Circle()
                                .fill(.thinMaterial)
                                .stroke(Color.red, lineWidth: 2)
                        }
                    Spacer()
                    MapPitchToggle(scope: mapSpace)
                        .padding(5)
                        .background {
                            Circle()
                                .fill(.thinMaterial)
                                .stroke(Color.red, lineWidth: 2)
                        }
                }.padding()
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .mapScope(mapSpace)    }
}

#Preview {
    CompassMapPitchToogle()
        .environment(ApplicationData.shared)
}
