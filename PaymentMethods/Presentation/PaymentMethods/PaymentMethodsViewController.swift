//
//  PaymentMethodsViewController.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import UIKit
class PaymentMethodsCoordinator {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        navigationController.pushViewController(PaymentMethodsViewController(), animated: true)
    }
}

class PaymentMethodsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
