//
//  DashboardViewController.swift
//  WIProjekt2.0
//
//  Created by Cihan Dikme on 30.04.23.
//

import UIKit
import FirebaseFirestore

class DashboardViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameNutzer: UILabel!
    @IBOutlet weak var montag: UIButton!
    @IBOutlet weak var dienstag: UIButton!
    @IBOutlet weak var mittwoch: UIButton!
    @IBOutlet weak var donnerstag: UIButton!
    @IBOutlet weak var freitag: UIButton!
    
    
    @IBOutlet weak var montagbuchenbutton: UIButton!
    @IBOutlet weak var dienstagbuchenbutton: UIButton!
    @IBOutlet weak var mittwochbuchenbutton: UIButton!
    @IBOutlet weak var donnerstagbuchenbutton: UIButton!
    @IBOutlet weak var freitagbuchenbutton: UIButton!
    
    
    
    @IBOutlet weak var montagText: UILabel!
    @IBOutlet weak var dienstagText: UILabel!
    @IBOutlet weak var mittwochText: UILabel!
    @IBOutlet weak var donnerstagText: UILabel!
    @IBOutlet weak var freitagText: UILabel!
    
    
    
    
    @IBOutlet weak var uhrzeitEins: UILabel!
    @IBOutlet weak var uhrzeitZwei: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var terminart: UILabel!
    @IBOutlet weak var arztbild: UIImageView!
    
    
    
    @IBOutlet weak var linie2: UIImageView!
    @IBOutlet weak var linie: UIImageView!
    @IBOutlet weak var feld: UIImageView!
    @IBOutlet weak var zeichnung: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var fahrtbuchenText: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    
    
    
    var db: Firestore!
    
    
    @IBOutlet weak var fahrtbuchenButton: UIButton!
    
    
    
    
    @IBAction func montagPressed(_ sender: Any) {
        
        
        montagbuchenbutton?.alpha = 1
        dienstagbuchenbutton?.alpha = 0
        mittwochbuchenbutton?.alpha = 0
        donnerstagbuchenbutton?.alpha = 0
        freitagbuchenbutton?.alpha = 0
        montag.isSelected = true
        dienstag.isSelected = false
        mittwoch.isSelected = false
        donnerstag.isSelected = false
        freitag.isSelected = false
        montagText.textColor = UIColor.white
        dienstagText.textColor = UIColor.black
        mittwochText.textColor = UIColor.black
        donnerstagText.textColor = UIColor.black
        freitagText.textColor = UIColor.black
        
        db = Firestore.firestore()
        let docRef1 = db.collection("Ärzte").document("arzt")
        
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let UhrzeitEins = data?["uhrzeit"] as? String ?? ""
                let uhrzeitZwei = data?["uhrzeitZwei"] as? String ?? ""
                let name = data?["Name"] as? String ?? ""
                let terminart = data?["beruf"] as? String ?? ""
                if let imageName = data?["bild"] as? String {
                    let image = UIImage(named: imageName)
                    self.arztbild?.image = image
                }
                
                self.uhrzeitEins?.text = UhrzeitEins
                self.uhrzeitZwei?.text = uhrzeitZwei
                self.name?.text = name
                self.terminart?.text = terminart
                
                if UhrzeitEins.isEmpty {
                    self.text3?.alpha = 1
                    self.text2?.alpha = 0
                    self.text?.alpha = 0
                    self.linie?.alpha = 1
                    self.uhrzeitEins?.alpha = 0
                    self.uhrzeitZwei?.alpha = 0
                    self.feld?.alpha = 0
                    self.name?.alpha = 0
                    self.terminart?.alpha = 0
                    self.arztbild?.alpha = 0
                    self.fahrtbuchenText?.alpha = 0
                    self.zeichnung?.frame.origin.y = 307
                } else {
                    self.text3?.alpha = 0
                    self.text2?.alpha = 1
                    self.text?.alpha = 0
                    self.linie2?.alpha = 1
                    self.linie?.alpha = 0
                    self.uhrzeitEins?.alpha = 1
                    self.uhrzeitZwei?.alpha = 1
                    self.feld?.alpha = 1
                    self.name?.alpha = 1
                    self.terminart?.alpha = 1
                    self.arztbild?.alpha = 1
                    self.fahrtbuchenText?.alpha = 1
                    self.zeichnung?.frame.origin.y = 423
                }
                
            } else {
                print("Dokument nicht gefunden")
            }
        }
    }
    
    @IBAction func dienstagPressed(_ sender: Any) {
        
        montagbuchenbutton?.alpha = 0
        dienstagbuchenbutton?.alpha = 1
        mittwochbuchenbutton?.alpha = 0
        donnerstagbuchenbutton?.alpha = 0
        freitagbuchenbutton?.alpha = 0
        montag.setImage(UIImage(named: "aamontag"), for: .normal)
        montag.isSelected = false
        dienstag.isSelected = true
        mittwoch.isSelected = false
        donnerstag.isSelected = false
        freitag.isSelected = false
        montagText.textColor = UIColor.black
        dienstagText.textColor = UIColor.white
        mittwochText.textColor = UIColor.black
        donnerstagText.textColor = UIColor.black
        freitagText.textColor = UIColor.black
        
        db = Firestore.firestore()
        let docRef2 = db.collection("Ärzte").document("arzt2")
        docRef2.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let UhrzeitEins = data?["uhrzeit"] as? String ?? ""
                let UhrzeitZwei = data?["uhrzeitZwei"] as? String ?? ""
                let Name = data?["Name"] as? String ?? ""
                let Terminart = data?["beruf"] as? String ?? ""
                if let imageName = data?["bild"] as? String {
                    let image = UIImage(named: imageName)
                    self.arztbild?.image = image
                }
                
                self.uhrzeitEins?.text = UhrzeitEins
                self.uhrzeitZwei?.text = UhrzeitZwei
                self.name?.text = Name
                self.terminart?.text = Terminart
                
                if UhrzeitEins.isEmpty {
                    self.text3?.alpha = 1
                    self.text2?.alpha = 0
                    self.text?.alpha = 0
                    self.linie?.alpha = 1
                    self.uhrzeitEins?.alpha = 0
                    self.uhrzeitZwei?.alpha = 0
                    self.feld?.alpha = 0
                    self.name?.alpha = 0
                    self.terminart?.alpha = 0
                    self.arztbild?.alpha = 0
                    self.fahrtbuchenText?.alpha = 0
                    self.zeichnung?.frame.origin.y = 307
                } else {
                    self.text3?.alpha = 0
                    self.text2?.alpha = 1
                    self.text?.alpha = 0
                    self.linie2?.alpha = 1
                    self.linie?.alpha = 0
                    self.uhrzeitEins?.alpha = 1
                    self.uhrzeitZwei?.alpha = 1
                    self.feld?.alpha = 1
                    self.name?.alpha = 1
                    self.terminart?.alpha = 1
                    self.arztbild?.alpha = 1
                    self.fahrtbuchenText?.alpha = 1
                    self.zeichnung?.frame.origin.y = 423
                }
                
            } else {
                print("Dokument nicht gefunden")
            }
        }
        
        
    }
    
    @IBAction func mittwochPressed(_ sender: Any) {
        
        montagbuchenbutton?.alpha = 0
        dienstagbuchenbutton?.alpha = 0
        mittwochbuchenbutton?.alpha = 1
        donnerstagbuchenbutton?.alpha = 0
        freitagbuchenbutton?.alpha = 0
        montag.setImage(UIImage(named: "aamontag"), for: .normal)
        montag.isSelected = false
        dienstag.isSelected = false
        mittwoch.isSelected = true
        donnerstag.isSelected = false
        freitag.isSelected = false
        montagText.textColor = UIColor.black
        dienstagText.textColor = UIColor.black
        mittwochText.textColor = UIColor.white
        donnerstagText.textColor = UIColor.black
        freitagText.textColor = UIColor.black
        
        
        db = Firestore.firestore()
        let docRef3 = db.collection("Ärzte").document("arzt3")
        docRef3.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                // Daten aus dem Dokument extrahieren
                let UhrzeitEins = data?["uhrzeit"] as? String ?? ""
                let UhrzeitZwei = data?["uhrzeitZwei"] as? String ?? ""
                let Name = data?["Name"] as? String ?? ""
                let Terminart = data?["beruf"] as? String ?? ""
                if let imageName = data?["bild"] as? String {
                    let image = UIImage(named: imageName)
                    self.arztbild?.image = image
                }
                
                self.uhrzeitEins?.text = UhrzeitEins
                self.uhrzeitZwei?.text = UhrzeitZwei
                self.name?.text = Name
                self.terminart?.text = Terminart
                
                if UhrzeitEins.isEmpty {
                    self.text3?.alpha = 1
                    self.text2?.alpha = 0
                    self.text?.alpha = 0
                    self.linie?.alpha = 1
                    self.uhrzeitEins?.alpha = 0
                    self.uhrzeitZwei?.alpha = 0
                    self.feld?.alpha = 0
                    self.name?.alpha = 0
                    self.terminart?.alpha = 0
                    self.arztbild?.alpha = 0
                    self.fahrtbuchenText?.alpha = 0
                    self.zeichnung?.frame.origin.y = 307
                } else {
                    self.text3?.alpha = 0
                    self.text2?.alpha = 1
                    self.text?.alpha = 0
                    self.linie2?.alpha = 1
                    self.linie?.alpha = 0
                    self.uhrzeitEins?.alpha = 1
                    self.uhrzeitZwei?.alpha = 1
                    self.feld?.alpha = 1
                    self.name?.alpha = 1
                    self.terminart?.alpha = 1
                    self.arztbild?.alpha = 1
                    self.fahrtbuchenText?.alpha = 1
                    self.zeichnung?.frame.origin.y = 423
                }
                
            } else {
                print("Dokument nicht gefunden")
            }
        }
        
    }
    
    @IBAction func donnerstagPressed(_ sender: Any) {
        montagbuchenbutton?.alpha = 0
        dienstagbuchenbutton?.alpha = 0
        mittwochbuchenbutton?.alpha = 0
        donnerstagbuchenbutton?.alpha = 1
        freitagbuchenbutton?.alpha = 0
        montag.setImage(UIImage(named: "aamontag"), for: .normal)
        montag.isSelected = false
        dienstag.isSelected = false
        mittwoch.isSelected = false
        donnerstag.isSelected = true
        freitag.isSelected = false
        montagText.textColor = UIColor.black
        dienstagText.textColor = UIColor.black
        mittwochText.textColor = UIColor.black
        donnerstagText.textColor = UIColor.white
        freitagText.textColor = UIColor.black
        
        db = Firestore.firestore()
        let docRef4 = db.collection("Ärzte").document("arzt4")
        docRef4.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let UhrzeitEins = data?["uhrzeit"] as? String ?? ""
                let UhrzeitZwei = data?["uhrzeitZwei"] as? String ?? ""
                let Name = data?["Name"] as? String ?? ""
                let Terminart = data?["beruf"] as? String ?? ""
                if let imageName = data?["bild"] as? String {
                    let image = UIImage(named: imageName)
                    self.arztbild?.image = image
                }
                
                self.uhrzeitEins?.text = UhrzeitEins
                self.uhrzeitZwei?.text = UhrzeitZwei
                self.name?.text = Name
                self.terminart?.text = Terminart
                
                if UhrzeitEins.isEmpty {
                    self.text3?.alpha = 1
                    self.text2?.alpha = 0
                    self.text?.alpha = 0
                    self.linie?.alpha = 1
                    self.uhrzeitEins?.alpha = 0
                    self.uhrzeitZwei?.alpha = 0
                    self.feld?.alpha = 0
                    self.name?.alpha = 0
                    self.terminart?.alpha = 0
                    self.arztbild?.alpha = 0
                    self.fahrtbuchenText?.alpha = 0
                    self.zeichnung?.frame.origin.y = 307
                } else {
                    self.text3?.alpha = 0
                    self.text2?.alpha = 1
                    self.text?.alpha = 0
                    self.linie2?.alpha = 1
                    self.linie?.alpha = 0
                    self.uhrzeitEins?.alpha = 1
                    self.uhrzeitZwei?.alpha = 1
                    self.feld?.alpha = 1
                    self.name?.alpha = 1
                    self.terminart?.alpha = 1
                    self.arztbild?.alpha = 1
                    self.fahrtbuchenText?.alpha = 1
                    self.zeichnung?.frame.origin.y = 423
                }
                
            } else {
                print("Dokument nicht gefunden")
            }
        }
        
    }
    
    @IBAction func freitagPressed(_ sender: Any) {
        montagbuchenbutton?.alpha = 0
        dienstagbuchenbutton?.alpha = 0
        mittwochbuchenbutton?.alpha = 0
        donnerstagbuchenbutton?.alpha = 0
        freitagbuchenbutton?.alpha = 1
        montag.setImage(UIImage(named: "aamontag"), for: .normal)
        montag.isSelected = false
        dienstag.isSelected = false
        mittwoch.isSelected = false
        donnerstag.isSelected = false
        freitag.isSelected = true
        montagText.textColor = UIColor.black
        dienstagText.textColor = UIColor.black
        mittwochText.textColor = UIColor.black
        donnerstagText.textColor = UIColor.black
        freitagText.textColor = UIColor.white
        
        db = Firestore.firestore()
        let docRef5 = db.collection("Ärzte").document("arzt5")
        docRef5.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let UhrzeitEins = data?["uhrzeit"] as? String ?? ""
                let UhrzeitZwei = data?["uhrzeitZwei"] as? String ?? ""
                let Name = data?["Name"] as? String ?? ""
                let Terminart = data?["beruf"] as? String ?? ""
                if let imageName = data?["bild"] as? String {
                    let image = UIImage(named: imageName)
                    self.arztbild?.image = image
                }
                
                self.uhrzeitEins?.text = UhrzeitEins
                self.uhrzeitZwei?.text = UhrzeitZwei
                self.name?.text = Name
                self.terminart?.text = Terminart
                
                if UhrzeitEins.isEmpty {
                    self.text3?.alpha = 1
                    self.text2?.alpha = 0
                    self.text?.alpha = 0
                    self.linie?.alpha = 1
                    self.uhrzeitEins?.alpha = 0
                    self.uhrzeitZwei?.alpha = 0
                    self.feld?.alpha = 0
                    self.name?.alpha = 0
                    self.terminart?.alpha = 0
                    self.arztbild?.alpha = 0
                    self.fahrtbuchenText?.alpha = 0
                    self.zeichnung?.frame.origin.y = 307
                } else {
                    self.text3?.alpha = 0
                    self.text2?.alpha = 1
                    self.text?.alpha = 0
                    self.linie2?.alpha = 1
                    self.linie?.alpha = 0
                    self.uhrzeitEins?.alpha = 1
                    self.uhrzeitZwei?.alpha = 1
                    self.feld?.alpha = 1
                    self.name?.alpha = 1
                    self.terminart?.alpha = 1
                    self.arztbild?.alpha = 1
                    self.fahrtbuchenText?.alpha = 1
                    self.zeichnung?.frame.origin.y = 423
                }
                
            } else {
                print("Dokument nicht gefunden")
            }
        }
        
    }
    
    
    
    @IBAction func fahrtgebucht(_ sender: Any) {
        db = Firestore.firestore()
        
        let arztDocRef = db.collection("Ärzte").document("arzt")
        let fahrtDocRef = db.collection("Ärzte").document("Fahrt")
        fahrtDocRef.updateData(["Datum": "24.Juli"])
        
        arztDocRef.getDocument { (arztDocument, error) in
            if let arztDocument = arztDocument, arztDocument.exists {
                let name = arztDocument.data()?["Name"] as? String ?? ""
                
                
                let uhrzeitZwei = arztDocument.get("uhrzeitZwei") as? String ?? ""
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "H:mm"
                            if let uhrzeitDate = dateFormatter.date(from: uhrzeitZwei) {
                                let updatedUhrzeit = Calendar.current.date(byAdding: .minute, value: -30, to: uhrzeitDate)
                                let updatedAnkunftZeit = Calendar.current.date(byAdding: .minute, value: -15, to: uhrzeitDate)
                                
                                dateFormatter.dateFormat = "H:mm"
                                let updatedUhrzeitString = dateFormatter.string(from: updatedUhrzeit ?? Date())
                                let updatedAnkunftZeitString = dateFormatter.string(from: updatedAnkunftZeit ?? Date())
                                
                                fahrtDocRef.updateData(["AbholZeit": updatedUhrzeitString, "AnkunftZeit": updatedAnkunftZeitString])
                            }
                         else {
                            print("Dokument existiert nicht.")
                        }
                
                if name.contains("Dr. Erika Mustermann") {
                    fahrtDocRef.updateData(["Bild": "route4", "Dauer": "11-16min", "Entfernung": "9km", "Ziel": "Dieselstraße 29, 72285 Pfalzgrafenweiler", "horizontal": 48.538100, "vertikal": 8.572790, "Name": "Dr. Erika Mustermann"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Hanz Meier") {
                    fahrtDocRef.updateData(["Bild": "route2", "Dauer": "5-10min", "Entfernung": "5km", "Ziel": "Haldenweg 12, 72178 Waldachtal", "horizontal": 48.499032, "vertikal": 8.573599, "Name": "Dr. Hanz Meier"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Peter Werner") {
                    fahrtDocRef.updateData(["Bild": "route3", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Blumenstraße 24, 72285 Pfalzgrafenweiler", "horizontal": 48.530573, "vertikal": 8.567117, "Name": "Dr. Peter Werner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Thomas Wagner") {
                    fahrtDocRef.updateData(["Bild": "route1", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Lange Straße 47, 72285 Pfalzgrafenweiler", "horizontal": 48.528673, "vertikal": 8.563391, "Name": "Dr. Thomas Wagner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let nextViewController = storyboard.instantiateViewController(withIdentifier: "FahrtBuchenScreen") as? FahrtbuchenViewController {
                        self.navigationController?.pushViewController(nextViewController, animated: true)
                    }
                }
            }
        }
    }
    
    
    
    
    @IBAction func dienstagbuchenbuttonPressed(_ sender: Any) {
        db = Firestore.firestore()
        
        
        let arztDocRef = db.collection("Ärzte").document("arzt2")
        let fahrtDocRef = db.collection("Ärzte").document("Fahrt")
        fahrtDocRef.updateData(["Datum": "25.Juli"])
        
        arztDocRef.getDocument { (arztDocument, error) in
            if let arztDocument = arztDocument, arztDocument.exists {
                let name = arztDocument.data()?["Name"] as? String ?? ""
                
                let uhrzeitZwei = arztDocument.get("uhrzeitZwei") as? String ?? ""
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "H:mm"
                            if let uhrzeitDate = dateFormatter.date(from: uhrzeitZwei) {
                                let updatedUhrzeit = Calendar.current.date(byAdding: .minute, value: -30, to: uhrzeitDate)
                                let updatedAnkunftZeit = Calendar.current.date(byAdding: .minute, value: -15, to: uhrzeitDate)
                                
                                dateFormatter.dateFormat = "H:mm"
                                let updatedUhrzeitString = dateFormatter.string(from: updatedUhrzeit ?? Date())
                                let updatedAnkunftZeitString = dateFormatter.string(from: updatedAnkunftZeit ?? Date())
                                
                                fahrtDocRef.updateData(["AbholZeit": updatedUhrzeitString, "AnkunftZeit": updatedAnkunftZeitString])
                            }
                         else {
                            print("Document does not exist.")
                        }
                
                
                if name.contains("Dr. Erika Mustermann") {
                    fahrtDocRef.updateData(["Bild": "route4", "Dauer": "11-16min", "Entfernung": "9km", "Ziel": "Dieselstraße 29, 72285 Pfalzgrafenweiler", "horizontal": 48.538100, "vertikal": 8.572790, "Name": "Dr. Erika Mustermann"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Hanz Meier") {
                    fahrtDocRef.updateData(["Bild": "route2", "Dauer": "5-10min", "Entfernung": "5km", "Ziel": "Haldenweg 12, 72178 Waldachtal", "horizontal": 48.499032, "vertikal": 8.573599, "Name": "Dr. Hanz Meier"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Peter Werner") {
                    fahrtDocRef.updateData(["Bild": "route3", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Blumenstraße 24, 72285 Pfalzgrafenweiler", "horizontal": 48.530573, "vertikal": 8.567117, "Name": "Dr. Peter Werner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Thomas Wagner") {
                    fahrtDocRef.updateData(["Bild": "route1", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Lange Straße 47, 72285 Pfalzgrafenweiler", "horizontal": 48.528673, "vertikal": 8.563391, "Name": "Dr. Thomas Wagner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let nextViewController = storyboard.instantiateViewController(withIdentifier: "FahrtBuchenScreen") as? FahrtbuchenViewController {
                        self.navigationController?.pushViewController(nextViewController, animated: true)
                    }
                }
            }
        }
    }
    
    
    
    @IBAction func mittwochbuchenbuttonPressed(_ sender: Any) {
        db = Firestore.firestore()
        
        
        let arztDocRef = db.collection("Ärzte").document("arzt3")
        let fahrtDocRef = db.collection("Ärzte").document("Fahrt")
        fahrtDocRef.updateData(["Datum": "26.Juli"])
        
        
        
        arztDocRef.getDocument { (arztDocument, error) in
            if let arztDocument = arztDocument, arztDocument.exists {
                let name = arztDocument.data()?["Name"] as? String ?? ""
                
                let uhrzeitZwei = arztDocument.get("uhrzeitZwei") as? String ?? ""
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "H:mm"
                            if let uhrzeitDate = dateFormatter.date(from: uhrzeitZwei) {
                                let updatedUhrzeit = Calendar.current.date(byAdding: .minute, value: -30, to: uhrzeitDate)
                                let updatedAnkunftZeit = Calendar.current.date(byAdding: .minute, value: -15, to: uhrzeitDate)
                                
                                dateFormatter.dateFormat = "H:mm"
                                let updatedUhrzeitString = dateFormatter.string(from: updatedUhrzeit ?? Date())
                                let updatedAnkunftZeitString = dateFormatter.string(from: updatedAnkunftZeit ?? Date())
                                
                                fahrtDocRef.updateData(["AbholZeit": updatedUhrzeitString, "AnkunftZeit": updatedAnkunftZeitString])
                            }
                         else {
                            print("Document does not exist.")
                        }
                    
        
                            
                if name.contains("Dr. Erika Mustermann") {
                    fahrtDocRef.updateData(["Bild": "route4", "Dauer": "11-16min", "Entfernung": "9km", "Ziel": "Dieselstraße 29, 72285 Pfalzgrafenweiler", "horizontal": 48.538100, "vertikal": 8.572790, "Name": "Dr. Erika Mustermann"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Hanz Meier") {
                    fahrtDocRef.updateData(["Bild": "route2", "Dauer": "5-10min", "Entfernung": "5km", "Ziel": "Haldenweg 12, 72178 Waldachtal", "horizontal": 48.499032, "vertikal": 8.573599, "Name": "Dr. Hanz Meier"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Peter Werner") {
                    fahrtDocRef.updateData(["Bild": "route3", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Blumenstraße 24, 72285 Pfalzgrafenweiler", "horizontal": 48.530573, "vertikal": 8.567117, "Name": "Dr. Peter Werner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Thomas Wagner") {
                    fahrtDocRef.updateData(["Bild": "route1", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Lange Straße 47, 72285 Pfalzgrafenweiler", "horizontal": 48.528673, "vertikal": 8.563391, "Name": "Dr. Thomas Wagner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                }
                        
                            DispatchQueue.main.async {
                                                        
                                                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "FahrtBuchenScreen") as? FahrtbuchenViewController {
                                                            self.navigationController?.pushViewController(nextViewController, animated: true)
                                                        }
                                                    }
                        }
                    }

    }
    
    
    @IBAction func donnerstagbuchenbuttonPressed(_ sender: Any) {
        db = Firestore.firestore()
        
        let arztDocRef = db.collection("Ärzte").document("arzt4")
        let fahrtDocRef = db.collection("Ärzte").document("Fahrt")
        fahrtDocRef.updateData(["Datum": "27.Juli"])
        
        arztDocRef.getDocument { (arztDocument, error) in
            if let arztDocument = arztDocument, arztDocument.exists {
                let name = arztDocument.data()?["Name"] as? String ?? ""
                
                let uhrzeitZwei = arztDocument.get("uhrzeitZwei") as? String ?? ""
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "H:mm"
                            if let uhrzeitDate = dateFormatter.date(from: uhrzeitZwei) {
                                let updatedUhrzeit = Calendar.current.date(byAdding: .minute, value: -30, to: uhrzeitDate)
                                let updatedAnkunftZeit = Calendar.current.date(byAdding: .minute, value: -15, to: uhrzeitDate)
                                
                                dateFormatter.dateFormat = "H:mm"
                                let updatedUhrzeitString = dateFormatter.string(from: updatedUhrzeit ?? Date())
                                let updatedAnkunftZeitString = dateFormatter.string(from: updatedAnkunftZeit ?? Date())
                                
                                fahrtDocRef.updateData(["AbholZeit": updatedUhrzeitString, "AnkunftZeit": updatedAnkunftZeitString])
                            }
                         else {
                            print("Document does not exist.")
                        }
                
                if name.contains("Dr. Erika Mustermann") {
                    fahrtDocRef.updateData(["Bild": "route4", "Dauer": "11-16min", "Entfernung": "9km", "Ziel": "Dieselstraße 29, 72285 Pfalzgrafenweiler", "horizontal": 48.538100, "vertikal": 8.572790, "Name": "Dr. Erika Mustermann"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Hanz Meier") {
                    fahrtDocRef.updateData(["Bild": "route2", "Dauer": "5-10min", "Entfernung": "5km", "Ziel": "Haldenweg 12, 72178 Waldachtal", "horizontal": 48.499032, "vertikal": 8.573599, "Name": "Dr. Hanz Meier"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Peter Werner") {
                    fahrtDocRef.updateData(["Bild": "route3", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Blumenstraße 24, 72285 Pfalzgrafenweiler", "horizontal": 48.530573, "vertikal": 8.567117, "Name": "Dr. Peter Werner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Thomas Wagner") {
                    fahrtDocRef.updateData(["Bild": "route1", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Lange Straße 47, 72285 Pfalzgrafenweiler", "horizontal": 48.528673, "vertikal": 8.563391, "Name": "Dr. Thomas Wagner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                }
                        
                            DispatchQueue.main.async {
                                                        
                                                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "FahrtBuchenScreen") as? FahrtbuchenViewController {
                                                            self.navigationController?.pushViewController(nextViewController, animated: true)
                                                        }
                                                    }
                        }
                    }

    }
    
    
    
    @IBAction func freitagbuchenbuttonPressed(_ sender: Any) {
        db = Firestore.firestore()
        
        let arztDocRef = db.collection("Ärzte").document("arzt5")
        let fahrtDocRef = db.collection("Ärzte").document("Fahrt")
        fahrtDocRef.updateData(["Datum": "28.Juli"])
        
        arztDocRef.getDocument { (arztDocument, error) in
            if let arztDocument = arztDocument, arztDocument.exists {
                let name = arztDocument.data()?["Name"] as? String ?? ""
                
                let uhrzeitZwei = arztDocument.get("uhrzeitZwei") as? String ?? ""
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "H:mm"
                            if let uhrzeitDate = dateFormatter.date(from: uhrzeitZwei) {
                                let updatedUhrzeit = Calendar.current.date(byAdding: .minute, value: -30, to: uhrzeitDate)
                                let updatedAnkunftZeit = Calendar.current.date(byAdding: .minute, value: -15, to: uhrzeitDate)
                                
                                dateFormatter.dateFormat = "H:mm"
                                let updatedUhrzeitString = dateFormatter.string(from: updatedUhrzeit ?? Date())
                                let updatedAnkunftZeitString = dateFormatter.string(from: updatedAnkunftZeit ?? Date())
                                
                                fahrtDocRef.updateData(["AbholZeit": updatedUhrzeitString, "AnkunftZeit": updatedAnkunftZeitString])
                            }
                         else {
                            print("Document does not exist.")
                        }
                
                if name.contains("Dr. Erika Mustermann") {
                    fahrtDocRef.updateData(["Bild": "route4", "Dauer": "11-16min", "Entfernung": "9km", "Ziel": "Dieselstraße 29, 72285 Pfalzgrafenweiler", "horizontal": 48.538100, "vertikal": 8.572790, "Name": "Dr. Erika Mustermann"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Hanz Meier") {
                    fahrtDocRef.updateData(["Bild": "route2", "Dauer": "5-10min", "Entfernung": "5km", "Ziel": "Haldenweg 12, 72178 Waldachtal", "horizontal": 48.499032, "vertikal": 8.573599, "Name": "Dr. Hanz Meier"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Peter Werner") {
                    fahrtDocRef.updateData(["Bild": "route3", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Blumenstraße 24, 72285 Pfalzgrafenweiler", "horizontal": 48.530573, "vertikal": 8.567117, "Name": "Dr. Peter Werner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                } else if name.contains("Dr. Thomas Wagner") {
                    fahrtDocRef.updateData(["Bild": "route1", "Dauer": "10-15min", "Entfernung": "8km", "Ziel": "Lange Straße 47, 72285 Pfalzgrafenweiler", "horizontal": 48.528673, "vertikal": 8.563391, "Name": "Dr. Thomas Wagner"]) { error in
                        if let error = error {
                            print("Fehler beim Aktualisieren der Fahrtdaten: \(error.localizedDescription)")
                        } else {
                            print("Fahrdaten aktualisiert")
                            
                        }
                    }
                }
                        
                            DispatchQueue.main.async {
                                                        
                                                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "FahrtBuchenScreen") as? FahrtbuchenViewController {
                                                            self.navigationController?.pushViewController(nextViewController, animated: true)
                                                        }
                                                    }
                        }
                    }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()

        
        let NameRef = db.collection("Ärzte").document("Nutzer")
        NameRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                let name = data?["Name"] as? String ?? ""
                
                
                self.nameNutzer?.text = name + "!"
                
            }
        }
       

        self.navigationItem.hidesBackButton = true
    }
    


}
