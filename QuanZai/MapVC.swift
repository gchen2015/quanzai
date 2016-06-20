//
//  MapVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//



class MapVC: BaseVC, MAMapViewDelegate {
    
    var mapView: MAMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMapView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MAUserTrackingMode.Follow
        mapView.setZoomLevel(15.1, animated: true)
    }
    
    func initMapView() {
        
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        self.view.addSubview(mapView)
        self.view.sendSubviewToBack(mapView)
        
    }
    
}
