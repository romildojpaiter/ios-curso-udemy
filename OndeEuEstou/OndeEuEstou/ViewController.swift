//
//  ViewController.swift
//  OndeEuEstou
//
//  Created by Romildo Jozue Paiter on 4/4/16.
//  Copyright © 2016 Paiter Tecnologia. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager:CLLocationManager!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var direcaoCursoLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuração para utilização de geoprocessamento no ios
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        let userLocation:CLLocation = locations[0]
        
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        self.direcaoCursoLabel.text = "\(userLocation.course)"
        self.velocidadeLabel.text = "\(userLocation.speed)"
        self.altitudeLabel.text = "\(userLocation.altitude)"
        
        // Reverse Geocode
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placeMarks, error) in
            if error != nil {
                print(error);
            } else {
                let placeMark = placeMarks?[0]
                let userPlaceMark:CLPlacemark = CLPlacemark(placemark: placeMark!)
                // print(userPlaceMark)
                
                self.addressLabel.text = "\(userPlaceMark.subLocality!) \(userPlaceMark.subAdministrativeArea!) \(userPlaceMark.postalCode!) \(userPlaceMark.country!)"
            }
            
        }
        
    }

}

