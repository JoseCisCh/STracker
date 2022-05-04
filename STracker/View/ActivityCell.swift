//
//  ActivityCell.swift
//  STracker
//
//  Created by José Cisneros on 28/04/22.
//

import UIKit
import SwipeCellKit

class ActivityCell: SwipeTableViewCell {

    var name: String? {
        didSet {
            self.activityNameLabel.text = name
            
            switch name {
            case "Running":
                activityImage.image = UIImage(named: "running")!
                break;
    
            case "Push-Up":
                activityImage.image = UIImage(named: "workout")!
    
            default:
                activityImage.image = UIImage(named: "workout")!
            }
            
        }
    }
    var actDescription: String? {
        didSet {
            descriptionLabel.text = actDescription
        }
        
    }
    
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        switch name {
//        case "Running":
//            activityImage.image = UIImage(named: "running")!
//            break;
//
//        case "Push-Up":
//            activityImage.image = UIImage(named: "workout")!
//
//        default:
//            activityImage.image = UIImage(named: "workout")!
//        }
//
//        activityNameLabel.text = name!
//        descriptionLabel.text = actDescription!
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
