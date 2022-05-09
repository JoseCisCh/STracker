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
    }
    
    override func setTheme() {
        super.setTheme()
        
        let elementsBackgroundColor = ComplementaryFlatColorOf(color: UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme")) ?? UIColor(hexString: "#005f73"))
        let contrastLetterColor = ContrastColorOf(backgroundColor: elementsBackgroundColor, returnFlat: true)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        
        activityNameLabel.delegate = self
        descriptionTextView.delegate = self
        
        let descriptionViewBlurEffectView = UIVisualEffectView(effect: blurEffect)
        descriptionViewBlurEffectView.frame = descriptionView.bounds
        descriptionViewBlurEffectView.alpha = 0.25
        descriptionViewBlurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        descriptionView.clipsToBounds = true
        descriptionView.layer.cornerRadius = 8
        descriptionView.addSubview(descriptionViewBlurEffectView)
        descriptionView.sendSubviewToBack(descriptionViewBlurEffectView)
        
        let timePickerBlurEffectView = UIVisualEffectView(effect: blurEffect)
        timePickerBlurEffectView.frame = timePickerView.bounds
        timePickerBlurEffectView.alpha = 0.25
        timePickerBlurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        timePickerView.clipsToBounds = true
        timePickerView.layer.cornerRadius = 8
        timePickerView.addSubview(timePickerBlurEffectView)
        timePickerView.sendSubviewToBack(timePickerBlurEffectView)

        
        addActivityButton.backgroundColor = elementsBackgroundColor
        addActivityButton.layer.cornerRadius = 8
        addActivityButton.tintColor = contrastLetterColor

    }
    
    func checkForMissingData() -> UIAlertController? {
        return nil
    }
    
    @objc func handleViewTap() {
        descriptionTextView.resignFirstResponder()
    }
    
    func popTwoViewControllers() {
        if let viewControllers: [UIViewController] = navigationController?.viewControllers {
            self.navigationController?.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
        }
        
    }
    
}

extension NewActivityViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}

//MARK: - TextViewDelegate

extension NewActivityViewController: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        textView.text = ""
        return true
    }
}


