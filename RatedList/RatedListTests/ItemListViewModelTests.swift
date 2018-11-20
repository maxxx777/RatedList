//
//  ItemListViewModelTests.swift
//  RatedListTests
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import XCTest
@testable import RatedList

class ItemListViewModelTests: XCTestCase {

    func testViewModelFetchesItemsSuccessfully() {
    
        //Given
        let exp = expectation(description: "view model fetches items")
        let service = ListServiceImp()
        let viewModel = ItemListViewModelImp(listService: service)
        
        //When
        viewModel.fetchItems { result in
            //Then
            XCTAssert(result, "View Model does not fetch items successfully")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
    }
    
    //TODO: failure case should be tested as well
}
