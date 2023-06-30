//
//  ViewController.swift
//  Evaluation1
//
//  Created by Ludo Vostès on 30/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var eyes: UIImageView!
    @IBOutlet weak var mySwitch : UISwitch!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var profil: UIImageView!
    // @IBOutlet weak var circle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mySwitch.isOn = false
        
        // PROFIL
        profil.layer.cornerRadius = profil.frame.height / 2
        
        // CLAVIER
        let tapOnView = UITapGestureRecognizer(target: view, action:
        #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)
        
        // PASSWORD
        password.isSecureTextEntry = true
        
        // CHOIX DU CLAVIER
        login.keyboardType = .emailAddress
    }
    
    
    // ACTION POPUP BOUTON
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        // GESTION POPUP
        guard let login = login.text, !login.isEmpty else {
            showAlert(title: "Erreur", message: "Veuillez saisir un login.")
            return
        }

        guard let password = password.text, !password.isEmpty else {
            showAlert(title: "Erreur", message: "Veuillez saisir un mot de passe.")
            return
        }

        if !login.contains("@") {
            showAlert(title: "Erreur", message: "Le login doit contenir le caractère '@'.")
            return
        }

        if password.count < 4 {
            showAlert(title: "Erreur", message: "Le mot de passe doit contenir au moins 4 caractères.")
            return
        }

        // SI OK !
        let newsletterStatus = mySwitch.isOn ? "inscrit à la newsletter" : "non inscrit à la newsletter"
        let successMessage = "Connexion réussie !\n\nNom d'utilisateur : \(login)\nStatut newsletter : \(newsletterStatus)"
            showAlert(title: "Succès", message: successMessage)
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}

