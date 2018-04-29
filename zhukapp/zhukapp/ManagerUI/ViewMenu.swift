//
//  ViewMenu.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 25.04.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewMenu: UIView{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("1")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         print("1")
        return UITableViewCell()
    }
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        print("11")
    }
    
}
