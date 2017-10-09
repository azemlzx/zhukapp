//
//  ViewControllerTable.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 08.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewControllerTable: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var menubar: UINavigationItem!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var tableViewFirst: UITableView!
    @IBOutlet weak var menuconst: NSLayoutConstraint!
    @IBOutlet weak var tableViewMenu: UITableView!
    
    
    var menuSwowing =  false
    var indexmenu :Int = 0
    
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
        self.menubar.title = casestr(indextab: indexmenu)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var countS : Int = 0
        
        if (tableView == tableViewFirst){
            countS = indexmenu + 1
        }else if (tableView == tableViewMenu){
            countS = 3
        }
        return countS
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == tableViewFirst){
            if ((indexPath.row % 2) == 0){
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {
                    return UITableViewCell()
                }
                
                cell.toplabel.text = "Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка"
                cell.textlabel.text = "Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст"
                cell.bottomlabel.text = "Подвал Подвал Подвал Подвал Подвал Подвал Подвал Подвал Подвал Подвал Подвал Подвал"
                cell.bottomlabel.textColor = #colorLiteral(red: 1, green: 0.1862298954, blue: 0.2883357974, alpha: 1)
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellAccept") as? AcceptCell else {
                    return UITableViewCell()
                }
                
                cell.toplabelAc.text = "Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка Шапка"
                cell.textlabelAc.text = "Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст"
                
                return cell
            }
            
        }else if (tableView == tableViewMenu){
            guard let cellMenu = tableView.dequeueReusableCell(withIdentifier: "CellMenu") as? MenuCell else {
                return UITableViewCell()
            }
            cellMenu.tabnameMenuCell.text = casestr(indextab: indexPath.row)
            cellMenu.layer.borderWidth = 1.0
            cellMenu.layer.borderColor = UIColor.gray.cgColor
            return cellMenu
            
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == tableViewFirst){
            if (menuSwowing){
                openMenu("")
            }
            tableViewFirst.deselectRow(at: indexPath, animated:true)
            self.title = casestr(indextab: indexmenu)
            self.menubar.title = casestr(indextab: indexmenu)
        }else if (tableView == tableViewMenu){
            openMenu("")
            indexmenu = indexPath.row
            tableViewMenu.deselectRow(at: indexPath, animated: true)
            tableViewFirst.reloadData()
            self.menubar.title = casestr(indextab: indexmenu)
        }
    }
    
    
    @IBAction func Acceptfunc(_ sender: Any) {
        let alertError = UIAlertController(title: "All", message:  "Acceptfunk", preferredStyle: UIAlertControllerStyle.alert)
        alertError.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertError, animated: true, completion: nil)
    }
    
    @IBAction func Rejectfunc(_ sender: Any) {
        let alertError = UIAlertController(title: "All", message:  "Rejectfunc", preferredStyle: UIAlertControllerStyle.alert)
        alertError.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertError, animated: true, completion: nil)
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
