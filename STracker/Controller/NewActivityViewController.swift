//
//  NewActivityViewController.swift
//  STracker
//
//  Created by José Cisneros on 30/04/22.
//

import Foundation
import UIKit
import ChameleonFramework

class NewActivityViewController: AppTheme {
    
    var activityCategory: ActivityCategory = .workout
    
    @IBOutlet weak var activityNameLabel: UITextField!
    @IBOutlet weak var descriptionView: UIView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var timePickerView: UIView!
    @IBOutlet weak var addActivityButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleViewTap))
        view.addGestureRecognizer(tap)
        
        print(activityCategory)
    }
    
    override func setTheme() {
        super.setTheme()
        
        let elementsBackgroundColor = ComplementaryFlatColorOf(color: UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme")) ?? UIColor(hexString: "#005f73"))
        let contrastLetterColor = ContrastColorOf(backgroundColor: elementsBackgroundColor, returnFlat: true)
        activityNameLabel.delegate = self


        descriptionView.layer.borderWidth = 1
        descriptionView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1541834951)
        descriptionView.layer.cornerRadius = 5

        timePickerView.layer.borderWidth = 1
        timePickerView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1541834951)
        timePickerView.layer.cornerRadius = 5

        addActivityButton.backgroundColor = elementsBackgroundColor
        addActivityButton.layer.cornerRadius = 5
        addActivityButton.tintColor = contrastLetterColor
        
    }
    
    @objc func handleViewTap() {
        descriptionTextView.resignFirstResponder()
    }
    
}

extension NewActivityViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}


