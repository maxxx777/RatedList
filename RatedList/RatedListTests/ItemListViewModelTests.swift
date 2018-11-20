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

    let service = ListServiceImp()
    var viewModel: ItemListViewModel!
    
    override func setUp() {
        super.setUp()
        
         viewModel = ItemListViewModelImp(listService: service)
    }
    
    func testViewModelFetchesItemsSuccessfully() {
    
        //Given
        let exp = expectation(description: "view model fetches items")
        
        //When
        viewModel.fetchItems { result in
            //Then
            XCTAssert(result, "View Model does not fetch items successfully")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
    }
    
    //TODO: failure case should be tested as well
    
    //TODO: case with number of items before fetch should be tested as well
    
    func testViewModelReturnsCorrectNumberOfItemsAfterFetch() {
        
        //Given
        let exp = expectation(description: "view model fetches items")
        
        //When
        viewModel.fetchItems { result in
            //Then
            XCTAssertEqual(self.viewModel.numberOfItems(), 18, "View Model returns wrong number of items")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
    }
    
    //TODO: case with cell view model before fetch should be tested as well
    
    func testViewModelReturnsCorrectCellViewModelAfterFetch() {
        
        //Given
        let exp = expectation(description: "view model fetches items")
        
        //When
        viewModel.fetchItems { result in
            //Then
            XCTAssertNotNil(self.viewModel.cellViewModel(at:0), "View Model returns wrong cell view model")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
    }
}
