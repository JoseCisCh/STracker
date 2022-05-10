//
//  NewDistanceActivityViewController.swift
//  STracker
//
//  Created by José Cisneros on 03/05/22.
//

import UIKit
import SwiftUI

class NewDistanceActivityViewController: NewActivityViewController {

    var distanceFormats : [String] = ["meters", "km", "miles", "ft", "In"]
    
    
    @IBOutlet weak var distancePickerView: UIPickerView!
    @IBOutlet weak var distanceView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distancePickerView.dataSource = self
        distancePickerView.delegate = self
        setTheme()
        // Do any additional setup after loading the view.
        
    }
    

    override func setTheme() {
        super.setTheme()
        backgroundBlurView(for: distanceView, cornerRadious: 15)
    }
    
    
    @IBAction func addNewActivity(_ sender: UIButton) {
        
        let alert = checkForMissingData()
        if alert != nil {
            present(alert!, animated: true)
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            
            // Getting and setting distance data
            let stringifiedDate = dateFormatter.string(from: timePicker.date)
            let distanceComponent = distancePickerView.view(forRow: distancePickerView.selectedRow(inComponent: 0), forComponent: 0) as! UILabel
            let distanceDecimalComponent = distancePickerView.view(forRow: distancePickerView.selectedRow(inComponent: 2), forComponent: 2) as! UILabel
            let metricComponent = distancePickerView.view(forRow: distancePickerView.selectedRow(inComponent: 3), forComponent: 3) as! UILabel
            let distanceString = distanceComponent.text! + "." + distanceDecimalComponent.text! + " " + metricComponent.text!
            
            //Creating new activity
            let newActivity = Activity(name: activityNameLabel.text!, description: descriptionTextView.text, duration: stringifiedDate, distance: distanceString, category: self.activityCategory, activityDate: Date())
            
            Model.shared.addActivity(newActivity: newActivity)
            self.popTwoViewControllers()
        }
    }
    
    override func checkForMissingData() -> UIAlertController? {
        let alert = UIAlertController(title: "Info missing", message: "You haven't set data for the fields marked in red", preferredStyle: .alert)

        let dismissAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(dismissAction)
        
        
        print(timePicker.countDownDuration)

        if activityNameLabel.text == "" && (descriptionTextView.text == "" || descriptionTextView.text == "Your description here..." && timePicker.countDownDuration == 60.0) {
            alert.message = "Activity name and description missing. Also the time has not been set"
            return alert
        } else if (activityNameLabel.text == "") {
            alert.message = "Activity name missing"
            return alert
        } else if descriptionTextView.text == "" || descriptionTextView.text == "Your description here..." {
            alert.message = "Activity description missing"
            return alert
        } else if (timePicker.countDownDuration == 60.0) {
            alert.message = "Timer for the activity has not been set"
            return alert
        }
        
        return nil
    }
    
}


//MARK: - UIPickerViewDataSource
extension NewDistanceActivityViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1 {
            return 1
        } else if component == 2 {
            return 10
        } else if component == 3 {
            return distanceFormats.count
        } else {
            return 50
        }
    }
    
    
}

//MARK: - UIPickerViewDelegate

extension NewDistanceActivityViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel()
        
        switch component { // Begin switch
        case 0:
            
            switch pickerView.selectedRow(inComponent: 3) { //Begin switch
            case 0:
                label.text = String(20 * (row + 1))
                break
                
            case 1, 2:
                label.text = String(row + 1)
                break
                
            case 3:
                label.text = String(70 * (row + 1))
                break
                
            case 4:
                label.text = String(1000 * (row + 1))
                break
                
            default:
                label.text = ""
                break
            } //End switch
            label.textAlignment = .right
            return label
            
        case 1:
            
            label.text = "."
            label.textAlignment = .center
            return label
            
        case 2:
            
            label.text = String(row)
            label.textAlignment = .center
            return label
            
        case 3:
            
            label.text = distanceFormats[row]
            label.textAlignment = .center
            return label
            
        default:
            return label
        } //end switch
        
    }
}
