////
////  MapViewController.swift
////  Chi Trip
////
////  Created by Gabbie on 8/1/18.
////  Copyright © 2018 Gabbie. All rights reserved.
////
//
//import Foundation
import UIKit
//import GoogleMaps
import MapKit
import SwiftyJSON
//
class MapViewController: UIViewController
{
    @IBOutlet weak var mapView: MKMapView!
    
    var favorites = [Favorite]()
//    var googleAPIKey = "AIzaSyAh9_Ub7U3ySx5pJg5roU46TJJqab__qeM"
    
    @IBAction func segmentedControlerDidChange(_ seg: UISegmentedControl) {
        if seg.selectedSegmentIndex == 0 { //my favs
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations(favorites)
            
        } else { //all attractions
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations(listOfAttractions)
        }
    }
    
//    locationManager.requestAlwaysAuthorization()
//    locationManager.requestWhenInUseAuthorization()
    
    //duc tran mothafukaaaah
    //    var venues = [Venue]()
    
    //    func fetchData()
    //    {
    //        let fileName = Bundle.main.path(forResource: "Venues", ofType: "json")
    //        let filePath = URL(fileURLWithPath: fileName!)
    //        var data: Data?
    //        do {
    //            data = try Data(contentsOf: filePath, options: Data.ReadingOptions(rawValue: 0))
    //        } catch let error {
    //            data = nil
    //            print("Report error \(error.localizedDescription)")
    //        }
    //
    //        if let jsonData = data {
    //            let json = JSON(data: jsonData)
    //            if let venueJSONs = json["response"]["venues"].array {
    //                for venueJSON in venueJSONs {
    //                    if let venue = Venue.from(json: venueJSON) {
    //                        self.venues.append(venue)
    //                    }
    //                }
    //            }
    //        }
    //    }
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 41.8781, longitude: -87.6298) //coordinates of chicago
        zoomMapOn(location: initialLocation)
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        //        fetchData()
        
//        let listOfAnnotations = listOfAttractions.map { (anAttraction) -> MKAnnotation in
//
//
//        }
        
        mapView.addAnnotations(favorites)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favorites = CoreDataHelper.retrieveFavorites()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationServiceAuthenticationStatus()
    }
    
    private let regionRadius: CLLocationDistance = 3000 // 1km ~ 1 mile = 1.6km
    func zoomMapOn(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - Current Location
    
    var locationManager = CLLocationManager()
    
    func checkLocationServiceAuthenticationStatus()
    {
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - Show Direction
    
    var currentPlacemark: CLPlacemark?
    
    @IBAction func showDirection(sender: Any)
    {
        guard let currentPlacemark = currentPlacemark else {
            return
        }
        
        let directionRequest = MKDirectionsRequest()
        let destinationPlacemark = MKPlacemark(placemark: currentPlacemark)
        
        directionRequest.source = MKMapItem.forCurrentLocation()
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .automobile
        
        // calculate the directions / route
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (directionsResponse, error) in
            guard let directionsResponse = directionsResponse else {
                if let error = error {
                    print("error getting directions: \(error.localizedDescription)")
                }
                return
            }
            
            let route = directionsResponse.routes[0]
            self.mapView.removeOverlays(self.mapView.overlays)
            self.mapView.add(route.polyline, level: .aboveRoads)
            
            let routeRect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(routeRect), animated: true)
        }
    }
}

extension MapViewController : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last!
        self.mapView.showsUserLocation = true
        //        zoomMapOn(location: location)
    }
}

extension MapViewController : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if let annotation = annotation as? Attraction {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            return view
        }
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        if let location = view.annotation as? Attraction {
            self.currentPlacemark = MKPlacemark(coordinate: location.coordinate)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        let renderer = MKPolylineRenderer(overlay: overlay)
        
        renderer.strokeColor = UIColor.orange
        renderer.lineWidth = 4.0
        
        return renderer
    }
}

extension Favorite: MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.lat, longitude: self.long)
    }
    
    public var subtitle: String? {
        return nil
//        return self.address
    }
    
    public var title: String? {
        return self.name
    }
    
}

