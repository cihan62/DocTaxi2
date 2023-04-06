
import UIKit
import FirebaseFirestore

class StartseiteViewController: UIViewController {

    
    
    @IBOutlet weak var nameNutzer: UILabel!
    @IBOutlet weak var arztbild: UIImageView!
    @IBOutlet weak var adresse: UILabel!
    @IBOutlet weak var datum: UILabel!
    @IBOutlet weak var uhrzeit: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var fahrtZiel: UILabel!
    @IBOutlet weak var datumFahrt: UILabel!
    
    var db: Firestore!

    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
        let documents = ["arzt", "arzt2", "arzt3", "arzt4", "arzt5"]
        
        func loadDocument(priority: Int) {
            let docRef = db.collection("Ärzte").document(documents[priority])
            
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    let name = data?["Name"] as? String ?? ""
                    let uhrzeit = data?["uhrzeit"] as? String ?? ""
                    let adresse = data?["adresse"] as? String ?? ""
                    let datum = data?["datum"] as? String ?? ""

                    
                    if  shouldLoadNextDocument(name: name, uhrzeit: uhrzeit, adresse: adresse, datum: datum) {
                        let nextPriority = priority + 1
                        if nextPriority < documents.count {
                            loadDocument(priority: nextPriority)
                        } else {
                            clearLabels()
                            print("No documents found")
                        }
                    } else {
                        self.adresse?.text = adresse
                        self.uhrzeit?.text = uhrzeit
                        self.name?.text = name
                        self.datum?.text = datum
                        if let imageName = data?["bild"] as? String {
                            let image = UIImage(named: imageName)
                            self.arztbild?.image = image
                        }
                    }
                } else {
                    let nextPriority = priority + 1
                    if nextPriority < documents.count {
                        loadDocument(priority: nextPriority)
                    } else {
                        clearLabels()
                        print("No documents found")
                    }
                }
            }
        }
        
        func shouldLoadNextDocument(name: String, uhrzeit: String, adresse: String, datum: String) -> Bool {
            return name.isEmpty && uhrzeit.isEmpty && adresse.isEmpty && datum.isEmpty
        }
        
        func clearLabels() {
            self.adresse?.text = ""
            self.uhrzeit?.text = ""
            self.name?.text = ""
            self.datum?.text = ""
            self.arztbild?.image = nil
        }
        
        loadDocument(priority: 0)
        
        
        
        let docRef1 = db.collection("Ärzte").document("Fahrt")
        
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let fahrtName = data?["Name"] as? String ?? ""
            
                
                
                self.fahrtZiel?.text = fahrtName
            } else {
                print("Dokument nicht gefunden")
            }
        }
        
        db = Firestore.firestore()

        
        let NameRef = db.collection("Ärzte").document("Nutzer")
        NameRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                let name = data?["Name"] as? String ?? ""
                
                
                self.nameNutzer?.text = name + "!"
                
            }
        }
        
        
        db = Firestore.firestore()
        
        let FahrtRef = db.collection("Ärzte").document("Fahrt")
        FahrtRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                let datum = data?["Datum"] as? String ?? ""
                self.datumFahrt?.text = datum
                
                
            }
        }
        
    }


}
