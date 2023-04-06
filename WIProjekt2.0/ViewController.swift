//
//  ViewController.swift
//  WIProjekt2.0
//
//  Created by Cihan Dikme on 06.04.23.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
 
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func anmeldenPressed(_ sender: Any) {
        guard let userEmail = email.text, !userEmail.isEmpty,
        let userPassword = password.text, !userPassword.isEmpty else {
        showErrorAlert()
        return
        }
        
        if let email = email.text, let password = password.text {
                Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
                    if error != nil {
                        self.showErrorAlertLogin()
                    }
                    else {
                        self.performSegue(withIdentifier: "goToNext", sender: self)
                    }
                }
            }
        
    }
    
    
    
    @IBOutlet weak var anmelden: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton=true;
    }

    func showErrorAlert() {
        let alert = UIAlertController(title: "Fehler", message: "Bitte geben Sie Ihre E-Mail-Adresse und Ihr Passwort ein.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlertLogin() {
        let alert = UIAlertController(title: "Fehler", message: "E-Mail-Adresse oder Passwort ist falsch.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

