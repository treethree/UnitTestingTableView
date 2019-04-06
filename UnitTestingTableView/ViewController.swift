//
//  ViewController.swift
//  UnitTestingTableView
//
//  Created by SHILEI CUI on 4/4/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var dataSourceDelegate : TableViewDataSourceDelegate! //it's a strong property by default
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSourceDelegate = TableViewDataSourceDelegate(dataSource: ["hello1","hello2","hello3","hello4","hello5"])
        // conform delete protocal to this viewController class
        dataSourceDelegate.delegate = self
        
        tblView.dataSource = dataSourceDelegate
        tblView.delegate = dataSourceDelegate
        
        //dataSourceDelegate.clo = { ()->Void in
        //[weak self] is says that 
        //closure capture self value.
        //dataSourceDelegate also capture self
        //viewController hold dataSourceDelegate and dataSourceDelegate hold self. it is a strong reference cycle, will cause memory leak
//          dataSourceDelegate.clo = { [weak self] in
//            if let controller = self?.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
//                self?.navigationController?.pushViewController(controller, animated: true)
//            }
//        }
    }

    //muFunc() do two thing! how to test? So we need to refactor the code.
    func myFunc(){
        
        //fetching from server...
        
        //store in db...
        
    }

}

extension ViewController : TableViewRowSelect{
    func didSelect(str: String) {
        print(str)
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

//closure capture value/ref . it's a characteristic of closure and block

//diff between delegate and notofication center
//1. delegate is one-to-one connection, where as notification is one to many.
//More than one class will receive that value we will use notification .

//Coredata migration.
//changing your database structure

//1. light weight migration
//2. heavy weight migration
