//
//  DataClass.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 07.05.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class SellingData: NSObject {
    let document : String?
    let amount : String?
    
    init(documentOut:String,amountOut:String) {
        self.document = documentOut
        self.amount = amountOut
    }
}

class OrderData: NSObject {
    
}

class CoordinationData: NSObject {
    
}

