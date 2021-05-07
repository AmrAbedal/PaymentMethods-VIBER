//
//  PaymentMethodsViewController.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import UIKit


class PaymentMethodsViewController: UIViewController {
    let presenter: PaymentMethodsPresenterProtocol
    init(presenter: PaymentMethodsPresenterProtocol) {
    self.presenter = presenter
        super.init(nibName:"PaymentMethodsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}
extension PaymentMethodsViewController : PaymentMethodsViewProtocol {
    func reloadData() {
        
    }
}
