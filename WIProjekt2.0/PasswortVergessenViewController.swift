//
//  PasswortVergessenViewController.swift
//  WIProjekt2.0
//
//  Created by Cihan Dikme on 13.04.23.
//

import UIKit
import Firebase
import FirebaseAuth

class PasswortVergessenViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func bestätigenButton(_ sender: UIButton) {
       
       showConfirmationAlert()
       
       
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            if error != nil {
                print("error")
            }
            
        }
        emailTextField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.borderStyle = .roundedRect
       
        
    }
    

    func showConfirmationAlert() {
        let alert = UIAlertController(title: "Passwort zurückgesetzt", message: "Eine E-Mail zum Zurücksetzen des Passworts wurde versendet.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
