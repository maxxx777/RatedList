//
//  ItemCellViewModelTests.swift
//  RatedListTests
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import XCTest
@testable import RatedList

class ItemCellViewModelTests: XCTestCase {

    func testCellViewModelReturnsTitleCorrectly() {
        
        //Given
        let item = Item(itemId: 1,
                        name: "test name")
        
        //When
        let cellViewModel = ItemCellViewModelImp(item: item)
        
        //Then
        XCTAssertEqual(cellViewModel.title, "test name", "Cell view model returns wrong title")
    }
    
    func testCellViewModelReturnsRatingTextCorrectly() {
        
        //Given
        let item = Item(itemId: 1,
                        name: "test name")
        var cellViewModel = ItemCellViewModelImp(item: item)
        
        //When
        cellViewModel.rating = 5
        
        //Then
        XCTAssertEqual(cellViewModel.ratingValue, 5, "Cell view model returns wrong rating value")
    }
}
