//
//  PointOfInterest.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI
import MapKit

struct PointOfInterest: View {
    var body: some View {
        Map()
            .mapStyle(.standard(pointsOfInterest: .including(.airport))) // Show airport on map
    }
}

#Preview {
    PointOfInterest()
}
