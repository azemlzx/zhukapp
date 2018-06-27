//
//  Sales.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 27.06.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class Sales: NSObject {

    let name : String?
    let amount : String?
    
    init(nameInit:String?,amountInit:String?) {
        self.name = nameInit
        self.amount = amountInit
    }
}
