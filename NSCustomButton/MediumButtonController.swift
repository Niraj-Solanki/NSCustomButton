//
//  MediumButtonController.swift
//  NSCustomButton
//
//  Created by Neeraj Solanki on 22/06/21.
//

import UIKit

class MediumButtonController: UIViewController {
    @IBOutlet weak var loadingButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func lodingButtonAction(_ sender: CustomButton) {
        
        sender.isShowLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            sender.isShowLoading = false
        }
    }
    
}

