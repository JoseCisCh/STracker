//
//  ActivityCategoriesViewController.swift
//  STracker
//
//  Created by José Cisneros on 03/05/22.
//

import Foundation
import UIKit

class ActivityCategoriesViewController: AppTheme {
    
    let activities: [[String: Any]] = [["image": "running", "name": "Running", "category": ActivityCategory.running ], ["image": "cycling", "name": "Cycling", "category": ActivityCategory.cycling], ["image": "gymnastics", "name": "Gymnastics", "category": ActivityCategory.gymnastics], ["image": "pilates", "name": "Pilates", "category": ActivityCategory.pilates], ["image": "stepper", "name": "Stepper", "category": ActivityCategory.stepper], ["image": "swimming", "name": "Swimming", "category": ActivityCategory.swimming], ["image": "tennis2", "name": "Tennis", "category": ActivityCategory.tennis], ["image": "workout", "name": "Workout", "category": ActivityCategory.workout]]
    var selectedCategory: ActivityCategory = .running
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.register(UINib(nibName: "CategoryCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CategoryCell")
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        setTheme()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NewTimeActivityViewController {
            vc.activityCategory = selectedCategory
        } else if let vc = segue.destination as? NewDistanceActivityViewController {
            vc.activityCategory = selectedCategory
        }
    }
    
}

//MARK: - UICollectionViewDelegate
extension ActivityCategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.selectedCategory = activities[indexPath.row]["category"] as! ActivityCategory
        switch activities[indexPath.row]["category"] as! ActivityCategory {
        case .stepper, .running, .swimming, .cycling:
            performSegue(withIdentifier: "newDistanceActivitySegue", sender: self)
            
        default:
            performSegue(withIdentifier: "newTimeActivitySegue", sender: self)
        }
        
        
        
    }
}

extension ActivityCategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
            cell.activityNameLabel.text = (activities[indexPath.row]["name"] as! String)
            cell.activityImageView.image = UIImage(named: activities[indexPath.row]["image"] as! String)
            cell.category = (activities[indexPath.row]["category"] as! ActivityCategory)
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    
}
