//
//  ErrorViewController.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 05/11/2021.
//

import UIKit

class ErrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reloadTapped(_ sender: Any) {
        reloadView()
    }
    
}

extension ErrorViewController {
    
    func reloadView() {
        self.dismiss(animated: true, completion: nil)
    }
}
