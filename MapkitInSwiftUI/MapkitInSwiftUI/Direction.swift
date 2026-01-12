//
//  Direction.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct Direction: View {
    @Environment(ApplicationData.self) private var appData
    @State private var selectedItems: MapSelection<MKMapItem>?
    
    var body: some View {
        
        
    }
}

#Preview {
    Direction()
        .environment(ApplicationData.shared)
}
