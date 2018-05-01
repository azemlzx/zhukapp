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
    // MARK: - Outlet
    @IBOutlet weak var menubar: UINavigationItem!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var tableViewFirst: UITableView!
    @IBOutlet weak var tableViewMenu: UITableView!
    @IBOutlet weak var logOut: UIButton!
    
    // MARK: - Cons
    @IBOutlet weak var menunavbar: NSLayoutConstraint!
    @IBOutlet weak var menuconst: NSLayoutConstraint!
    @IBOutlet weak var menutabconst: NSLayoutConstraint!
    
    // MARK: - Image
    @IBOutlet weak var imageViev: UIImageView!
    
    // MARK: - Label
    @IBOutlet weak var PositionLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    
    var menuSwowing =  true
    var indexmenu :Int = 0
    
    var ItemsSelling: [Selling] = []            // Продажи 0
    var ItemsOrder: [Order] = []                // Заявки  1
    var ItemsCoordination: [Coordination] = []  // Согласования продаж 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openMenu("")
        
        
        tableViewMenu.tableFooterView = UIView.init(frame: CGRect.zero)
        imageViev.image = UIImage(named:"no-photo avatar")
        
        NameLabel.text = "Олександр Землянський"
        PositionLabel.text = "Програміст 1с"
        
        logOut.backgroundColor = .clear
        logOut.layer.cornerRadius = 15
        logOut.layer.borderWidth = 2
        logOut.layer.borderColor = UIColor.white.cgColor
        
        self.menubar.title = casestr(indextab: indexmenu)
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
        }else if(tableView == tableViewMenu){
            countS = 3
        }
        return countS
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == tableViewFirst){
            return navigator(indexM : indexmenu , indexrow: indexPath.row , tableView: tableView)
        }else if (tableView == tableViewMenu){
            return navigatorMenu(indexrow: indexPath.row , tableView: tableView)
        }else{
           return UITableViewCell()
        }
    }
    public func tableView(_ tableView:UITableView, editActionsForRowAt indexPath: IndexPath) -> [ UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title:"Delete")
        { (action, indexPath)  in
            self.deleteforArray(indextab : indexPath.row)
            self.tableViewFirst.deleteRows(at: [indexPath] , with: .fade)
        }
        delete.backgroundColor = .red
        
        return [delete]
        
        
    }
    

    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == tableViewFirst){
            if (menuSwowing){
                openMenu("")
            }
            tableViewFirst.deselectRow(at: indexPath, animated : true)
            self.title = casestr(indextab: indexmenu)
            self.menubar.title = casestr(indextab: indexmenu)
        }else if (tableView == tableViewMenu){
            indexmenu = indexPath.row
            tableViewMenu.deselectRow(at: indexPath, animated : true)
            self.title = casestr(indextab: indexmenu)
            self.menubar.title = casestr(indextab: indexmenu)
            if (menuSwowing){
                openMenu("")
            }
            
        }
    }
    

    @IBAction func LogOut(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
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
    
    func deleteforArray(indextab : Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if(indexmenu == 0){
            context.delete(self.ItemsSelling[indextab])
        }else if (indexmenu == 1){
            context.delete(self.ItemsOrder[indextab])
        }else if(indexmenu == 2){
            context.delete(self.ItemsCoordination[indextab])
        }
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        if (menuconst.constant == 200) {
            openMenu("")
        }
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        if (menuconst.constant == 0) {
            openMenu("")
        }
        
    }
    
    @IBAction func TapSwipe(_ sender: UITapGestureRecognizer) {
        if (menuconst.constant == 200) {
            openMenu("")
        }
    }
}
