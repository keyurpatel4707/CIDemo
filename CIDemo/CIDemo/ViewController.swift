//
//  ViewController.swift
//  CIDemo
//
//  Created by Keyur Patel on 28/12/19.
//  Copyright © 2019 3Embed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- IBOutlets -
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CIDemo"
        // Do any additional setup after loading the view.
    }


    @IBAction func loginButtonAction(_ sender: Any) {
        
    }
}
