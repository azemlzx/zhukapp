//
//  ViewControllerTable.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 25.09.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewControllerTable: UIViewController {

    @IBOutlet weak var tabbarconst: NSLayoutConstraint!
    @IBOutlet weak var menuconst: NSLayoutConstraint!
    
    var menuSwowing =  false
    
    @IBAction func openMenu(_ sender: Any) {
        if (menuSwowing){
            menuconst.constant = 0
        }else{
            menuconst.constant = 200
        }
        menuSwowing = !menuSwowing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
