//
//  NewDistanceActivityViewController.swift
//  STracker
//
//  Created by José Cisneros on 03/05/22.
//

import UIKit

class NewDistanceActivityViewController: NewActivityViewController {

    @IBOutlet weak var distancePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        // Do any additional setup after loading the view.
        
    }
    

    override func setTheme() {
        super.setTheme()
        
        distancePickerView.layer.borderWidth = 1
        distancePickerView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1541834951)
        distancePickerView.layer.cornerRadius = 5
        
    }
    

}
