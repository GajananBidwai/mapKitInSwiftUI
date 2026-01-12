//
//  LookAroundView.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit


struct LookAroundViewSheet: View {
    @Environment(ApplicationData.self) private var appData
    @State private var selectedItems: MapSelection<MKMapItem>?
    
    var body: some View {
        @Bindable var appData = appData
        
        
        Map(position: $appData.cameraPostion)
            .safeAreaInset(edge: .bottom) {
                if appData.openView {
                    VStack {
                        LookAroundPreview(scene: $appData.lookScene)
                            .frame(height: 200)
                            .padding()
                        Button("Hide Street") {
                            appData.openView = false
                        }.buttonStyle(.borderedProminent)
                    }
                } else {
                    Button("Show Street") {
                        appData.lookAround()
                    }.buttonStyle(.borderedProminent)
                    
                }
            }
    }
}

#Preview {
    LookAroundViewSheet()
        .environment(ApplicationData.shared)
}
