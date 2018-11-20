//
//  ListServiceTests.swift
//  RatedListTests
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import XCTest
@testable import RatedList

class ListServiceTests: XCTestCase {

    let service = ListServiceImp()

    func testServiceFetchesItemsCorrectly() {
        
        //Given
        let exp = expectation(description: "service fetches items")
        
        //When
        service.fetchItems { items in
            //Then
            XCTAssertEqual(items?.count, 18, "ListService does not fetch items correctly")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
    }
    
    //TODO: failure case should be tested as well
}
