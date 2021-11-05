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
    
    private var viewModel: ActivityModel?
    
    var typeActivity: String = ""
    var isLoading: Bool = true
    var fromRandom: Bool = true
    var activity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ActivityModel(activityServices: RandomServices(), typeServices: TypeServices())
        initialSetup(isLoading: isLoading)
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
            viewModel?.getRandomActivity(for: User.shared.participants!, completition: {
                ProgressHUD.dismiss()
                if self.viewModel?.activity.participants != User.shared.participants {
                    self.showErrorController()
                } else {
                    self.setupLabels()
                }
            })
        } else {
            viewModel?.getTypeActivity(for: User.shared.participants!, with: typeActivity, completition: {
                ProgressHUD.dismiss()
                if self.viewModel?.activity.participants != User.shared.participants {
                    self.showErrorController()
                } else {
                    self.setupLabels()
                }
            })
        }
    }

    func setupLabels() {
        activity = viewModel?.activity
        activityNameLabel.text = activity.name
        participantsLabel.text = String(activity.participants)
        priceLabel.text = Price.convertToPriceString(input: activity.price)
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
