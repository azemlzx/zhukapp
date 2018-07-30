//
//  RequstestForMoneySharingJSON.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 29.07.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

struct ObjectRequstMoney: Codable {
    let data: [ObjectDataRequstMoney]
}

struct ObjectDataRequstMoney: Codable {
    let Nomer: String
    let Data: String
    let Recipient: String
    let PaymentForm: String
    let Currency: String
    let DocumentAmount: Float
    let Description: String
    let Сomment: String
}
