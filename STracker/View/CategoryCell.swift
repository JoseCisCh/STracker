//
//  CategoryCell.swift
//  STracker
//
//  Created by José Cisneros on 03/05/22.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    var category: ActivityCategory?
    
    @IBOutlet weak var activityImageView: UIImageView!
    
    @IBOutlet weak var activityNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
