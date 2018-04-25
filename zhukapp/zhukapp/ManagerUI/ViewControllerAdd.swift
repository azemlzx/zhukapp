//
//  ViewControllerAdd.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 09.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerAdd: UIViewController {

    @IBOutlet weak var Shap: UITextField!
    @IBOutlet weak var sumVC: UITextField!
    @IBOutlet weak var textVC: UITextField!
    var delegate : DataTableView?
    
    var indexmenu :Int = 0
    
    var ItemsSelling: [Selling] = []            // Продажи 0
    var ItemsOrder: [Order] = []                // Заявки  1
    var ItemsCoordination: [Coordination] = []  // Согласования продаж 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func exittoVC(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if(indexmenu == 0){
            let entity = NSEntityDescription.entity(forEntityName: "Selling", in: context)
            let SellingObject = NSManagedObject(entity: entity!, insertInto: context) as! Selling
            
            SellingObject.sum = NSString(string: sumVC.text!).doubleValue
            SellingObject.textstr = textVC.text!
            SellingObject.title = Shap.text!
            
            do {
                try context.save()
                ItemsSelling.append(SellingObject)
            } catch {
                print(error.localizedDescription)
            }
        }else if (indexmenu == 1){
        
            let entity = NSEntityDescription.entity(forEntityName: "Order", in: context)
            let OrderObject = NSManagedObject(entity: entity!, insertInto: context) as! Order
            OrderObject.status = 0
            OrderObject.textstr = textVC.text!
            OrderObject.title = Shap.text!
            OrderObject.sum = NSString(string: sumVC.text!).doubleValue
            
            do {
                try context.save()
                ItemsOrder.append(OrderObject)
                print("Saved! Good Job!")
            } catch {
                print(error.localizedDescription)
            }
        }else if (indexmenu == 2){
            let entity = NSEntityDescription.entity(forEntityName: "Coordination", in: context)
            let CoordinationObject = NSManagedObject(entity: entity!, insertInto: context) as! Coordination
            CoordinationObject.status = 0
            CoordinationObject.textstr = self.textVC.text!
            CoordinationObject.title = Shap.text!
            CoordinationObject.sum = NSString(string: sumVC.text!).doubleValue
            
            do {
                try context.save()
                ItemsCoordination.append(CoordinationObject)
                print("Saved! Good Job!")
            } catch {
                print(error.localizedDescription)
            }
            
        }
        delegate?.relodeTableView()
        self.dismiss(animated: true, completion: nil)
    }
    

}
