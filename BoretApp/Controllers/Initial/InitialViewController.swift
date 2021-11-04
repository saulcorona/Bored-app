//
//  InitialViewController.swift
//  BoretApp
//
//  Created by Saul Corona Santos on 03/11/21.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateKeyboard()
        userTextField.delegate = self
        userTextField.placeholder = "Number of participants 1 to 8"
        userTextField.textAlignment = .center
        userTextField.layer.borderWidth = 1
        userTextField.layer.cornerRadius = 4.0
    }
    
   
    @IBAction func goToTermsConditions(_ sender: UIButton) {
        goToTermsController()
    }
    
    
    @IBAction func startGameBored(_ sender: Any) {
        if userTextField.hasText {
            showCategories() 
        } else {
            showAlert(title: "You have to enter a number ☹️",
                message: nil,
                actions: ["OK"])
        }
    }
}

extension InitialViewController{
    private func goToTermsController(){
        let vc = TermsViewController(nibName: "TermsViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    
    private func showCategories() {
        let vc = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc, animated: true, completion: nil)
    }
}

// MARK: Keyboard Configuration
extension InitialViewController {
    func animateKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

extension InitialViewController {
    func showAlert(title: String, message: String?, actions: [String]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { value in
            alert.addAction(UIAlertAction(title: value, style: .default, handler: nil))
        }
        self.present(alert, animated: true)
    }
}
