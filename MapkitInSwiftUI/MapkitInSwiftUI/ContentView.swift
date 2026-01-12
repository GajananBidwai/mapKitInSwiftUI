//
//  ContentView.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 15/12/25.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct ContentView: View {
    
    @Environment(ApplicationData.self) private var appData
    var coordinate = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403)
    var savvyHomes = CLLocationCoordinate2D(latitude: 18.5963, longitude: 73.7396)
    @State private var selectedItems: MapSelection<MKMapItem>?
    @State private var showCallout: Bool = false
    @Namespace var mapSpace
    let start = CLLocationCoordinate2D(latitude: 18.5755, longitude: 73.7403)
    let destination = CLLocationCoordinate2D(latitude: 18.5866, longitude: 73.8134)
    
    var body: some View {
        @Bindable var appData = appData
        
//        Map()
//            .mapStyle(.standard(pointsOfInterest: .including(.cafe))) // Show cafe on map
//        Map(position: $appData.cameraPostion, interactionModes: .zoom)
//        Map(position: $appData.cameraPostion, bounds: appData.cameraBound) //Can not moves out of 1000 meter parameter
        
//        Map(position: $appData.cameraPostion) {
//            Marker("Blue Ridge", coordinate: coordinate)
//                .tint(.blue)
//            
//            Annotation("Blue ridge", coordinate: coordinate) {
//                Image(.sample)
//                    .resizable()
//                    .frame(width: 50, height: 50)
//            }
//            
//            MapCircle(center: coordinate, radius: 100)
//                .foregroundStyle(.blue)
//                .mapOverlayLevel(level: .aboveRoads)
//            
//            MapPolyline(coordinates: [coordinate, savvyHomes])
//                .stroke(.red, lineWidth: 5)
//        }
        
//        Map(position: $appData.cameraPostion, selection: $selectedItems) {
//            ForEach(appData.listLocation,id: \.self) { place in
//                Marker(item: place)
//                    .tag(MapSelection(place))
//            }
////            .mapItemDetailSelectionAccessory(.callout)
//        }
//        .onMapCameraChange { context in
//            appData.cameraPostion = .region(context.region)
//            Task(priority: .background) {
//                await appData.findPlaces()
//            }
//        }
//        .onChange(of: selectedItems) { oldValue, newValue in
//            if let item = newValue?.value {
//                print(item.name ?? "Undefined")
//                print(item.placemark.locality ?? "Undefined")
//                print(item.phoneNumber ?? "Undefined")
//            }
//            if newValue != nil {
//                showCallout = true
//            }
//        }
//        .mapItemDetailSheet(isPresented: $showCallout, item: selectedItems?.value, displaysMap: true)
//        Map(position: $appData.cameraPostion)
//            .mapControls {
//                MapCompass()
//                MapScaleView()
//                MapPitchToggle()
//            }
//            .mapControlVisibility(.visible)
//        Map(position: $appData.cameraPostion)
//            .mapControlVisibility(.hidden)
//            .safeAreaInset(edge: .top) {
//                HStack {
//                    MapCompass(scope: mapSpace)
//                        .padding(5)
//                        .background {
//                            Circle()
//                                .fill(.thinMaterial)
//                                .stroke(Color.red, lineWidth: 2)
//                        }
//                    Spacer()
//                    MapPitchToggle(scope: mapSpace)
//                        .padding(5)
//                        .background {
//                            Circle()
//                                .fill(.thinMaterial)
//                                .stroke(Color.red, lineWidth: 2)
//                        }
//                }.padding()
//                .frame(minWidth: 0, maxWidth: .infinity)
//            }
//            .mapScope(mapSpace)
//        Map(position: $appData.cameraPostion)
//            .safeAreaInset(edge: .bottom) {
//                if appData.openView {
//                    VStack {
//                        LookAroundPreview(scene: $appData.lookScene)
//                            .frame(height: 200)
//                            .padding()
//                        Button("Hide Street") {
//                            appData.openView = false
//                        }.buttonStyle(.borderedProminent)
//                    }
//                } else {
//                    Button("Show Street") {
//                        appData.lookAround()
//                    }.buttonStyle(.borderedProminent)
//                
//                }
//            }
//        Map(position: $appData.cameraPostion)
//            .safeAreaInset(edge: .bottom) {
//                Button("Show Street") {
//                    appData.lookAround()
//                }.buttonStyle(.borderedProminent)
//            }
//            .lookAroundViewer(isPresented: $appData.openView, initialScene: appData.lookScene)
        
//        Map(position: $appData.cameraPostion) {
//            
//            Marker("Start", coordinate: start)
//            Marker("Destination", coordinate: destination)
//            
//            if let route = appData.route {
//                MapPolyline(route.polyline)
//                    .stroke(.red, lineWidth: 5)
//            }
//        }
//        .onAppear {
//            Task {
//                await appData.calculateRoute()
//            }
//        }
        
//        Map(position: $appData.cameraPostion) {
//            if appData.isAuthorized {
//                UserAnnotation()
//            }
//        }
//        .mapControls {
//            if appData.isAuthorized {
//                MapUserLocationButton()
//            }
//        }
//        .onAppear {
//            appData.requestAuthorization()
//        }
//        .safeAreaInset(edge: .bottom) {
//            LocationButton(.currentLocation) {
//                appData.cameraPostion = .userLocation(fallback: .automatic)
//            }.padding()
//        }

    }
        
}

#Preview {
    ContentView()
        .environment(ApplicationData.shared)
}
