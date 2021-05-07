//
//  PaymentMethodsTests.swift
//  PaymentMethodsTests
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import XCTest
@testable import PaymentMethods

class PaymentMethodsTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testPaymentMethodDataLoadedSuccessfully() {
        let interactor = PatmentMethodInteractorSuccessMock.init()
        let presenter = PaymentMethodsPresenter.init(interactor: interactor, wirframe: PaymentMethodsCoordinatorMock())
        let view = PaymentMethodViewMock(presenter: presenter)
        presenter.view = view
        interactor.presenter = presenter
        presenter.viewDidLoad()
        assert(view.dataSuccessed)
    }
    
    func testPaymentMethodErrorInloadingData() {
        let interactor = PatmentMethodInteractorErrorMock.init()
        let presenter = PaymentMethodsPresenter.init(interactor: interactor, wirframe: PaymentMethodsCoordinatorMock())
        let view = PaymentMethodViewMock(presenter: presenter)
        presenter.view = view
        interactor.presenter = presenter
        presenter.viewDidLoad()
        assert(view.errorHappended)
    }
}

class PaymentMethodViewMock: PaymentMethodsViewProtocol {
    var presenter: PaymentMethodsPresenterProtocol
    init(presenter: PaymentMethodsPresenterProtocol) {
        self.presenter = presenter
    }
    var dataSuccessed = false
    var errorHappended = false
    func reloadData() {
        dataSuccessed = true
    }
    
    func errorInloadingMethods(errorMessage: String) {
        errorHappended = true
    }
}

class PatmentMethodInteractorSuccessMock: PaymentMethodsInteractorProtocol {
    var presenter: PaymentMethodsInteractorOutputProtocol?
    
    func loadPaymentMethds() {
        presenter?.methodsLoadedSuccessfully(methods: [PaymentMethod.init(code: "", label: "", method: "", grouping: "", registration: "", recurrence: "", redirect: true, links: Links.init(logo: "", lang: "", operation: "", validation: ""))])
    }
}
class PatmentMethodInteractorErrorMock: PaymentMethodsInteractorProtocol {
    var presenter: PaymentMethodsInteractorOutputProtocol?
    
    func loadPaymentMethds() {
        presenter?.errorInloadingMethods(error: .ConnectionFailures)
    }
}

class PaymentMethodsCoordinatorMock: PaymentMethodsCoordinatorProtocol {
    
}
