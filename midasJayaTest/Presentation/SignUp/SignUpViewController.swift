//
//  SignUpViewController.swift
//  midasJayaTest
//
//  Created by Jehnsen Hirena Kane on 14/01/22.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var roleTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    let possibleRole = ["admin", "normal user"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func daftarPressed(_ sender: Any) {
        if let username = usernameTxtFld.text,
           let email = emailTxtFld.text,
           let role = roleTxtFld.text?.lowercased(),
           let password = passwordTxtFld.text {
           
            if !possibleRole.contains(role){
                self.showAlert(title: "Role tidak sesuai", msg: "Kamu hanya boleh mendaftar sebagai Admin atau Normal User")
            } else {
                DataManager.emailUserData[email] = UserData(id: DataManager.emailUserData.count + 1,
                                                            username: username,
                                                            role: role,
                                                            password: password)
                let alert = UIAlertController(title: "Berhasil mendaftar", message: "Silahkan kembali ke halaman login untuk masuk", preferredStyle: .alert)
                
                let cancelButton = UIAlertAction(title: "Close", style: .destructive) { _ in
                    self.navigationController?.popViewController(animated: true)
                }
                                                 
                alert.addAction(cancelButton)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}
