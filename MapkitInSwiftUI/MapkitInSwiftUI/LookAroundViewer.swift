//
//  LookAroundViewer.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct LookAroundViewer: View {
    @Environment(ApplicationData.self) private var appData
    
    var body: some View {
        @Bindable var appData = appData
        
        Map(position: $appData.cameraPostion)
            .safeAreaInset(edge: .bottom) {
                Button("Show Street") {
                    appData.lookAround()
                }.buttonStyle(.borderedProminent)
            }
            .lookAroundViewer(isPresented: $appData.openView, initialScene: appData.lookScene)
    }
}

#Preview {
    LookAroundViewer()
        .environment(ApplicationData.shared)
}
