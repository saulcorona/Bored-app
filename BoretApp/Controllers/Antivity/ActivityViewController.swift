//
//  ActivityViewController.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 04/11/2021.
//

import UIKit
import ProgressHUD

class ActivityViewController: UIViewController {

    @IBOutlet weak var activityNameLabel: UILabel!

    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var typeStackView: UIStackView!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var tryAnotherOutlet: UIButton!
    
    var typeActivity: String = ""
    var isLoading: Bool = true
    var fromRandom: Bool = false
    var activity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup(isLoading: isLoading)
//        loadValues()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        loadValues()
    }
    // MARK: - Actions
    @IBAction func tryAnotherTapped(_ sender: Any) {
        loadValues()
    }
}

extension ActivityViewController {
    
    func initialSetup(isLoading: Bool) {
        activityNameLabel.isHidden = isLoading
        generalView.isHidden = isLoading
        tryAnotherOutlet.isHidden = isLoading
    }
    
    func loadValues() {
        ProgressHUD.show()
        if fromRandom {
            RandomServices().getRandomActivity(for: User.shared.participants!) { result in
                if !result.isEmpty {
                    self.activity = result[0]
                    self.setupLabels()
                    ProgressHUD.dismiss()
                } else {
                    ProgressHUD.showError("Ups!", image: nil, interaction: true)
                }
            }
        } else {
            TypeServices().getTypeActivity(for: User.shared.participants!, with: typeActivity) { result in
                if !result.isEmpty {
                    self.activity = result[0]
                    self.setupLabels()
                    ProgressHUD.dismiss()
                } else {
                    ProgressHUD.showError("Ups!", image: nil, interaction: true)
                }
            }
        }
    }

    func setupLabels() {
        activityNameLabel.text = activity.name
        participantsLabel.text = String(activity.participants)
        priceLabel.text = String(activity.price)
        typeLabel.text = activity.type
        initialSetup(isLoading: false)
    }

    func setupUI() {
        typeStackView.isHidden = fromRandom
    }
}
