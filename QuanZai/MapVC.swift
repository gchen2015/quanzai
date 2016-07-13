//
//  MapVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import SwiftyDrop
import Presentr

protocol MapVCProtocol : class {
    func getUserLocation(locaion: MAUserLocation)
}

class MapVC: BaseVC {
    
    var delegate : MapVCProtocol?
    var mapView: MAMapView!
    var isLastLocation: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMapView()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        mapView.userTrackingMode = MAUserTrackingMode.Follow
//        mapView.setZoomLevel(14.1, animated: true)
//        mapView.showsUserLocation = true
        self.startLocation()
    }
    
    func initMapView() {
        
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        self.view.addSubview(mapView)
        self.view.sendSubviewToBack(mapView)
        
        let locationBtn = UIButton(imageName: "icon_my_location_48px", hlImageName: "icon_my_location_48px") { (locaionBtn) in
            self.startLocation()
        }
        locationBtn.frame = ccr(10, 10, 30, 30)
        mapView.addSubview(locationBtn)
    }
    
    func setPoi(pois: NSArray) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(pois as [AnyObject])
    }
    
    func startLocation() {

        mapView.setUserTrackingMode(MAUserTrackingMode.Follow, animated: true)
        mapView.setZoomLevel(14.1, animated: false)
        mapView.showsUserLocation = true
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
    
    func mapViewWillStartLocatingUser(mapView: MAMapView!) {
        isLastLocation = false
    }
    
    func mapView(mapView: MAMapView!, mapDidMoveByUser wasUserAction: Bool) {
        isLastLocation = false
    }
    
    func mapView(mapView: MAMapView!, mapDidZoomByUser wasUserAction: Bool) {
        isLastLocation = false
    }
    
    func mapViewDidStopLocatingUser(mapView: MAMapView!) {
//        self.delegate?.getUserLocation(mapView.userLocation)
    }
    
    func mapViewDidFinishLoadingMap(mapView: MAMapView!) {
        self.startLocation()
    }
    
    func mapView(mapView: MAMapView!, didFailToLocateUserWithError error: NSError!) {
        self.alertPresenter("提示", body: "定位失败，请确认定位功能已经开启", okTitle: "确定")
    }
    
    func mapView(mapView: MAMapView!, didUpdateUserLocation userLocation: MAUserLocation!, updatingLocation: Bool) {
        if updatingLocation && !isLastLocation {
          self.delegate?.getUserLocation(mapView.userLocation)
            isLastLocation = true
        }
    }
}
