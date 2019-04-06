//
//  SecondViewController.swift
//  UnitTestingTableView
//
//  Created by SHILEI CUI on 4/4/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var dataSourceDelegate : TableViewDataSourceDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSourceDelegate = TableViewDataSourceDelegate(dataSource: ["hi1","hi2","hi3","hi4","hi5"])
        
        dataSourceDelegate.clo = { [weak self] in
            self?.myFuncToCheck()
        }
        
        tblView.dataSource = dataSourceDelegate
        tblView.delegate = dataSourceDelegate
    }
    
    func myFuncToCheck(){
        print("check it")
    }
}

//result of Refactoring - making code loose coupled, functionality independent and making code re-usable
