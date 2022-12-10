//
//  MapView.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
    var latitude: Double
    
    var longitude: Double
    
    var locations: [Location] = []
    
    @State private var region: MKCoordinateRegion
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: Constant.defualtCoordinateDelta, longitudeDelta: Constant.defualtCoordinateDelta))
        
        locations.append(Location(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)))
        locations.append(Location(coordinate: LocationManager.shared.userLocation?.coordinate ?? CLLocationCoordinate2D(latitude: Constant.defaultLatitude, longitude: Constant.defaultLongitude)))
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapPin(coordinate: location.coordinate)
        } .frame(height: 250)
            .padding(.all, 20)
            .onTapGesture {

                let placement = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                let mapItem = MKMapItem(placemark: placement)
                
                mapItem.openInMaps(launchOptions: nil)
                
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: Constant.defaultLatitude, longitude: Constant.defaultLongitude)
    }
}
