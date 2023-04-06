
import CoreLocation
import UIKit
import MapKit
import FirebaseFirestore



class FahrenViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var abholzeit: UILabel!
    @IBOutlet weak var ankunftzeit: UILabel!
    
    var db: Firestore!
    var hohe: Double = 0.0
    var lange: Double = 0.0
    var name: String?
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
        let docRef = db.collection("Ärzte").document("Fahrt")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                let abholzeit1 = data?["AbholZeit"] as? String ?? ""
                let ankunftzeit1 = data?["AnkunftZeit"] as? String ?? ""
                
                
                
                
                self.abholzeit?.text = abholzeit1
                self.ankunftzeit?.text = ankunftzeit1
            }
        }
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
           
            db = Firestore.firestore()
            let docRef = db.collection("Ärzte").document("Fahrt")

                   
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    
                    if let horizontal = data?["horizontal"] as? Double {
                        self.hohe = horizontal
                    }
                    
                    if let vertikal = data?["vertikal"] as? Double {
                        self.lange = vertikal
                    }
                    
                    if let name = data?["Name"] as? String {
                        self.name = name
                    }
                    
                    let annotation = MKPointAnnotation()
                                       annotation.coordinate = CLLocationCoordinate2D(latitude: self.hohe, longitude: self.lange)
                                       annotation.title = self.name
                                       self.mapView?.addAnnotation(annotation)
                    
                    let request = MKDirections.Request()
                    request.source = MKMapItem(placemark: MKPlacemark(coordinate: location.coordinate))
                    request.destination = MKMapItem(placemark: MKPlacemark(coordinate: annotation.coordinate)) // Hier wird das Ziel auf die Annotation gesetzt
                    request.transportType = .automobile

                    
                    let directions = MKDirections(request: request)
                    directions.calculate { response, error in
                        guard let route = response?.routes.first else { return }
                        self.mapView?.addOverlay(route.polyline)
                       
                        
                        self.render(location)
                    }
                    
                    
                }
            }
            
           
            
         
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
