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
        let alert = UIAlertController(title: "Info missing", message: "You haven't set data for the fields marked in red", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(dismissAction)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        print(dateFormatter.string(from: timePicker.date))
        
        if activityNameLabel.text == "" && (descriptionTextView.text == "" || descriptionTextView.text == "Your description here...") {
            alert.message = "Activity name and description missing"
            present(alert, animated: true)
        } else if (activityNameLabel.text == "") {
            alert.message = "Activity name missing"
            present(alert, animated: true)
        } else if descriptionTextView.text == "" || descriptionTextView.text == "Your description here..." {
            alert.message = "Activity description missing"
            present(alert, animated: true)
        } else {
            
        }
    }
}
