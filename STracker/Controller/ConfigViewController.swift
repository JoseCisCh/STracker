//
//  ConfigViewController.swift
//  STracker
//
//  Created by José Cisneros on 28/04/22.
//

import UIKit
import ChameleonFramework

class ConfigViewController: AppTheme {

    @IBOutlet weak var verticalStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalStackView.subviews.forEach { hStack in
            if let hStackCasted = hStack as? UIStackView {
                hStackCasted.subviews.forEach { button in
                    if let buttonCasted = button as? UIButton {
                        buttonCasted.layer.cornerRadius = 30
                        buttonCasted.clipsToBounds = true
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        setTheme()
    }
    
    
    
    @IBAction func setNewTheme(_ sender: UIButton) {
        print(sender.backgroundColor!.hexValue()!)
        UserDefaults.standard.set(sender.backgroundColor!.hexValue()! , forKey: "colorTheme")
        
        setTheme()

    }
    

}
