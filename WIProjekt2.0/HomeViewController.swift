
import CoreLocation
import UIKit
import MapKit
import FirebaseFirestore


class HomeViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var db: Firestore!
    var hohe: Double = 0.0
    var lange: Double = 0.0

    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Set the mapView's delegate to self
        mapView?.delegate = self
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        mapView?.showsUserLocation = true
        

        
       
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: location.coordinate))
           
           
                    
                   
                    
                    let directions = MKDirections(request: request)
                    directions.calculate { response, error in
                        guard let route = response?.routes.first else { return }
                        self.mapView?.addOverlay(route.polyline)
                        self.mapView?.setVisibleMapRect(
                            route.polyline.boundingMapRect,
                            edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                            animated: true)
                        
                    }
                    
                    
                
            self.render(location)

            
           
            
         
        }
    }
    
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView?.region = region
    
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = UIColor.systemIndigo
            renderer.lineWidth = 5
            return renderer
        }
        return MKOverlayRenderer()
    }
}

