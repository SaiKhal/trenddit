//
//  EditProfileViewController.swift
//  trenddit
//
//  Created by MacBook on 2/6/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    @IBOutlet weak var editScreenProfileImage: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfilePicture()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeProfileImage(_ sender: UIButton) {
    }
 
    
    func setupProfilePicture() {
        editScreenProfileImage.layer.cornerRadius = editScreenProfileImage.frame.width/2
    }
}
extension EditProfileViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
    }
}
