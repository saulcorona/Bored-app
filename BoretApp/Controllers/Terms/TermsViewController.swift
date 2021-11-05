//
//  TermsViewController.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 03/11/2021.
//

import UIKit
import ProgressHUD

class TermsViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.textView.text = load(file: "terms")
    }

    @IBAction func dismissTermsTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension TermsViewController {
    
    private func load(file name:String) -> String {
        if let path = Bundle.main.path(forResource: name, ofType: nil) {
            if let contents = try? String(contentsOfFile: path) {
                return contents
            } else {
                print("Error! - This file doesn't contain any text.")
                ProgressHUD.showError("Ups, something went wrong :(", image: nil, interaction: true)
            }
        } else {
            ProgressHUD.showError("Ups, something went wrong :(", image: nil, interaction: true)
        }
        return ""
    }
    
    private func setupUI() {
        closeButton.tintColor = UIColor(red: 34/255, green: 229/255, blue: 171/255, alpha: 1)
        titleLabel.textColor = UIColor(red: 34/255, green: 229/255, blue: 171/255, alpha: 1)
    }
}
