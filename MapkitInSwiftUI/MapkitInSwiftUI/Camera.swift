//
//  Camera.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct Camera: View {
    @Environment(ApplicationData.self) private var appData
    
    var body: some View {
        @Bindable var appData = appData
        
        Map(position: $appData.cameraPostion) {
            if appData.isAuthorized {
                UserAnnotation()
            }
        }
    }
}

#Preview {
    Camera()
        .environment(ApplicationData.shared)
}
