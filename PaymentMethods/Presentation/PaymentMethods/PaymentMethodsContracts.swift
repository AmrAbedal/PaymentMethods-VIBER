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
    func viewDidLoad()
    
}

protocol PaymentMethodsInteractorProtocol: AnyObject {
    func loadPaymentMethds()
}

protocol PaymentMethodsInteractorOutputProtocol: AnyObject {
    func methodsLoadedSuccessfully(methods: [PaymentMethod])
    func errorInloadingMethods(error: AppError)
}
