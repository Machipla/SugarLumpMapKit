//
//  MKMapView+Area.swift
//  BoringSSL
//
//  Created by Mario Chinchilla on 31/5/18.
//

import Foundation
import MapKit

public extension MKMapView{
    public struct Area{
        public let northWestCoordinate:CLLocationCoordinate2D
        public let northEastCoordinate:CLLocationCoordinate2D
        public let southWestCoordinate:CLLocationCoordinate2D
        public let southEastCoordinate:CLLocationCoordinate2D
        
        public init(northWestCoordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0),
                    northEastCoordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0),
                    southWestCoordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0),
                    southEastCoordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)){
            self.northEastCoordinate = northEastCoordinate
            self.northWestCoordinate = northWestCoordinate
            self.southWestCoordinate = southWestCoordinate
            self.southEastCoordinate = southEastCoordinate
        }
    }
    
    var visibleArea:MKMapView.Area{
        let northWestCoordinate = MKCoordinateForMapPoint(MKMapPoint(x: MKMapRectGetMaxX(visibleMapRect), y: visibleMapRect.origin.y))
        let northEastCoordinate = MKCoordinateForMapPoint(MKMapPoint(x: MKMapRectGetMinX(visibleMapRect), y: visibleMapRect.origin.y))
        let southWestCoordinate = MKCoordinateForMapPoint(MKMapPoint(x: MKMapRectGetMaxX(visibleMapRect), y: MKMapRectGetMaxY(visibleMapRect)))
        let southEastCoordinate = MKCoordinateForMapPoint(MKMapPoint(x: visibleMapRect.origin.x, y: MKMapRectGetMaxY(visibleMapRect)))
        
        return MKMapView.Area(northWestCoordinate: northWestCoordinate, northEastCoordinate: northEastCoordinate, southWestCoordinate: southWestCoordinate, southEastCoordinate: southEastCoordinate)
    }
}
