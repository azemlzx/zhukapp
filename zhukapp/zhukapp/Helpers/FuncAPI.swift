//
//  func.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 07.05.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit


func encodingJSONServer(aString:String) -> String {
    var strEncoded : String = aString.replacingOccurrences(of:"\\", with: "")
    strEncoded = strEncoded.replacingOccurrences(of:"rnt", with: "")
    strEncoded = strEncoded.replacingOccurrences(of:"rn", with: "")
    strEncoded = strEncoded.replacingOccurrences(of:"t\\", with: "")
    strEncoded.removeFirst()
    strEncoded.removeLast()
    return strEncoded
}

