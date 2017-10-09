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
    
    var indexmenu :Int = 0
    var ItemsOrder: [Order] = []
    var ItemsCoordination: [Coordination] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func exittoVC(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if (indexmenu == 1){
        
            let entity = NSEntityDescription.entity(forEntityName: "Order", in: context)
            let OrderObject = NSManagedObject(entity: entity!, insertInto: context) as! Order
            OrderObject.statusO = 0
            OrderObject.textO = textVC.text!
            OrderObject.titleO = Shap.text!
            OrderObject.sum = Float(sumVC.text!)!
            
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
            CoordinationObject.statusC = 0
            CoordinationObject.textC = textVC.text!
            CoordinationObject.titleC = Shap.text!
            CoordinationObject.sum = Float(sumVC.text!)!
            
            do {
                try context.save()
                ItemsCoordination.append(CoordinationObject)
                print("Saved! Good Job!")
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
