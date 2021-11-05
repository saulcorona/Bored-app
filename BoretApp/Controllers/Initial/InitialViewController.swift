//
//  InitialViewController.swift
//  BoretApp
//
//  Created by Saul Corona Santos on 03/11/21.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var startGameOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        animateKeyboard()
    }
   
    @IBAction func goToTermsConditions(_ sender: UIButton) {
        goToTermsController()
    }
    
    @IBAction func valueChanged(_ sender: UITextField) {
        let value = Int(sender.text!) ?? 0
        print(value)
        if (value >= 1 && value <= 8) {
            startGameOutlet.isEnabled = true
            startGameOutlet.backgroundColor = .systemGreen
            print(value)
        } else {
            startGameOutlet.isEnabled = false
            startGameOutlet.backgroundColor = .systemGray2
        }
    }
    
    
    @IBAction func startGameBored(_ sender: Any) {
        if userTextField.hasText {
            User.shared.participants = Int(userTextField.text!)
            showCategories() 
        }
    }
}

// MARK: - SetupUI
extension InitialViewController {

    func setupTextField() {
        userTextField.delegate = self
        userTextField.placeholder = "Number of participants 1 to 8"
        userTextField.textAlignment = .center
        userTextField.layer.borderWidth = 1
        userTextField.layer.cornerRadius = 4.0
        userTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)))
    }
}

extension InitialViewController {

    private func goToTermsController(){
        let vc = TermsViewController(nibName: "TermsViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    
    private func showCategories() {
        let tabBarControler = TabBarController()
                tabBarControler.modalPresentationStyle = .fullScreen
                self.present(tabBarControler, animated: true)
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

    @objc func tapDone() {
        dismissKeyboard()
    }
}
