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
    var fromRandom: Bool = true
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
                ProgressHUD.dismiss()
                if !result.isEmpty {
                    self.activity = result[0]
                    self.setupLabels()
//                    ProgressHUD.dismiss()
                } else {
//                    ProgressHUD.showError("Ups!", image: nil, interaction: true)
                    self.showErrorController()
                }
            }
        } else {
            TypeServices().getTypeActivity(for: User.shared.participants!, with: typeActivity) { result in
                ProgressHUD.dismiss()
                print(result)
                if !result.isEmpty {
                    self.activity = result[0]
                    self.setupLabels()
//                    ProgressHUD.dismiss()
                } else {
//                    ProgressHUD.showError("Ups!", image: nil, interaction: true)
                    self.showErrorController()
                }
            }
        }
    }

    func setupLabels() {
        activityNameLabel.text = activity.name
        participantsLabel.text = String(activity.participants)
        priceLabel.text = convertToPriceString(input: activity.price)
        typeLabel.text = activity.type.firstUppercased
        initialSetup(isLoading: false)
    }

    func setupUI() {
        typeStackView.isHidden = !fromRandom
    }
    
    func showErrorController() {
        let vc = ErrorViewController(nibName: "ErrorViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.present(vc, animated: true, completion: nil)
    }
}

extension ActivityViewController {
    
    func convertToPriceString(input: Double) -> String {
        switch input {
        case 0:
            return "Free"
        case 0...0.3:
            return "Low"
        case 0.3...0.6:
            return "Medium"
        case 0.6...:
            return "High"
        default:
            return "N/A"
        }
    }

}
