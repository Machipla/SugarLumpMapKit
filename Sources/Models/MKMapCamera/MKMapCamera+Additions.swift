//
//  MKMapCamera+Additions.swift
//  MCPResult
//
//  Created by Mario Chinchilla on 17/5/18.
//

import Foundation
import MapKit

public extension MKMapCamera{
    public enum Zoom: RawRepresentable{
        case streets
        case neighborhood
        case city
        case region
        case country
        case continent
        case custom(CLLocationDistance)
        
        public var rawValue: CLLocationDistance{
            switch self {
            case .streets:           return 150
            case .neighborhood:      return 1000
            case .city:              return 5250
            case .region:            return 100000
            case .country:           return 5000000
            case .continent:         return 10000000
            case let .custom(value): return value
            }
        }
        
        public init?(rawValue: CLLocationDistance) {
            switch rawValue {
            case 150:       self = .streets
            case 700:       self = .neighborhood
            case 3250:      self = .city
            case 10000:     self = .region
            case 5000000:   self = .country
            case 10000000:  self = .continent
            default:        self = .custom(rawValue)
            }
        }
    }
    
    public enum Heading: CLLocationDirection{
        case north = 0
        case east = 90
        case south = 180
        case west = 270
    }
    
    public convenience init(lookingAt coordinate:CLLocationCoordinate2D, zoomingTo zoom:MKMapCamera.Zoom = .neighborhood, pitch:CGFloat = 0, heading: MKMapCamera.Heading = .north){
        self.init(lookingAtCenter: coordinate, fromDistance: zoom.rawValue, pitch: pitch, heading: heading.rawValue)
    }
}
