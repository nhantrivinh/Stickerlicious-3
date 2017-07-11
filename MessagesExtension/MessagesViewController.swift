//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Jayven Nhan on 7/9/17.
//  Copyright © 2017 Jayven Nhan. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        
    }
    
    @IBAction func handleChocoholicChanged(_ sender: UISwitch) {
        for vc in childViewControllers {
            if let vc = vc as? Chocoholicable {
                vc.setChocoholic(sender.isOn)
            }
        }
    }
}
