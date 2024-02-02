//
//  MapView.swift
//  Landmarks
//
//  Created by steven on 2024/1/27.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}
//23.107175075734517, 112.55062250266701
#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 23.011_286, longitude: 112.55_24))
}
