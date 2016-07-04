//
//  MapVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

protocol MapVCProtocol : class {
    func getUserLocation(locaion: MAUserLocation)
}

class MapVC: BaseVC {
    
    var delegate : MapVCProtocol?
    var mapView: MAMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMapView()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        mapView.userTrackingMode = MAUserTrackingMode.Follow
        mapView.setZoomLevel(14.1, animated: true)
        mapView.showsUserLocation = true
    }
    
    func initMapView() {
        
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        self.view.addSubview(mapView)
        self.view.sendSubviewToBack(mapView)
    }
    
    func setPoi(pois: NSArray) {
        
        mapView.addAnnotations(pois as [AnyObject])
    }
}

// MARK: - MAMapViewDelegate

extension MapVC: MAMapViewDelegate {
    
    func mapView(mapView: MAMapView!, viewForAnnotation annotation: MAAnnotation!) -> MAAnnotationView! {
        
        if annotation.isKindOfClass(MAPointAnnotation) {
            let annotationIdentifier = "annotationIdentifier"
            var poiAnnotionView = mapView.dequeueReusableAnnotationViewWithIdentifier(annotationIdentifier)
            if poiAnnotionView == nil {
                poiAnnotionView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            }
            
            poiAnnotionView.image = IMG("point")
            poiAnnotionView.centerOffset = ccp(0, -18)
            poiAnnotionView.canShowCallout = false
            
            return poiAnnotionView
        }
        return nil
    }
    
    func mapView(mapView: MAMapView!, didSelectAnnotationView view: MAAnnotationView!) {
        print("didSelectAnnotationView")
    }
    
    func mapViewDidFinishLoadingMap(mapView: MAMapView!) {
        self.delegate?.getUserLocation(mapView.userLocation)
    }
    
    func mapView(mapView: MAMapView!, didUpdateUserLocation userLocation: MAUserLocation!, updatingLocation: Bool) {
//        if updatingLocation {
//          self.delegate?.getUserLocation(mapView.userLocation)
//        }
    }
}
