//
//  MapVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//



class MapVC: BaseVC {
    
    var mapView: MAMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMapView()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MAUserTrackingMode.Follow
        mapView.delegate = self
        mapView.setZoomLevel(15.1, animated: true)
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
            poiAnnotionView.centerOffset = ccp(0, y: -18)
            poiAnnotionView.canShowCallout = false
            
            return poiAnnotionView
        }
        return nil
    }
    
    func mapView(mapView: MAMapView!, didSelectAnnotationView view: MAAnnotationView!) {
        print("didSelectAnnotationView")
    }
}
