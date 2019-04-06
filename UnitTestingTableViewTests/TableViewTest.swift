//
//  TableViewTest.swift
//  UnitTestingTableViewTests
//
//  Created by SHILEI CUI on 4/4/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import XCTest
@testable import UnitTestingTableView

class TableViewTest: XCTestCase {

    var tableViewDatSourceDelegate: TableViewDataSourceDelegate!
    override func setUp() {
        let stubData = ["test1","test2","test3"]
        tableViewDatSourceDelegate = TableViewDataSourceDelegate(dataSource: stubData)
    }

    override func tearDown() {
        tableViewDatSourceDelegate = nil
    }
    
    func testNumberOfSection(){
        let tableView = UITableView()
        let sections = tableViewDatSourceDelegate.numberOfSections(in: tableView)
        XCTAssert(sections == 1 , "There must be only 1 section")
    }
    
    func testTableViewRows(){
        let tableView = UITableView()
        //numberOfRowsInSection by default is 0 row in 1 section
        let rows = tableViewDatSourceDelegate.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssert(rows == 3 , "expected number of rows should be 3")
    }
    
    func testTableViewDidSelect(){
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        //important way to create mock object need to remember
        let mockObj = MockTableViewDataSourceDelegate()
        tableViewDatSourceDelegate.delegate = mockObj
        
        tableViewDatSourceDelegate.tableView(tableView, didSelectRowAt: indexPath)
        XCTAssert(mockObj.isCalled == true, "It should true")
        XCTAssert(mockObj.strValue == "test1", "It should true")
    }

}
