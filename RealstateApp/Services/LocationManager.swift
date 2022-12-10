//
//  LocationsManager.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject{
    
    private var locationManager: CLLocationManager?
    
    @Published var userLocation: CLLocation?
    
    static let shared = LocationManager()
    
    func checkIfLocationServicesIsEnabled() {
        
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager = CLLocationManager()
            self.locationManager?.delegate = self
        } else {
            //TODO: show alert to notify user with the message below
            print("turn your locations services on")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
   
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restricted likely due to parental controls.")
            case .denied:
                print("Permission denied")
            case .authorizedAlways, .authorizedWhenInUse:
                self.userLocation = CLLocation(latitude: locationManager.location?.coordinate.latitude ?? Constant.defaultLatitude, longitude: locationManager.location?.coordinate.longitude ?? Constant.defaultLongitude)
            @unknown default:
                break
        }
    }
}
