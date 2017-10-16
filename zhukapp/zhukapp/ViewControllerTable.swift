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
    @IBOutlet weak var tableViewMenu: UITableView!
    
    
    @IBOutlet weak var menunavbar: NSLayoutConstraint!
    @IBOutlet weak var menuconst: NSLayoutConstraint!
    @IBOutlet weak var menutabconst: NSLayoutConstraint!
    
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
        self.tableViewMenu.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        self.tableViewMenu.separatorColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var countS : Int = 0
        
        if (tableView == tableViewFirst && indexmenu == 0){
            relodeArray(indexmenu:indexmenu)
            countS = ItemsSelling.count
        }else if(tableView == tableViewFirst && indexmenu == 1){
            relodeArray(indexmenu:indexmenu)
            countS = ItemsOrder.count
        }else if(tableView == tableViewFirst && indexmenu == 2){
            relodeArray(indexmenu:indexmenu)
            countS = ItemsCoordination.count
        }else if (tableView == tableViewMenu){
            countS = 3
        }
        return countS
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == tableViewFirst){
            return navigator(indexM : indexmenu , indexrow: indexPath.row , tableView: tableView)
        }else if (tableView == tableViewMenu){
            guard let cellMenu = tableView.dequeueReusableCell(withIdentifier: "CellMenu") as? MenuCell else {
                return UITableViewCell()
            }
            cellMenu.tabnameMenuCell.text = casestr(indextab: indexPath.row)
            cellMenu.imageView?.image = caseimg(indextab: indexPath.row)
            cellMenu.imageView?.tintColor = UIColor.white
            //cellMenu.layer.borderWidth = 0.4
            //cellMenu.layer.borderColor = UIColor.white.cgColor
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
            self.menubar.title = casestr(indextab: indexmenu)
            self.tableViewFirst.reloadData()
            
        }
    }
    
    @IBAction func AddSel(_ sender: Any) {
        let Storybord = UIStoryboard(name: "Main", bundle: nil)
        let myVCTouch = Storybord.instantiateViewController(withIdentifier: "addVC") as! ViewControllerAdd
        myVCTouch.indexmenu = indexmenu
        myVCTouch.delegate = self
        self.present(myVCTouch, animated: true, completion:nil)
    }
    
    
    @IBAction func openMenu(_ sender: Any) {
        if (menuSwowing){
            menuconst.constant = 0
            menunavbar.constant = 0
            menutabconst.constant = 0
        }else{
            menuconst.constant = 200
            menunavbar.constant = 200
            menutabconst.constant = 200
        }
        menuSwowing = !menuSwowing
        
        UIView.animate(withDuration: 0.3, animations:{
            self.view.layoutIfNeeded()
        })
    }

    func relodeTableView() {
        self.tableViewFirst.reloadData()
    }
    
    func relodeArray(indexmenu:Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if (indexmenu == 0){
            let fetchRequest: NSFetchRequest<Selling> = Selling.fetchRequest()
            
            do {
                ItemsSelling = try context.fetch(fetchRequest)
            } catch {
                print(error.localizedDescription)
            }
        }else if (indexmenu == 1){
            let fetchRequest: NSFetchRequest<Order> = Order.fetchRequest()
            
            do {
                ItemsOrder = try context.fetch(fetchRequest)
            } catch {
                print(error.localizedDescription)
            }
        }else if (indexmenu == 2){
            let fetchRequest: NSFetchRequest<Coordination> = Coordination.fetchRequest()
            
            do {
                ItemsCoordination = try context.fetch(fetchRequest)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
