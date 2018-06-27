//
//  strJson.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 07.05.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import Foundation
import UIKit


struct AuthorizationResponse : Codable {
    let Authorization : Bool
    let UserKod : String?
    let Token : String?
    let ErrorCode : String?
    let ErrorString : String?
}

struct UserDataResponse : Codable {
    let Position : String?
}

struct SalesResponse : Codable {
    let documentReport: String?
    let documentCheck: String
}
