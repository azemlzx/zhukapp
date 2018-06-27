//
//  CellSalesView.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 07.05.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class CellSalesView: UITableViewCell {

    @IBOutlet weak var document: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
