//
//  PaymentMethodsViewController.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import UIKit


class PaymentMethodsViewController: UIViewController {
    
    @IBOutlet weak var methodsTableView: UITableView!
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
        navigationItem.title = "Payments Methods"
        setupTableView()
        presenter.viewDidLoad()
    }
    private func setupTableView() {
        methodsTableView.register(UINib.init(nibName: PaymentMethodTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PaymentMethodTableViewCell.identifier)
        methodsTableView.rowHeight = 70
        methodsTableView.estimatedRowHeight = UITableView.automaticDimension
        methodsTableView.dataSource = self
    }
}

extension PaymentMethodsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.methodsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: PaymentMethodTableViewCell.identifier, for: indexPath) as? PaymentMethodTableViewCell else {
            fatalError("PaymentMethodTableViewCell Cell Not Registered")
        }
        cell.configure(model: presenter.getMethod(index: indexPath.row))
        return cell
    }
}
extension PaymentMethodsViewController : PaymentMethodsViewProtocol {
    func errorInloadingMethods(errorMessage: String) {
        debugPrint(errorMessage)
    }
    
    func reloadData() {
        methodsTableView.reloadData()
    }
}
