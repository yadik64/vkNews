//
//  AuthorizationController.swift
//  VkNews
//
//  Created by Дмитрий Яровой on 25/06/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class AuthorizationController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var sendUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFieldDelegate()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func sendUp(_ sender: UIButton) {
        if checkUserData() {
            performSegue(withIdentifier: "sendUpSegue", sender: self)
        } else {
            authorizationError()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "sendUpSegue" else { return }
        
        
    }
    
    private func authorizationError() {
        let alert = UIAlertController(title: "Error", message: "Not a valid login or password", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .cancel) { (action) in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
            self.loginTextField.becomeFirstResponder()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func checkUserData() -> Bool {
        guard let login = loginTextField.text,
            let password = passwordTextField.text else { return false}
        
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    @objc func keybordWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo! as NSDictionary
        guard let kbSize = (userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size else { return }
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keybordWillHide() {
        let contentInsets = UIEdgeInsets.zero
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeybord() {
        scrollView?.endEditing(true)
    }
    
    private func setTextFieldDelegate() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }

}

extension AuthorizationController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.loginTextField:
            passwordTextField.becomeFirstResponder()
        case self.passwordTextField:
            sendUp(self.sendUpButton)
        default:
            break
        }
        return true
    }
}
