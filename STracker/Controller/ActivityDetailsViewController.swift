//
//  ActivityDetailsViewController.swift
//  STracker
//
//  Created by José Cisneros on 09/05/22.
//

import UIKit
class ActivityDetailsViewController: AppTheme {
    
    var activity: Activity? 
    
    @IBOutlet weak var nameAndDescriptionView: UIView!
    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var activityDescriptionTextView: UITextView!
    
    @IBOutlet weak var activityDurationView: UIView!
    @IBOutlet weak var activityDurationLabel: UILabel!
    
    @IBOutlet weak var activityDistanceView: UIView!
    @IBOutlet weak var distanceTraveledLabel: UILabel!
    @IBOutlet weak var activityDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        activityNameLabel.text = activity?.name
        activityDescriptionTextView.text = activity?.actDescription
        activityDurationLabel.text = "\(activity!.duration!) hours"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy, HH:mm"
        
        let activityDateString = "Activity done:  \(dateFormatter.string(from: activity!.activityDate))"
        activityDateLabel.text = activityDateString
        
        if let activityDistance = activity?.distance {
            distanceTraveledLabel.text = activityDistance
        } else {
            activityDistanceView.isHidden = true
        }
    }
    
    override func setTheme() {
        super.setTheme()
        backgroundBlurView(for: nameAndDescriptionView, cornerRadious: 15)
        backgroundBlurView(for: activityDurationView, cornerRadious: 15)
        backgroundBlurView(for: activityDistanceView, cornerRadious: 15)
    }
    
}
