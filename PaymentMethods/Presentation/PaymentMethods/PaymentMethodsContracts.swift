//
//  PaymentMethodsContracts.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import Foundation



protocol PaymentMethodsViewProtocol: AnyObject {
    func reloadData()
    func errorInloadingMethods(errorMessage: String)

}


protocol PaymentMethodsPresenterProtocol: AnyObject {
    var methodsCount: Int { get }
    func viewDidLoad()
    func getMethod(index: Int) -> PaymentMethodViewModel
    
}

protocol PaymentMethodsInteractorProtocol: AnyObject {
    func loadPaymentMethds()
}

protocol PaymentMethodsInteractorOutputProtocol: AnyObject {
    func methodsLoadedSuccessfully(methods: [PaymentMethod])
    func errorInloadingMethods(error: AppError)
}

protocol PaymentMethodTableViewCellProtocol {
    func configure(model: PaymentMethodViewModel)
}
