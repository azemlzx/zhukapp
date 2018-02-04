//
//  ViewController.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 08.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var singinButton: UIButton!
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center

        // sing in button
        singinButton.backgroundColor = .clear
        singinButton.layer.cornerRadius = 15
        singinButton.layer.borderWidth = 3
        singinButton.layer.borderColor = UIColor.white.cgColor
        // login textfild
        loginText.layer.cornerRadius = 12
        loginText.layer.masksToBounds = true
        let attributedPlaceholderLogin = NSAttributedString(string: "Логін", attributes: [NSAttributedStringKey.paragraphStyle: centeredParagraphStyle])
        loginText.attributedPlaceholder = attributedPlaceholderLogin
        // password textfild
         let attributedPlaceholderPassword = NSAttributedString(string: "Пароль", attributes: [NSAttributedStringKey.paragraphStyle: centeredParagraphStyle])
        passwordText.layer.cornerRadius = 12
        passwordText.layer.masksToBounds = true
        passwordText.attributedPlaceholder = attributedPlaceholderPassword
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

