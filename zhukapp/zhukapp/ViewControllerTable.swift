//
//  ViewControllerTable.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 25.09.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewControllerTable: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableViewFirst: UITableView!
    @IBOutlet weak var menuconst: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var tableViewMenu: UITableView!
    
    var menuSwowing =  false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewMenu.dataSource = self
        self.tableViewMenu.delegate = self
        
        self.tableViewFirst.dataSource = self
        self.tableViewFirst.delegate = self
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        tableViewMenu.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var countS : Int = 0
        
        if (tableView == tableViewFirst){
            countS = 10
        }else if (tableView == tableViewMenu){
            countS = 3
        }
        return countS
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == tableViewFirst){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {
                return UITableViewCell()
            }
        }else if (tableView == tableViewMenu){
            guard let cellMenu = tableView.dequeueReusableCell(withIdentifier: "CellMenu") as? MenuCell else {
                return UITableViewCell()
            }
            switch (indexPath.row){
            case 0 : cellMenu.tabnameMenuCell.text = "Продажи"
            case 1 : cellMenu.tabnameMenuCell.text = "Заявки"
            case 2 : cellMenu.tabnameMenuCell.text = "Согласования продаж"
            default:
               cellMenu.tabnameMenuCell.text =  ""
            }
            return cellMenu
            
        }
        return UITableViewCell()
    }
    
    
    @IBAction func openMenu(_ sender: Any) {
        if (menuSwowing){
            menuconst.constant = 0
        }else{
            menuconst.constant = 175
        }
        menuSwowing = !menuSwowing
        
        UIView.animate(withDuration: 0.3, animations:{
            self.view.layoutIfNeeded()
        })
    }
}
