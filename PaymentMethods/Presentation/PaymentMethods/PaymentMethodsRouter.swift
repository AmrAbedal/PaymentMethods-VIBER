//
//  PaymentMethodsRouter.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import Foundation
import UIKit


class PaymentMethodsCoordinator: PaymentMethodsCoordinatorProtocol {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let interactor = PaymentMethodsInteractor()
        let presenter = PaymentMethodsPresenter.init(interactor: interactor, wirframe: self)
        interactor.presenter = presenter
        let vc = PaymentMethodsViewController(presenter: presenter)
        presenter.view = vc
        navigationController.pushViewController(vc, animated: true)
    }
}
