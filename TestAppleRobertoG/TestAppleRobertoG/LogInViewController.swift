//
//  LogInViewController.swift
//  TestAppleRobertoG
//
//  Created by Dragon on 01/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var user: User?
    //JUST FOR TESTING USER AND PASSWORD
    let userName = "Apple"
    let password = "admin"


    override func viewDidLoad() {
        super.viewDidLoad()

        self.user = User()

        userTextField.delegate = self
        passwordTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        passwordTextField.text = ""
    }

    @IBAction func logButtonAction(_ sender: UIButton) {

        
        self.user?.name = userTextField.text
        self.user?.password = passwordTextField.text

        
        if self.user?.name != "" && self.user?.name != nil {
            
            if self.user?.name == userName {
                
                if self.user?.password != "" && self.user?.password != nil {
                    
                    if self.user?.password == password {
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoviesViewController") as! MoviesViewController
                        
                        self.navigationController?.pushViewController(nextViewController, animated: true)

                        
                    } else {
                        // Alert Wrong password
                        alertGeneral(errorDescrip: "Wrong Password", information: "Information")
                    }
                    
                } else {
                    
                    // Alert fill password
                    alertGeneral(errorDescrip: "Fill your password", information: "Information")

                }

            } else {
                // Alert Wrong user
                alertGeneral(errorDescrip: "Wrong User", information: "Information")

            }
        } else {
        
        // Alert fill user
            alertGeneral(errorDescrip: "Fill User ", information: "Information")

        }
    
    }
    
    // MARK - Func return keyboard
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    // MARK: Alerts
    func alertGeneral(errorDescrip:String, information: String) {
        
        
        let alertGeneral = UIAlertController(title: information, message: errorDescrip, preferredStyle: .alert)
        
        let aceptAction = UIAlertAction(title: "OK", style: .default)
        
        alertGeneral.addAction(aceptAction)
        present(alertGeneral, animated: true)
        
        
    }
    

    
}
