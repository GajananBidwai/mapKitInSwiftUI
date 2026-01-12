//
//  TopicListView.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import SwiftUI

struct TopicsListView: View {
    @StateObject private var viewModel = TopicsViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.topics) { topic in
                NavigationLink {
                    destinationView(for: topic)
                } label: {
                    Text(topic.name)
                        .font(.headline)
                }
            }
            .navigationTitle("Map Topics")
            .onAppear {
                viewModel.loadTopics()
            }
        }
    }
    
    @ViewBuilder
    func destinationView(for topic: Topic) -> some View {
        switch topic.name {
        case "points-Of-Interest":
            PointOfInterest()
            
        case "MarkerView":
            MarkerView()
            
        case "AnnotationView":
            AnnotationView()
            
        case "MapCircleView":
            MapCircleView()
            
        case "MapPolylineView":
            MapPolylineView()
            
        case "FindPlace":
            FindPlaces()
            
        case "DetailSheet":
            DetailSheet()
            
        case "CompassMapPitchToogle":
            CompassMapPitchToogle()
            
        case "LookAroundViewSheet":
            LookAroundViewSheet()
            
        case "LookAroundViewer":
            LookAroundViewer()
            
        case "CalculateRoute":
            CalculateRoute()

        case "Camera":
            Camera()

        case "MapContent":
            MapContent()

        default:
            Text("Coming Soon")
        }
    }

}


#Preview {
    TopicsListView()
}
