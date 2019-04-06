//
//  MockClass.swift
//  UnitTestingTableViewTests
//
//  Created by SHILEI CUI on 4/5/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Foundation
@testable import UnitTestingTableView

//Mock class: (have protocal, using boolean variable to check function is called)
//We create mock view controller to simulate viewController behavior.(conform to protocal and implement method.)
class MockViewController : TableViewRowSelect{
    
    var isCalled = false
    var strValue = ""
    func didSelect(str: String) {
        isCalled = true
        strValue = str
    }
    
}
