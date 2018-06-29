//
//  ViewController.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 08.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var singinButton: UIButton!
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
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
        loginText.textAlignment = NSTextAlignment.center
        loginText.delegate = self
        // password textfild
         let attributedPlaceholderPassword = NSAttributedString(string: "Пароль", attributes: [NSAttributedStringKey.paragraphStyle: centeredParagraphStyle])
        passwordText.layer.cornerRadius = 12
        passwordText.layer.masksToBounds = true
        passwordText.attributedPlaceholder = attributedPlaceholderPassword
        passwordText.textAlignment = NSTextAlignment.center
        passwordText.delegate = self
        // indicator
        activityIndicator.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func HandlerLogin(alert: UIAlertAction!) {
        loginText.text = nil
    }
    func HandlerPass(alert: UIAlertAction!) {
        passwordText.text = nil
    }
    
    func HandlerLogPass(alert: Any) {
        loginText.text = nil
        passwordText.text = nil
    }
    
    @IBAction func singIn(_ sender: Any) {
        
        guard let login = loginText.text else {
            let acLog = UIAlertController(title: "Error", message: "Помилка логін", preferredStyle: UIAlertControllerStyle.alert)
            let acActionLogin = UIAlertAction(title: "OK", style: .default , handler: HandlerLogin)
            acLog.addAction(acActionLogin)
            present(acLog,animated: true,completion: nil)
            return
        }
        
        guard let password = passwordText.text else {
            let acPass = UIAlertController(title: "Error", message: "Помилка паролю", preferredStyle: UIAlertControllerStyle.alert)
            let acActionPass = UIAlertAction(title: "OK", style: .default , handler: HandlerPass)
            acPass.addAction(acActionPass)
            present(acPass,animated: true,completion: nil)
            return
        }
        
        activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        authorization(User: login, Password: password, completion: {
            Authorization,UserKod,idSession in
            
            if (Authorization) {
                ConstantsSession.nameUserSession = login
                ConstantsSession.idSession = idSession!
                ConstantsSession.idUserSession = UserKod!
                getSales(userKod: ConstantsSession.idUserSession, completion: { (completionUpdate) in
                    DispatchQueue.main.async(execute: {
                        self.activityIndicator.isHidden = true
                        self.activityIndicator.stopAnimating()
                        self.HandlerLogPass(alert: "")
                        let Storybord = UIStoryboard(name: "Main", bundle: nil)
                        let myVCTouch = Storybord.instantiateViewController(withIdentifier: "tableVC")
                        self.present(myVCTouch, animated: true, completion:nil)
                    })
                })
            }else{
                DispatchQueue.main.async(execute: {
                    let ac = UIAlertController(title: "Error", message: "Помилка логіна або пароля", preferredStyle: UIAlertControllerStyle.alert)
                    let acAction = UIAlertAction(title: "OK", style: .default , handler: self.HandlerLogPass)
                    ac.addAction(acAction)
                    self.present(ac,animated: true,completion: nil)
                })
            }
        })
    }
}

