//
//  ViewController.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 16.09.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func singIn(_ sender: Any) {
        let Storybord = UIStoryboard(name: "Main", bundle: nil)
        let myVCTouch = Storybord.instantiateViewController(withIdentifier: "tableVC")
        self.present(myVCTouch, animated: true, completion:nil)
        
    }
    
}

