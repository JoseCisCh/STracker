//
//  ActivityCategoriesViewController.swift
//  STracker
//
//  Created by José Cisneros on 03/05/22.
//

import Foundation
import UIKit

class ActivityCategoriesViewController: AppTheme {
    
    let activities: [[String: String]] = [["image": "running", "name": "Running" ], ["image": "cycling", "name": "Cycling"], ["image": "gymnastics", "name": "Gymnastics"], ["image": "pilates", "name": "Pilates"], ["image": "stepper", "name": "Stepper"], ["image": "swimming", "name": "Swimming"], ["image": "tennis2", "name": "Tennis"], ["image": "workout", "name": "Workout"]]
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.register(UINib(nibName: "CategoryCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CategoryCell")
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        setTheme()
    }
    
}

//MARK: - UICollectionViewDelegate
extension ActivityCategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newActivitySegue", sender: self)
    }
}

extension ActivityCategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
            cell.activityNameLabel.text = activities[indexPath.row]["name"]
            cell.activityImageView.image = UIImage(named: activities[indexPath.row]["image"]!)
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    
}
