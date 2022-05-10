//
//  NewTimeActivityViewController.swift
//  STracker
//
//  Created by José Cisneros on 03/05/22.
//

import UIKit

class NewTimeActivityViewController: NewActivityViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addNewActivity(_ sender: Any) {
        
        let alert = checkForMissingData()
        if alert != nil {
            present(alert!, animated: true)
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let stringifiedDate = dateFormatter.string(from: timePicker.date)
            
            print(stringifiedDate)
            let newActivity = Activity(name: activityNameLabel.text!, description: descriptionTextView.text, duration: stringifiedDate, category: self.activityCategory, activityDate: Date())
            
            Model.shared.addActivity(newActivity: newActivity)
            self.popTwoViewControllers()
        }
        
        
        
        
    }
    
    override func checkForMissingData() -> UIAlertController? {
        let alert = UIAlertController(title: "Info missing", message: "You haven't set data for the fields marked in red", preferredStyle: .alert)

        let dismissAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(dismissAction)

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
