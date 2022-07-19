//
//  LoginViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 25/03/2022.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "home")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func singUpButton(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let result = result, error == nil {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "home")
                    vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true)
                  
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error al registrar el nuevo usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let result = result, error == nil {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "home")
                    vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: "El usuario no existe o correo electronico no valido", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
                self.checkUserInfo()
            }
        }
        
    }
    
}
