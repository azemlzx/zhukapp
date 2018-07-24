//
//  ReconciliationOfSales.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 30.06.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

struct ObjectsArray: Codable {
    let data: [ObjectData]
}

struct ObjectData: Codable {
    let Nomer: String
    let Data: String
    let Initiator: String
    let Сomment: String
    let Object: SubObject
}

struct SubObject: Codable {
    let Name: String
    let Amount: Int
    let Price: Float
    let AmountFull: Float
    let DiscountAmount: Float
}



