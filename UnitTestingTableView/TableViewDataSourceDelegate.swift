//
//  TableViewDataSourceDelegate.swift
//  UnitTestingTableView
//
//  Created by SHILEI CUI on 4/4/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit
typealias closureNav = () -> Void

//this delegate protocal is to pass the control to view controller
protocol TableViewRowSelect{
    func didSelect(str : String)
}

class TableViewDataSourceDelegate: NSObject, UITableViewDataSource {
    
    var dataSource = [String]()
    
    var clo : closureNav?
    //using protocal to navigate to next viewController
    var delegate : TableViewRowSelect?

    init(dataSource : [String]) {
        
        self.dataSource = dataSource
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
    
    
}

extension TableViewDataSourceDelegate : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1 .how to navigate to other view controller from first view controller
        //clo?()
        delegate?.didSelect(str: dataSource[indexPath.row])
        print(dataSource[indexPath.row])
    }
    
}

//Mocking a class
