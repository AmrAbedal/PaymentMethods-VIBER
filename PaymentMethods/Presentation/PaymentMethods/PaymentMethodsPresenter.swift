//
//  PaymentMethodsPresenter.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import Foundation

class PaymentMethodsPresenter  {
    private var methods: [PaymentMethodViewModel] = []
    weak var view: PaymentMethodsViewProtocol?
    private let interactor: PaymentMethodsInteractorProtocol
    let wirframe: PaymentMethodsCoordinatorProtocol
    init(interactor: PaymentMethodsInteractorProtocol,  wirframe: PaymentMethodsCoordinatorProtocol) {
        self.interactor = interactor
        self.wirframe = wirframe
    }
}
extension PaymentMethodsPresenter: PaymentMethodsPresenterProtocol {
    func getMethod(index: Int) -> PaymentMethodViewModel {
        return methods[index]
    }
    
    var methodsCount: Int {
        return methods.count
    }
    
    func viewDidLoad() {
        interactor.loadPaymentMethds()
    }

}
extension PaymentMethodsPresenter : PaymentMethodsInteractorOutputProtocol {
    func methodsLoadedSuccessfully(methods: [PaymentMethod]) {
        self.methods = methods.map({PaymentMethodViewModel.init(id: $0.code, imageLink: $0.links.logo, label: $0.label)})
        view?.reloadData()
    }
    
    func errorInloadingMethods(error: AppError) {
        view?.errorInloadingMethods(errorMessage: error.localizedDescription)
    }
    
}
