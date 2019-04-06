//
//  TableViewBDDTest.swift
//  UnitTestingTableViewTests
//
//  Created by SHILEI CUI on 4/4/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Quick
import Nimble
@testable import UnitTestingTableView

class TableViewBDDTest: QuickSpec {
    var tableViewDatSourceDelegate: TableViewDataSourceDelegate!
    override func spec() {
        super.spec()
        beforeEach {
            let stubData = ["apple","banana","orange","grape"]
            self.tableViewDatSourceDelegate = TableViewDataSourceDelegate(dataSource: stubData)
        }
        afterEach {
            self.tableViewDatSourceDelegate = nil
        }
        
        describe("Table View") {
            context("Number of Section"){
                it("Should be 1") {
                    let tableView = UITableView()
                    let sections = self.tableViewDatSourceDelegate.numberOfSections(in: tableView)
                    expect(sections).to(equal(1))
                    
                }
            }
            
            context("Number of Rows in Section"){
                it("Should be 4") {
                    let tableView = UITableView()
                    let rows = self.tableViewDatSourceDelegate.tableView(tableView, numberOfRowsInSection: 0)
                    expect(rows).to(equal(4))
                    
                }
            }
        }
        
        

        
    }
}

