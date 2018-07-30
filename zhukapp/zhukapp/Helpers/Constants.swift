//
//  Constants.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 07.05.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class Constants: NSObject {

    static let ApiUrl = "http://172.27.1.7:9000/api/Values"
    static var idSession = ""

}

class ConstantsSession: NSObject {
    
    static var idSession : String = ""
    static var idUserSession :String = ""
    static var nameUserSession :String = ""
    static var positionUser :String = ""
    static var arraySellingData : [Sales] = [Sales]()
    static var arrayReconciliationOfSales : [ReconciliationOfSales] = [ReconciliationOfSales]()
    static var arrayRequstestForMoneySharing : [RequstestForMoneySharing] = [RequstestForMoneySharing]()
//    static var arrayCoordinationData : [CoordinationData]?
}

