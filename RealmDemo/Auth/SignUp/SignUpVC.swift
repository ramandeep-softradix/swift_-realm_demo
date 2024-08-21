//
//  SignUpVC.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var txtFld_Name: UITextField!
    @IBOutlet weak var txtFld_Email: UITextField!
    @IBOutlet weak var txtFld_Password: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    var signUpVM = SignUpVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupUi() {
        btnSignUp.layer.cornerRadius = 15
    }
    
    
    @IBAction func btnSignUpAction(_ sender: Any) {
        guard let name = txtFld_Name.text, !name.isEmpty else {
            Utils.showAlert(message: "Please enter your name.", in: self)
            return
        }
        
        guard let email = txtFld_Email.text, !email.isEmpty else {
            Utils.showAlert(message: "Please enter your email.", in: self)
            return
        }
        
        guard let password = txtFld_Password.text, !password.isEmpty else {
            Utils.showAlert(message: "Please enter your password.", in: self)
            return
        }
        
        let result = signUpVM.signUp(name: name, email: email, password: password)
        switch result {
        case .success(let user):
            Utils.showAlert(
                title: "Success",
                message: "Sign up successful! Welcome, \(user.name).",
                in: self
            ) {
                self.navigationController?.popViewController(animated: true)
            }
            
        case .failure(let error):
            Utils.showAlert(message: error.localizedDescription, in: self)
        }
    }
    
    @IBAction func btnLoginAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
