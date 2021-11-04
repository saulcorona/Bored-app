//
//  InitialViewController.swift
//  BoretApp
//
//  Created by Saul Corona Santos on 03/11/21.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func goToTermsConditions(_ sender: UIButton) {
        goToTermsController()
    }
}

extension InitialViewController{
    private func goToTermsController(){
        let vc = TermsViewController(nibName: "TermsViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
}
