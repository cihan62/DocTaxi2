//
//  RegistrierenViewController.swift
//  WIProjekt2.0
//
//  Created by Cihan Dikme on 10.04.23.
//

import UIKit
import FirebaseAuth
import Firebase

class RegistrierenViewController: UIViewController {
    
    @IBOutlet weak var checkbox: UIButton!
    @IBOutlet weak var geburtstag: UIDatePicker!
    @IBOutlet weak var vorname: UITextField!
    @IBOutlet weak var nachname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passwort: UITextField!
    @IBOutlet weak var passwortbestätigen: UITextField!
    @IBOutlet weak var krankenkasse: UITextField!
    @IBOutlet weak var mitgliedsnummer: UITextField!
    
    
    
    @IBAction func registrierenTapped(_ sender: UIButton) {
        
       
        
        if let email1 = email.text, let password = passwort.text {
            Auth.auth().createUser(withEmail: email1, password: password) { firebaseResult, error in
                if error != nil {
                    print("error")
                } else {
                    Auth.auth().currentUser?.sendEmailVerification { error in
                        if error != nil {
                            print ("error")
                        }
                    }
                }
            }
        }
        
        guard let name = vorname.text else {
            return
        }

        
        let db = Firestore.firestore()
        
        let docRef = db.collection("Ärzte").document("Nutzer")
        
        docRef.updateData(["Name": name]) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Name erfolgreich aktualisiert")
            }
        }
        
        
    }
    
    
    
   
    
            
            @IBAction func checkboxTapped(_ sender: UIButton) {
                if sender.isSelected {
                    sender.isSelected = false
                }else {
                    sender.isSelected = true
                    
                }
                
            }
            
    
    override func shouldPerformSegue(withIdentifier zurBestatigung: String, sender: Any?) -> Bool {
        if email.text?.isEmpty == true || vorname.text?.isEmpty == true || nachname.text?.isEmpty == true || passwort.text?.isEmpty == true || krankenkasse.text?.isEmpty == true || mitgliedsnummer.text?.isEmpty == true || passwortbestätigen.text?.isEmpty == true {

            let alert = UIAlertController(title: "Fehler", message: "Bitte füllen Sie alle Felder aus.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)

            return false
        }
        
        if !checkbox.isSelected {
                let alert = UIAlertController(title: "Fehler", message: "Bitte bestätigen Sie die allgemeinen Nutzungsbedingungen.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    alert.dismiss(animated: true, completion: nil)
                }))
                present(alert, animated: true, completion: nil)
                return false
            }
        
        if passwort.text != passwortbestätigen.text {
            let fehlermeldung = "Die Passwörter stimmen nicht überein."
                    
                    let alert = UIAlertController(title: "Fehler", message: fehlermeldung, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                    
                    return false
        }
        
        else {
            return true
        }
    }

    
            
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                let germanLocale = Locale(identifier: "de_DE")
                geburtstag.locale = germanLocale
                geburtstag.datePickerMode = .date
                
                
                
                vorname.borderStyle = .roundedRect
                nachname.borderStyle = .roundedRect
                email.borderStyle = .roundedRect
                passwort.borderStyle = .roundedRect
                passwortbestätigen.borderStyle = .roundedRect
                krankenkasse.borderStyle = .roundedRect
                mitgliedsnummer.borderStyle = .roundedRect
                
                
                
            }
            
   
    
            
        }
    
