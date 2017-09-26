//
//  ViewControllerTable.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 25.09.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewControllerTable: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var menuconst: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    
    var menuSwowing =  false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //guard (tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell) != nil else {
            return UITableViewCell()
        //}
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
