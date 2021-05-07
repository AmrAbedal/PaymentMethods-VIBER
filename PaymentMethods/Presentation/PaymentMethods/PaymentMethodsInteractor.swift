//
//  DataLoaderDataSource.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import Foundation

class PaymentMethodsInteractor: PaymentMethodsInteractorProtocol {
    weak var presenter: PaymentMethodsInteractorOutputProtocol?
    func loadPaymentMethds() {
        NetworkManager.shared.fetchData(withUrlRequest: URLRequest.init(url: URL.init(string: AppURLS.paymentMethods)!), andResponceType: PayemtMethodsResponce.self, andCompletion: { [weak self] result in
            switch result {
            case .success(let methods):
                self?.presenter?.methodsLoadedSuccessfully(methods: methods.networks.applicable)
            case .failure(let error):
                self?.presenter?.errorInloadingMethods(error: error)
            }
            
        })
    }
}
