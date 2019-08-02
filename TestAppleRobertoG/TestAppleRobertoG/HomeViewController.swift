//
//  HomeViewController.swift
//  TestAppleRobertoG
//
//  Created by Dragon on 01/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var user: User?
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let user = user?.name else {return}
        
        self.userNameLabel.text = user

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        leadingConstraint.constant = -170
        menuShowing = false


    }
    
    
    @IBAction func showButtonAction(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoviesViewController") as! MoviesViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    
    @IBAction func sideMenuButtonAction(_ sender: UIButton) {
        
        if menuShowing {
            leadingConstraint.constant = -170
            
            UIView.animate(withDuration: 0.2, animations:{
                
                self.view.layoutIfNeeded()
                
            })


        } else {
        
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.2, animations:{
                
                self.view.layoutIfNeeded()
            
            })

        }
        menuShowing = !menuShowing
    }
}
