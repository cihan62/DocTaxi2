import UIKit

class TermineViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stern: UIButton!
    @IBOutlet weak var stern2: UIButton!
    @IBOutlet weak var stern3: UIButton!
    @IBOutlet weak var stern4: UIButton!
    @IBOutlet weak var stern5: UIButton!
    @IBOutlet weak var textfield: UITextField!
    
    var mitteilungen = [
        "Der Fahrer ist in 5 Minuten bei Ihnen!",
        "Wie hat ihnen die vergangene Fahrt gefallen?Klicken Sie hier, um sie zu bewerten.",
        "Sind Sie zufrieden mit der App?Bewerten Sie uns im AppStore!",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        textfield?.borderStyle = .roundedRect
        textfield?.contentVerticalAlignment = .top
        textfield?.contentMode = .topLeft
        textfield?.layer.borderWidth = 1.0
        textfield?.layer.borderColor = UIColor.black.cgColor
        textfield?.layer.cornerRadius = 5.0

    }
    
    
    @IBAction func feedbackPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Bewertung übermittelt", message: "Ihre Bewertung wurde erfolgreich übermittelt. Vielen Dank!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        

    }
    
    @IBAction func sternPressed(_ sender: Any) {
        stern.isSelected = true
        stern2.isSelected = false
        stern3.isSelected = false
        stern4.isSelected = false
        stern5.isSelected = false
    }
    
    @IBAction func stern2Pressed(_ sender: Any) {
        stern.isSelected = true
        stern2.isSelected = true
        stern3.isSelected = false
        stern4.isSelected = false
        stern5.isSelected = false

    }
    
    @IBAction func stern3Pressed(_ sender: Any) {
        stern.isSelected = true
        stern2.isSelected = true
        stern3.isSelected = true
        stern4.isSelected = false
        stern5.isSelected = false
    }
    
    @IBAction func stern4Pressed(_ sender: Any) {
        stern.isSelected = true
        stern2.isSelected = true
        stern3.isSelected = true
        stern4.isSelected = true
        stern5.isSelected = false
    }
    
    @IBAction func stern5Pressed(_ sender: Any) {
        stern.isSelected = true
        stern2.isSelected = true
        stern3.isSelected = true
        stern4.isSelected = true
        stern5.isSelected = true
    }
    
    
   
    
    
}

extension TermineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            performSegue(withIdentifier: "fahrtbewerten", sender: nil)
        } else {
            print("Du hast mich gedrückt")
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Löschen") { [weak self] (_, _, completionHandler) in
            self?.deleteItem(at: indexPath)
            completionHandler(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    private func deleteItem(at indexPath: IndexPath) {
        // Perform the deletion logic here
        mitteilungen.remove(at: indexPath.row)
        tableView?.deleteRows(at: [indexPath], with: .fade)
    }
}

extension TermineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mitteilungen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = mitteilungen[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14) // Adjust the font size as needed
        let text = mitteilungen[indexPath.row].replacingOccurrences(of: "?", with: "?\n")
            cell.textLabel?.text = text
        return cell
    }


    
    

}
