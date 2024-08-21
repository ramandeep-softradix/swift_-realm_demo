//
//  LoginVC.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtFld_Email: UITextField!
    @IBOutlet weak var txtFld_Password: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    var loginVM = LoginVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupUi(){
        btnLogin.layer.cornerRadius = 15

    }
    
    @IBAction func btnLoginAction(_ sender: Any) {
        guard let email = txtFld_Email.text, !email.isEmpty else {
            Utils.showAlert(message: "Please enter your email.", in: self)
            return
        }
        
        guard let password = txtFld_Password.text, !password.isEmpty else {
            Utils.showAlert(message: "Please enter your password.", in: self)
            return
        }
        
        let result = loginVM.login(email: email, password: password)
        switch result {
        case .success(let user):
            Utils.showAlert(
                title: "Success",
                message: "Login successful!",
                in: self
            ) {
                UserSession.shared.setLoggedIn(true)
                let controller = HomeVC.instantiate(fromAppStoryboard: .Home)
                self.navigationController?.pushViewController(controller, animated: true)
                
            }

        case .failure(let error):
            Utils.showAlert(message: error.localizedDescription, in: self)
        }
        
        
    }
    
    @IBAction func btnSignUpAction(_ sender: Any) {
        let controller = SignUpVC.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(controller, animated: true)

    }
}
