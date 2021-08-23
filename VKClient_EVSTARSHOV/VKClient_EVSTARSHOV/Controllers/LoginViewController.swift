//
//  ViewController.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 14.08.2021.
//

import UIKit

class LoginViewController: UIViewController {

    

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var scrollView: UIScrollView!

    
    
    
    @IBAction func loginScreen(unwindSegue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isValid() {
            print("Login")
            performSegue(
                withIdentifier: "loginSegue",
                sender: nil)
        } else {
            showAlert()
        }
    }
    
    
    private func showAlert() {
        let alertController = UIAlertController(
            title: "Error",
            message: "Incorrect username or password",
            preferredStyle: .alert)
        let alertItem = UIAlertAction(
            title: "Ok:(",
            style: .cancel)
        { _ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        alertController.addAction(alertItem)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
            return isValid()
        } else {
            return false
        }
    }

    
    func isValid() -> Bool {
        if loginTextField.text == "admin"
            && passwordTextField.text == "12345" {
            return true
        } else {
            return false
        }
//        loginTextField.text == "" && passwordTextField.text == ""
    }


}

