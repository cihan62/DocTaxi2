
import UIKit
import FirebaseFirestore

class HomeScreenViewController: UIViewController {
    
    
    

    @IBOutlet weak var datum: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var montagDatum: UILabel!
    @IBOutlet weak var montag: UILabel!
    @IBOutlet weak var dienstag: UILabel!
    @IBOutlet weak var mittwoch: UILabel!
    @IBOutlet weak var donnerstag: UILabel!
    @IBOutlet weak var freitag: UILabel!
    @IBOutlet weak var dienstagName: UILabel!
    @IBOutlet weak var mittwochname: UILabel!
    @IBOutlet weak var donnerstagName: UILabel!
    @IBOutlet weak var freitagName: UILabel!
    
    
    
    
    @IBOutlet weak var dienstagButton: UIButton!
    @IBOutlet weak var mittwochButton: UIButton!
    @IBOutlet weak var donnerstagButton: UIButton!
    @IBOutlet weak var freitagButton: UIButton!
    

   
    
    
    
    @IBAction func tagPressed(_ sender: UIButton) {
        if sender.tag == 11 {
            datum.text = "Montag, 24.Juli"
            tagButton.isSelected = true
            dienstagButton.isSelected = false
            mittwochButton.isSelected = false
            donnerstagButton.isSelected = false
            freitagButton.isSelected = false
            montag.textColor = UIColor.white
            montagDatum.textColor = UIColor.white
            dienstag.textColor = UIColor.black
            dienstagName.textColor = UIColor.black
            mittwoch.textColor = UIColor.black
            mittwochname.textColor = UIColor.black
            donnerstag.textColor = UIColor.black
            donnerstagName.textColor = UIColor.black
            freitag.textColor = UIColor.black
            freitagName.textColor = UIColor.black
        }
    }
    
    
    @IBAction func dienstagPressed(_ sender: UIButton) {
        if sender.tag == 12 {
            datum.text = "Dienstag, 25.Juli"
            tagButton.setImage(UIImage(named: "dienstagbuchen"), for: .normal)
            tagButton.isSelected = false
            dienstagButton.isSelected = true
            mittwochButton.isSelected = false
            donnerstagButton.isSelected = false
            freitagButton.isSelected = false
            montag.textColor = UIColor.black
            montagDatum.textColor = UIColor.black
            dienstag.textColor = UIColor.white
            dienstagName.textColor = UIColor.white
            mittwoch.textColor = UIColor.black
            mittwochname.textColor = UIColor.black
            donnerstag.textColor = UIColor.black
            donnerstagName.textColor = UIColor.black
            freitag.textColor = UIColor.black
            freitagName.textColor = UIColor.black
        }
    }
    
    @IBAction func mittwochPressed(_ sender: UIButton) {
        if sender.tag == 13 {
            datum.text = "Mittwoch, 26.Juli"
            tagButton.setImage(UIImage(named: "dienstagbuchen"), for: .normal)
            tagButton.isSelected = false
            dienstagButton.isSelected = false
            mittwochButton.isSelected = true
            donnerstagButton.isSelected = false
            freitagButton.isSelected = false
            montag.textColor = UIColor.black
            montagDatum.textColor = UIColor.black
            dienstag.textColor = UIColor.black
            dienstagName.textColor = UIColor.black
            mittwoch.textColor = UIColor.white
            mittwochname.textColor = UIColor.white
            donnerstag.textColor = UIColor.black
            donnerstagName.textColor = UIColor.black
            freitag.textColor = UIColor.black
            freitagName.textColor = UIColor.black
        }
    }
    
    @IBAction func donnerstagPressed(_ sender: UIButton) {
        if sender.tag == 14 {
            datum.text = "Donnerstag, 27.Juli"
            tagButton.setImage(UIImage(named: "dienstagbuchen"), for: .normal)
            tagButton.isSelected = false
            dienstagButton.isSelected = false
            mittwochButton.isSelected = false
            donnerstagButton.isSelected = true
            freitagButton.isSelected = false
            montag.textColor = UIColor.black
            montagDatum.textColor = UIColor.black
            dienstag.textColor = UIColor.black
            dienstagName.textColor = UIColor.black
            mittwoch.textColor = UIColor.black
            mittwochname.textColor = UIColor.black
            donnerstag.textColor = UIColor.white
            donnerstagName.textColor = UIColor.white
            freitag.textColor = UIColor.black
            freitagName.textColor = UIColor.black
        }
    }
    
    @IBAction func freitagPressed(_ sender: UIButton) {
        if sender.tag == 15 {
            datum.text = "Freitag, 28.Juli"
            tagButton.setImage(UIImage(named: "dienstagbuchen"), for: .normal)
            tagButton.isSelected = false
            dienstagButton.isSelected = false
            mittwochButton.isSelected = false
            donnerstagButton.isSelected = false
            freitagButton.isSelected = true
            montag.textColor = UIColor.black
            montagDatum.textColor = UIColor.black
            dienstag.textColor = UIColor.black
            dienstagName.textColor = UIColor.black
            mittwoch.textColor = UIColor.black
            mittwochname.textColor = UIColor.black
            donnerstag.textColor = UIColor.black
            donnerstagName.textColor = UIColor.black
            freitag.textColor = UIColor.white
            freitagName.textColor = UIColor.white
        }
    }
    
    @IBOutlet weak var achtUhr: UIButton!
    @IBOutlet weak var neunUhr: UIButton!
    @IBOutlet weak var zehnUhr: UIButton!
    @IBOutlet weak var elfUhr: UIButton!
    @IBOutlet weak var zwoelfUhr: UIButton!
    @IBOutlet weak var zwoelf30Uhr: UIButton!
    @IBOutlet weak var dreizehnUhr: UIButton!
    @IBOutlet weak var vierzehnUhr: UIButton!
    @IBOutlet weak var fünfzehnUhr: UIButton!
    @IBOutlet weak var sechzehnUhr: UIButton!
    
    
    @IBOutlet weak var acht: UILabel!
    @IBOutlet weak var neun: UILabel!
    @IBOutlet weak var zehn: UILabel!
    @IBOutlet weak var elf: UILabel!
    @IBOutlet weak var zwölf: UILabel!
    @IBOutlet weak var zwölf30: UILabel!
    @IBOutlet weak var dreizehn: UILabel!
    @IBOutlet weak var vierzehn: UILabel!
    @IBOutlet weak var fünfzehn: UILabel!
    @IBOutlet weak var sechzehn: UILabel!
    
    
    
    @IBAction func achtuhrPressed(_ sender: UIButton) {
        if sender.tag == 1
        {
            achtUhr.isSelected = true
            neunUhr.isSelected = false
            zehnUhr.isSelected = false
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.white
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.black

        }
    }
    
   
    @IBAction func neunuhrPressed(_ sender: UIButton) {
        if sender.tag == 2
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = true
            zehnUhr.isSelected = false
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.black
            neun.textColor = UIColor.white
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.black
        }
    }
    
    @IBAction func zehnuhrPressed(_ sender: UIButton) {
        if sender.tag == 3
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = false
            zehnUhr.isSelected = true
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.black
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.white
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.black
        }
    }
    
    
    @IBAction func elfuhrPressed(_ sender: UIButton) {
        if sender.tag == 4
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = false
            zehnUhr.isSelected = false
            elfUhr.isSelected = true
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.black
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.white
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.black
        }
    }
    
    
    @IBAction func zwoelfuhrPressed(_ sender: UIButton) {
        if sender.tag == 5
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = false
            zehnUhr.isSelected = false
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = true
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.black
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.white
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.black
        }
    }
    
    @IBAction func zwoelf30uhrPressed(_ sender: UIButton) {
        if sender.tag == 6
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = false
            zehnUhr.isSelected = false
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = true
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.black
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.white
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.black
        }
    }
    
    
    @IBAction func dreizehnuhrPressed(_ sender: UIButton) {
        if sender.tag == 7
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = false
            zehnUhr.isSelected = false
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = true
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.black
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.white
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.black
        }
    }
    
    @IBAction func vierzehnuhrPressed(_ sender: UIButton) {
        if sender.tag == 8
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = false
            zehnUhr.isSelected = false
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = true
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.black
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.white
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.black
        }
    }
    
    @IBAction func fünfzehnuhrPressed(_ sender: UIButton) {
        if sender.tag == 9
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = false
            zehnUhr.isSelected = false
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = true
            sechzehnUhr.isSelected = false
            acht.textColor = UIColor.black
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.white
            sechzehn.textColor = UIColor.black
        }
    }
    
    @IBAction func sechzehnuhrPressed(_ sender: UIButton) {
        if sender.tag == 10
        {
            achtUhr.isSelected = false
            neunUhr.isSelected = false
            zehnUhr.isSelected = false
            elfUhr.isSelected = false
            zwoelfUhr.isSelected = false
            zwoelf30Uhr.isSelected = false
            dreizehnUhr.isSelected = false
            vierzehnUhr.isSelected = false
            fünfzehnUhr.isSelected = false
            sechzehnUhr.isSelected = true
            acht.textColor = UIColor.black
            neun.textColor = UIColor.black
            zehn.textColor = UIColor.black
            elf.textColor = UIColor.black
            zwölf.textColor = UIColor.black
            zwölf30.textColor = UIColor.black
            dreizehn.textColor = UIColor.black
            vierzehn.textColor = UIColor.black
            fünfzehn.textColor = UIColor.black
            sechzehn.textColor = UIColor.white
        }
    }
    
    
    
    
    
    
    @IBAction func terminBuchen(_ sender: UIButton) {
      
        var uhrzeit = ""
        var uhrzeitZwei = ""
        var datum = ""
        
        if achtUhr.isSelected {
            uhrzeit = "8:00 Uhr"
            uhrzeitZwei = "8:00"
        } else if neunUhr.isSelected {
            uhrzeit = "9:00 Uhr"
            uhrzeitZwei = "9:00"
        } else if zehnUhr.isSelected {
            uhrzeit = "10:00 Uhr"
            uhrzeitZwei = "10:00"
        }
        else if elfUhr.isSelected {
            uhrzeit = "11:00 Uhr"
            uhrzeitZwei = "11:00"
        }
        else if zwoelfUhr.isSelected {
            uhrzeit = "12:00 Uhr"
            uhrzeitZwei = "12:00"
        }
        else if zwoelf30Uhr.isSelected {
            uhrzeit = "12:30 Uhr"
            uhrzeitZwei = "12:30"
        }
        else if dreizehnUhr.isSelected {
            uhrzeit = "13:00 Uhr"
            uhrzeitZwei = "13:00"
        }
        else if vierzehnUhr.isSelected {
            uhrzeit = "14:00 Uhr"
            uhrzeitZwei = "14:00"
        }
        else if fünfzehnUhr.isSelected {
            uhrzeit = "15:00 Uhr"
            uhrzeitZwei = "15:00"
        }
        else if sechzehnUhr.isSelected {
            uhrzeit = "16:00 Uhr"
            uhrzeitZwei = "16:00"
        }
        
        if tagButton.isSelected {
            datum = "24.Juli"
            updateDatum(with: datum, for: "arzt")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt")
        }
        
        if dienstagButton.isSelected {
            datum = "25.Juli"
            updateDatum(with: datum, for: "arzt2")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt2")
        }
        
        if mittwochButton.isSelected {
            datum = "26.Juli"
            updateDatum(with: datum, for: "arzt3")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt3")
        }
        
        if donnerstagButton.isSelected {
            datum = "27.Juli"
            updateDatum(with: datum, for: "arzt4")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt4")
        }
        
        if freitagButton.isSelected {
            datum = "28.Juli"
            updateDatum(with: datum, for: "arzt5")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt5")
        }
        
        
        
        func updateUhrzeit(with uhrzeit: String, and uhrzeitZwei: String, for arzt: String) {
            db = Firestore.firestore()
            let docRef = db.collection("Ärzte").document(arzt)
            
            docRef.updateData(["uhrzeit": uhrzeit, "uhrzeitZwei": uhrzeitZwei, "Name": "Dr. Hanz Meier", "beruf": "HNO-Arzt", "bild": "hanzmeier", "adresse": "Haldenweg 12, 72178 Waldachtal"]) { error in
                if let error = error {
                    print("Fehler beim Aktualisieren der Uhrzeit: \(error.localizedDescription)")
                } else {
                    print("Uhrzeit erfolgreich aktualisiert für Arzt \(arzt)")
                }
            }
            

        }
        
        func updateDatum(with datum: String, for arzt: String) {
            db = Firestore.firestore()
            let docRef1 = db.collection("Ärzte").document(arzt)
            
            docRef1.updateData(["datum":datum]){ error in
                if let error = error {
                    print("Fehler beim Aktualisieren des Datums: \(error.localizedDescription)")
                } else {
                    print("Datum erfolgreich aktualisiert für Arzt")
                }
            }
            
        }
    }

    
    @IBAction func terminBuchenZwei(_ sender: UIButton) {
        
        var uhrzeit = ""
        var uhrzeitZwei = ""
        var datum = ""
        
        if achtUhr.isSelected {
            uhrzeit = "8:00 Uhr"
            uhrzeitZwei = "8:00"
        } else if neunUhr.isSelected {
            uhrzeit = "9:00 Uhr"
            uhrzeitZwei = "9:00"
        } else if zehnUhr.isSelected {
            uhrzeit = "10:00 Uhr"
            uhrzeitZwei = "10:00"
        }
        else if elfUhr.isSelected {
            uhrzeit = "11:00 Uhr"
            uhrzeitZwei = "11:00"
        }
        else if zwoelfUhr.isSelected {
            uhrzeit = "12:00 Uhr"
            uhrzeitZwei = "12:00"
        }
        else if zwoelf30Uhr.isSelected {
            uhrzeit = "12:30 Uhr"
            uhrzeitZwei = "12:30"
        }
        else if dreizehnUhr.isSelected {
            uhrzeit = "13:00 Uhr"
            uhrzeitZwei = "13:00"
        }
        else if vierzehnUhr.isSelected {
            uhrzeit = "14:00 Uhr"
            uhrzeitZwei = "14:00"
        }
        else if fünfzehnUhr.isSelected {
            uhrzeit = "15:00 Uhr"
            uhrzeitZwei = "15:00"
        }
        else if sechzehnUhr.isSelected {
            uhrzeit = "16:00 Uhr"
            uhrzeitZwei = "16:00"
        }
        
        if tagButton.isSelected {
            datum = "24.Juli"
            updateDatum(with: datum, for: "arzt")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt")
        }
        
        if dienstagButton.isSelected {
            datum = "25.Juli"
            updateDatum(with: datum, for: "arzt2")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt2")
        }
        
        if mittwochButton.isSelected {
            datum = "26.Juli"
            updateDatum(with: datum, for: "arzt3")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt3")
        }
        
        if donnerstagButton.isSelected {
            datum = "27.Juli"
            updateDatum(with: datum, for: "arzt4")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt4")
        }
        
        if freitagButton.isSelected {
            datum = "28.Juli"
            updateDatum(with: datum, for: "arzt5")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt5")
        }
        
        
        
        func updateUhrzeit(with uhrzeit: String, and uhrzeitZwei: String, for arzt: String) {
            db = Firestore.firestore()
            let docRef = db.collection("Ärzte").document(arzt)
            
            docRef.updateData(["uhrzeit": uhrzeit, "uhrzeitZwei": uhrzeitZwei, "Name": "Dr. Peter Werner", "beruf": "Hausarzt", "bild": "peterwerner", "adresse": "Blumenstraße 24, 72285 Pfalzgrafenweiler"]) { error in
                if let error = error {
                    print("Fehler beim Aktualisieren der Uhrzeit: \(error.localizedDescription)")
                } else {
                    print("Uhrzeit erfolgreich aktualisiert für Arzt \(arzt)")
                }
            }
            
          
            
        }
        
        func updateDatum(with datum: String, for arzt: String) {
            db = Firestore.firestore()
            let docRef1 = db.collection("Ärzte").document(arzt)
            
            docRef1.updateData(["datum":datum]){ error in
                if let error = error {
                    print("Fehler beim Aktualisieren des Datums: \(error.localizedDescription)")
                } else {
                    print("Datum erfolgreich aktualisiert für Arzt")
                }
            }
            
        }
        
    }
    
   
    
    @IBAction func terminbuchenDrei(_ sender: Any) {
        
        var uhrzeit = ""
        var uhrzeitZwei = ""
        var datum = ""
        
        if achtUhr.isSelected {
            uhrzeit = "8:00 Uhr"
            uhrzeitZwei = "8:00"
        } else if neunUhr.isSelected {
            uhrzeit = "9:00 Uhr"
            uhrzeitZwei = "9:00"
        } else if zehnUhr.isSelected {
            uhrzeit = "10:00 Uhr"
            uhrzeitZwei = "10:00"
        }
        else if elfUhr.isSelected {
            uhrzeit = "11:00 Uhr"
            uhrzeitZwei = "11:00"
        }
        else if zwoelfUhr.isSelected {
            uhrzeit = "12:00 Uhr"
            uhrzeitZwei = "12:00"
        }
        else if zwoelf30Uhr.isSelected {
            uhrzeit = "12:30 Uhr"
            uhrzeitZwei = "12:30"
        }
        else if dreizehnUhr.isSelected {
            uhrzeit = "13:00 Uhr"
            uhrzeitZwei = "13:00"
        }
        else if vierzehnUhr.isSelected {
            uhrzeit = "14:00 Uhr"
            uhrzeitZwei = "14:00"
        }
        else if fünfzehnUhr.isSelected {
            uhrzeit = "15:00 Uhr"
            uhrzeitZwei = "15:00"
        }
        else if sechzehnUhr.isSelected {
            uhrzeit = "16:00 Uhr"
            uhrzeitZwei = "16:00"
        }
        
        
        if tagButton.isSelected {
            datum = "24.Juli"
            updateDatum(with: datum, for: "arzt")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt")
        }
        
        if dienstagButton.isSelected {
            datum = "25.Juli"
            updateDatum(with: datum, for: "arzt2")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt2")
        }
        
        if mittwochButton.isSelected {
            datum = "26.Juli"
            updateDatum(with: datum, for: "arzt3")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt3")
        }
        
        if donnerstagButton.isSelected {
            datum = "27.Juli"
            updateDatum(with: datum, for: "arzt4")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt4")
        }
        
        if freitagButton.isSelected {
            datum = "28.Juli"
            updateDatum(with: datum, for: "arzt5")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt5")
        }
        
       
    
        
        
        func updateUhrzeit(with uhrzeit: String, and uhrzeitZwei: String, for arzt: String) {
            db = Firestore.firestore()
            let docRef = db.collection("Ärzte").document(arzt)
            
            docRef.updateData(["uhrzeit": uhrzeit, "uhrzeitZwei": uhrzeitZwei, "Name": "Dr. Thomas Wagner", "beruf": "Augenarzt", "bild": "thomaswagner", "adresse": "Lange Straße 47, 72285 Pfalzgrafenweiler"]) { error in
                if let error = error {
                    print("Fehler beim Aktualisieren der Uhrzeit: \(error.localizedDescription)")
                } else {
                    print("Uhrzeit erfolgreich aktualisiert für Arzt \(arzt)")
                }
            }
            
            
            
        }
        
        func updateDatum(with datum: String, for arzt: String) {
            db = Firestore.firestore()
            let docRef1 = db.collection("Ärzte").document(arzt)
            
            docRef1.updateData(["datum":datum]){ error in
                if let error = error {
                    print("Fehler beim Aktualisieren des Datums: \(error.localizedDescription)")
                } else {
                    print("Datum erfolgreich aktualisiert für Arzt")
                }
            }
            
        }
        
       
        
        
    }
    
    override func shouldPerformSegue(withIdentifier zumTermin3: String, sender: Any?) -> Bool {
        if !(achtUhr.isSelected || neunUhr.isSelected || zehnUhr.isSelected || elfUhr.isSelected || zwoelfUhr.isSelected || zwoelf30Uhr.isSelected || dreizehnUhr.isSelected || vierzehnUhr.isSelected || fünfzehnUhr.isSelected || sechzehnUhr.isSelected) || !(tagButton.isSelected || dienstagButton.isSelected || mittwochButton.isSelected || donnerstagButton.isSelected || freitagButton.isSelected) {

            
            let alert = UIAlertController(title: "Fehler", message: "Bitte wählen Sie einen Termin aus.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
            
            return false
        } else {
            return true
        }
    }
    
    @IBAction func terminbuchenVier(_ sender: Any) {
        var uhrzeit = ""
        var uhrzeitZwei = ""
        var datum = ""
        
        if achtUhr.isSelected {
            uhrzeit = "8:00 Uhr"
            uhrzeitZwei = "8:00"
        } else if neunUhr.isSelected {
            uhrzeit = "9:00 Uhr"
            uhrzeitZwei = "9:00"
        } else if zehnUhr.isSelected {
            uhrzeit = "10:00 Uhr"
            uhrzeitZwei = "10:00"
        }
        else if elfUhr.isSelected {
            uhrzeit = "11:00 Uhr"
            uhrzeitZwei = "11:00"
        }
        else if zwoelfUhr.isSelected {
            uhrzeit = "12:00 Uhr"
            uhrzeitZwei = "12:00"
        }
        else if zwoelf30Uhr.isSelected {
            uhrzeit = "12:30 Uhr"
            uhrzeitZwei = "12:30"
        }
        else if dreizehnUhr.isSelected {
            uhrzeit = "13:00 Uhr"
            uhrzeitZwei = "13:00"
        }
        else if vierzehnUhr.isSelected {
            uhrzeit = "14:00 Uhr"
            uhrzeitZwei = "14:00"
        }
        else if fünfzehnUhr.isSelected {
            uhrzeit = "15:00 Uhr"
            uhrzeitZwei = "15:00"
        }
        else if sechzehnUhr.isSelected {
            uhrzeit = "16:00 Uhr"
            uhrzeitZwei = "16:00"
        }
        
        if tagButton.isSelected {
            datum = "24.Juli"
            updateDatum(with: datum, for: "arzt")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt")
        }
        
        if dienstagButton.isSelected {
            datum = "25.Juli"
            updateDatum(with: datum, for: "arzt2")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt2")
        }
        
        if mittwochButton.isSelected {
            datum = "26.Juli"
            updateDatum(with: datum, for: "arzt3")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt3")
        }
        
        if donnerstagButton.isSelected {
            datum = "27.Juli"
            updateDatum(with: datum, for: "arzt4")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt4")
        }
        
        if freitagButton.isSelected {
            datum = "28.Juli"
            updateDatum(with: datum, for: "arzt5")
            updateUhrzeit(with: uhrzeit, and: uhrzeitZwei, for: "arzt5")
        }
        
        
        
        
        func updateUhrzeit(with uhrzeit: String, and uhrzeitZwei: String, for arzt: String) {
            db = Firestore.firestore()
            let docRef = db.collection("Ärzte").document(arzt)
            
            docRef.updateData(["uhrzeit": uhrzeit, "uhrzeitZwei": uhrzeitZwei, "Name": "Dr. Erika Mustermann", "beruf": "Dermatologin", "bild": "erikamustermann", "adresse": "Dieselstraße 29, 72285 Pfalzgrafenweiler"]) { error in
                if let error = error {
                    print("Fehler beim Aktualisieren der Uhrzeit: \(error.localizedDescription)")
                } else {
                    print("Uhrzeit erfolgreich aktualisiert für Arzt \(arzt)")
                }
            }
            
            
            
        }
        
        func updateDatum(with datum: String, for arzt: String) {
            db = Firestore.firestore()
            let docRef1 = db.collection("Ärzte").document(arzt)
            
            docRef1.updateData(["datum":datum]){ error in
                if let error = error {
                    print("Fehler beim Aktualisieren des Datums: \(error.localizedDescription)")
                } else {
                    print("Datum erfolgreich aktualisiert für Arzt")
                }
            }
            
        }
        
        
    }
    
   
    
    
    
    var db: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
    

      
        
        db = Firestore.firestore()
        
        
        
        
        let docRef1 = db.collection("Ärzte").document("datum")
        
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let tagZahl = data?["tagZahl"] as? String ?? ""
                let dienstagZahl = data?["dienstagZahl"] as? String ?? ""
                let mittwochZahl = data?["mittwochZahl"] as? String ?? ""
                let donnerstagZahl = data?["donnerstagZahl"] as? String ?? ""
                let freitagZahl = data?["freitagZahl"] as? String ?? ""
                
                self.montagDatum?.text = tagZahl
                self.dienstag?.text = dienstagZahl
                self.mittwoch?.text = mittwochZahl
                self.donnerstag?.text = donnerstagZahl
                self.freitag?.text = freitagZahl
            } else {
                print("Dokument nicht gefunden")
            }
        }
        
        
       
        
        
        
    }
}

   


