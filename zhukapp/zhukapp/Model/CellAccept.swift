//
//  CellAccept.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 16.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit

typealias HandlerActionButtonTapCompletion = ((_ Accept: Int) -> ())

class CellAccept: UITableViewCell {
    
    var handlerActionButtonTapCompletion: HandlerActionButtonTapCompletion?
    
    @IBOutlet weak var toplabel: UILabel!
    @IBOutlet weak var textlabel: UILabel!
    
    @IBAction func handlerAcceptbutton(_ sender: UIButton) {
        handlerActionButtonTapCompletion!(1)
    }
        
    @IBAction func handlerRejectButton(_ sender: UIButton) {
        handlerActionButtonTapCompletion!(2)
    }
}
