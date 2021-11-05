//
//  TabBar.swift
//  BoretApp
//
//  Created by Saul Corona Santos on 04/11/21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        tabBar.backgroundColor = .clear
        self.delegate = self
    }

    func setupViewControllers() {
        viewControllers = [
            createNavController(for: CategoriesViewController(), title: NSLocalizedString("Categories", comment: ""), image: UIImage(systemName: "list.dash")!),
            createNavController(for: ActivityViewController(), title: NSLocalizedString("Random", comment: ""), image: UIImage(systemName: "shuffle")!)
        ]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if self.selectedIndex == 1 {
            let rootView = self.viewControllers![self.selectedIndex] as! UINavigationController
            rootView.popToRootViewController(animated: true)
        }
    }
}

// MARK: Controllers creator
extension TabBarController {
    
    func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navController.navigationBar.backgroundColor = .systemGreen
        rootViewController.title = title
        rootViewController.navigationItem.title = title
        return navController
    }
}
