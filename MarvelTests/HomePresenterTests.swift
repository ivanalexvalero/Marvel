//
//  HomePresenterTests.swift
//  MarvelTests
//
//  Created by Ivan Valero on 28/07/2022.
//

import XCTest
@testable import Marvel

@MainActor class HomePresenterTests: XCTestCase {
    
    var sut: HomePresenter!
    var sutDelegate: HomePresenterMockTest!
    var timeOut : TimeInterval = 8.0

    @MainActor override func setUpWithError() throws {
        sutDelegate = HomePresenterMockTest()
       sut = HomePresenter(delegate: sutDelegate)
    }

    @MainActor override func tearDownWithError() throws {
        sut = nil
        sutDelegate = nil
    }
    
    
    func test_GetListData_Character() {
        sutDelegate.expGetDataWasCalled = expectation(description: "GetData")
        Task {
            await sut.getListData()
        }

        waitForExpectations(timeout: timeOut)
        
        guard let character = sut.objectList.first as? [CharacterModel.DataClass.Result] else {
            XCTFail("Falló por que no existe el objeto deseado en esa primera posición")
            return
        }
        XCTAssertTrue(character.first?.id != 0, "El id de character es: \(String(describing: character.first?.id))")
        
    }



}

class HomePresenterMockTest: HomeViewProtocol {
    var getDataWasCalled: Bool = false
    var expGetDataWasCalled: XCTestExpectation?
    
    func getData(list: [[Any]]) {
        getDataWasCalled = true
        expGetDataWasCalled?.fulfill()
        
    }
}
