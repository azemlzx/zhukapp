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
        // sing in button
        singinButton.backgroundColor = .clear
        singinButton.layer.cornerRadius = 15
        singinButton.layer.borderWidth = 3
        singinButton.layer.borderColor = UIColor.white.cgColor
        // login textfild
        let imageViewAvatar = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let avatar = UIImage(named: "avatar.png")
        imageViewAvatar.image = avatar
        imageViewAvatar.alpha = 0.4
        loginText.leftView = imageViewAvatar
        loginText.leftViewMode = UITextFieldViewMode.always
        loginText.leftViewMode = .always
        loginText.layer.cornerRadius = 12
        loginText.layer.masksToBounds = true
        loginText.placeholder = "Логін"
        // password textfild
        let imageViewKey = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let key = UIImage(named: "key.png")
        imageViewKey.image = key
        imageViewKey.alpha = 0.4
        passwordText.leftView = imageViewKey
        passwordText.leftViewMode = UITextFieldViewMode.always
        passwordText.leftViewMode = .always
        passwordText.layer.cornerRadius = 12
        passwordText.layer.masksToBounds = true
        passwordText.placeholder = "Пароль"
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

