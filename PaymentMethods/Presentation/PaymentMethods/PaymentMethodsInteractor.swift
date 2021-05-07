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
        NetworkManager.shared.fetchData(withUrlRequest: URLRequest.init(url: URL.init(string: AppURLS.paymentMethods)!), andResponceType: PayemtMethodsResponce.self, andCompletion: { resutl in
            
            
        })
    }
}
