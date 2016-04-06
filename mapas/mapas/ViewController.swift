//
//  ViewController.swift
//  mapas
//
//  Created by Romildo Jozue Paiter on 4/1/16.
//  Copyright © 2016 Paiter Tecnologia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager = CLLocationManager();
    
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization();
        locationManager.startUpdatingLocation();
        
        
        
        //
        let latitude:CLLocationDegrees = 35.707596
        let longitude:CLLocationDegrees = 139.753718
        
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = location
        anotation.title = "Kodokan Japão"
        anotation.subtitle = "Primeira escola de Judô de Jigoro Kano"
        map.addAnnotation(anotation)
        
        let pressedGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.action(_:)))
        pressedGesture.minimumPressDuration = 1
        map.addGestureRecognizer(pressedGesture)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        var userLocation:CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        print("Pressed")
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCordinate:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = newCordinate
        anotation.title = "Lugar legal, ponto clicado "
        anotation.subtitle = "Subtitulo clicado do item"
        
        map.addAnnotation(anotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

