
import UIKit
import FirebaseFirestore

class FahrtbuchenViewController: UIViewController {
    
    
    
    @IBOutlet weak var Ziel: UILabel!
    @IBOutlet weak var Strecke: UILabel!
    @IBOutlet weak var Dauer: UILabel!
    @IBOutlet weak var Route: UIImageView!
    @IBOutlet weak var Datum: UILabel!
    
    
    @IBAction func fahrtbuchenPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Buchung bestätigen", message: "Möchten Sie die Fahrt wirklich buchen?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Abbrechen", style: .destructive)
        
        let noAction = UIAlertAction(title: "Ja", style: .default) { action in
            self.performSegue(withIdentifier: "fahrtbuchen", sender: self)
        }
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        alertController.preferredAction = yesAction
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    var db: Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        let docRef = db.collection("Ärzte").document("Fahrt")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                let ziel = data?["Ziel"] as? String ?? ""
                let strecke = data?["Entfernung"] as? String ?? ""
                let datum = data?["Datum"] as? String ?? ""
                let dauer = data?["Dauer"] as? String ?? ""
                if let imageName = data?["Bild"] as? String {
                    let image = UIImage(named: imageName)
                    self.Route?.image = image
                }
                
                self.Ziel?.text = ziel
                self.Strecke?.text = strecke
                self.Dauer?.text = dauer
                self.Datum?.text = datum
                
                
                
            }
            
            
        }
            
        }
    }
    
