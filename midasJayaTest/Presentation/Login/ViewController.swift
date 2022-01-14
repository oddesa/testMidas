//
//  ViewController.swift
//  midasJayaTest
//
//  Created by Jehnsen Hirena Kane on 14/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func masukPressed(_ sender: Any) {
        if let email = emailTxtFld.text, let password = passwordTxtFld.text {
            
            if email.isEmpty || password.isEmpty {
                    self.showAlert(title: "Input tidak sesuai", msg: "Tolong isi email dan password untuk masuk")
            } else {
                if DataManager.emailUserData[email] != nil {
                    if DataManager.emailUserData[email]?.password == password {
                        
                        if DataManager.emailUserData[email]?.role == "normal user" {
                            
                            APIRequest.fetchData { response in
                                print(response)
                                DataManager.normalUserData = response as! [APIDataModel]
                                
                                
                                DispatchQueue.main.async {
                                    let alert = UIAlertController(title: "Berhasil login", message: "Selamat anda berhasil login", preferredStyle: .alert)
                                    
                                    let cancelButton = UIAlertAction(title: "Close", style: .destructive, handler: nil)
                                    alert.addAction(cancelButton)
                                    self.present(alert, animated: true, completion: nil)
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    self.navigationController?.pushViewController(UserMainPageTableViewController(), animated: true)
                                }
                            
                            } failCompletion: { error in
                                print(error)
                            }
                        } else {
                            DispatchQueue.main.async {
                                self.navigationController?.pushViewController(AdminMainPageTableViewController(), animated: true)
                            }
                        }
                        
                        
                    } else {
                        self.showAlert(title: "Password salah", msg: "Password yang anda masukan kurang tepat, tolong ketik ulang password anda")
                    }
                } else {
                    self.showAlert(title: "Email salah", msg: "Email yang anda masukan kurang tepat, tolong ketik ulang password anda")
                }
            }
            
            
        
        }
    }
}


extension UIViewController {
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Close", style: .destructive, handler: nil)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
}
