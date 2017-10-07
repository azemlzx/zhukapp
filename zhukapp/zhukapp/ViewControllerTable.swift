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
    var indexmenu :Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMenu.dataSource = self
        tableViewMenu.delegate = self
        
        tableViewFirst.dataSource = self
        tableViewFirst.delegate = self
        
        tableViewMenu.estimatedRowHeight = 60
        tableViewMenu.rowHeight = UITableViewAutomaticDimension
        
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
            if indexmenu == nil{
                countS = 0
            }else{
                countS = indexmenu! + 1
            }
            
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
            if indexmenu == nil{
                return UITableViewCell()
            }
            cell.bottomlabel.text = "Подвал"
            cell.textlabel.text = "Текст"
            cell.toplabel.text = "Шапка"
            
            return cell
            
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
            cellMenu.layer.borderWidth = 1.0
            cellMenu.layer.borderColor = UIColor.gray.cgColor
            return cellMenu
            
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == tableViewFirst){
           tableViewFirst.deselectRow(at: indexPath, animated:true)
        }else if (tableView == tableViewMenu){
            openMenu("")
            indexmenu = indexPath.row
            tableViewMenu.deselectRow(at: indexPath, animated: true)
            tableViewFirst.reloadData()
        }
        
    }
    
    @IBAction func openMenu(_ sender: Any) {
        if (menuSwowing){
            menuconst.constant = 0
        }else{
            menuconst.constant = 200
        }
        menuSwowing = !menuSwowing
        
        UIView.animate(withDuration: 0.3, animations:{
            self.view.layoutIfNeeded()
        })
    }
}
