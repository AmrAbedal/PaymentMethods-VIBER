//
//  PaymentMethodsPresenter.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import Foundation

class PaymentMethodsPresenter  {
    var methods: [PaymentMethodViewModel] = []
    weak var view: PaymentMethodsViewProtocol?
    private let interactor: PaymentMethodsInteractorProtocol
    let wirframe: PaymentMethodsCoordinator
    init(interactor: PaymentMethodsInteractorProtocol,  wirframe: PaymentMethodsCoordinator) {
        self.interactor = interactor
        self.wirframe = wirframe
    }
}
extension PaymentMethodsPresenter: PaymentMethodsPresenterProtocol {
   
    func viewDidLoad() {
        interactor.loadPaymentMethds()
    }

}
extension PaymentMethodsPresenter : PaymentMethodsInteractorOutputProtocol {
    func methodsLoadedSuccessfully(methods: [PaymentMethod]) {
        self.methods = methods.map({PaymentMethodViewModel.init(id: $0.code, imageLink: $0.links.logo, label: $0.label)})
    }
    
    func errorInloadingMethods(error: AppError) {
        
    }
    
}
