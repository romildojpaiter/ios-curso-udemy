//
//  ViewController.swift
//  LugaresFavoritos
//
//  Created by Romildo Jozue Paiter on 4/5/16.
//  Copyright © 2016 Paiter Tecnologia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager: CLLocationManager!

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Config managerLocation
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            // Responsavel por pegar localização inicial
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {
            let latitude = NSString(string: places[activePlace]["lat"]!).doubleValue
            let longitude = NSString(string: places[activePlace]["lon"]!).doubleValue
            
            self.configRegionOnMap(latitude, longitude: longitude);

        }
        
        // Criando um Gesture Recoginizer para poder adicionar um marcador(PIN)
        // Com ele criamos um reconhecer de gestos
        let uilgpr = UILongPressGestureRecognizer(target: self,
                                                  action: #selector(ViewController.actionAddMarcador(_:)))
        uilgpr.minimumPressDuration = 2.0
        
        // Adicionando ao mapa o reconhecedo de movimentos
        map.addGestureRecognizer(uilgpr);
        
    }
    
    // Ação chamada quando o botão é Precionado por 2 segundos
    func actionAddMarcador(gestureRecognizer: UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            let touchPoint = gestureRecognizer.locationInView(self.map)
            // pegar a possição passada pelo touchPoin
            let coordinatePoint = self.map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            
            // Buscar o Endereço Reverço
            let newLocation = CLLocation(latitude: coordinatePoint.latitude, longitude: coordinatePoint.longitude)
            
            CLGeocoder().reverseGeocodeLocation(newLocation, completionHandler: { (placeMarkers, error) in
                var title = ""
                if error == nil {
                    if let p = placeMarkers?[0]{
                        var address = ""
                        var address2 = ""

                        if p.thoroughfare != nil {
                            address = p.thoroughfare!
                        }

                        if p.subThoroughfare != nil {
                            address2 = p.subThoroughfare!
                        }
                        
                        title = "\(address2) \(address)"
                    }
                } else {
                    if title.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) == "" {
                        
                    }
                }
                
                // Adiciona o local a variavel global
                places.append(["name": title, "lat": "\(coordinatePoint.latitude)",
                                              "lon": "\(coordinatePoint.longitude)"])
                
                // Criando um marcador
                let anotation = MKPointAnnotation()
                anotation.coordinate = coordinatePoint
                anotation.title = title
                anotation.subtitle = "subtitle"
                
                // Adicionando o marcador ao mapa
                self.map.addAnnotation(anotation);

            })
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        self.configRegionOnMap(latitude, longitude: longitude);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configRegionOnMap(latitude: Double, longitude: Double) {
        // Criando uma coordenada
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let latDelta:CLLocationDegrees = 0.01
        let logDelta:CLLocationDegrees = 0.01
        
        // criando região
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: logDelta)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        self.map.setRegion(region, animated: true)
        
        criaAnotation(coordinate);
    }
    
    func criaAnotation(coordinate: CLLocationCoordinate2D) {
        // Criando um marcador
        let anotation = MKPointAnnotation()
        anotation.coordinate = coordinate
        anotation.title = title
        anotation.subtitle = "subtitle"
        
        // Adicionando o marcador ao mapa
        self.map.addAnnotation(anotation);
    }
    
    

}
