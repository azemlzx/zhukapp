//
//  ViewControllerTable.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 08.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerTable: UIViewController,UITableViewDelegate, UITableViewDataSource , DataTableView {

    @IBOutlet weak var menubar: UINavigationItem!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var tableViewFirst: UITableView!
    @IBOutlet weak var menuconst: NSLayoutConstraint!
    @IBOutlet weak var tableViewMenu: UITableView!
    
    
    var menuSwowing =  false
    var indexmenu :Int = 0
    
    var ItemsSelling: [Selling] = []            // Продажи 0
    var ItemsOrder: [Order] = []                // Заявки  1
    var ItemsCoordination: [Coordination] = []  // Согласования продаж 2
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Selling> = Selling.fetchRequest()
        
        do {
            ItemsSelling = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
        self.tableViewFirst.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var countS : Int = 0
        
        if (tableView == tableViewFirst && indexmenu == 0){
            countS = ItemsSelling.count
        }else if(tableView == tableViewFirst && indexmenu == 1){
            countS = ItemsOrder.count
        }else if(tableView == tableViewFirst && indexmenu == 2){
            countS = ItemsCoordination.count
        }else if (tableView == tableViewMenu){
            countS = 3
        }
        return countS
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == tableViewFirst){
           return navigator(indexM : indexmenu,tableView: tableView)
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
    
    
    @IBAction func AddSel(_ sender: Any) {
        let Storybord = UIStoryboard(name: "Main", bundle: nil)
        let myVCTouch = Storybord.instantiateViewController(withIdentifier: "addVC") as! ViewControllerAdd
        myVCTouch.indexmenu = indexmenu
        self.present(myVCTouch, animated: true, completion:nil)
        
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

    func relodeTableView() {
        self.tableViewFirst.reloadData()
    }
}
