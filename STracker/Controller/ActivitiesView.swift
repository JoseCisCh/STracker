//
//  ActivitiesView.swift
//  STracker
//
//  Created by José Cisneros on 27/04/22.
//

import UIKit
import RealmSwift
import SwipeCellKit
import ChameleonFramework

class ActivitiesView: AppTheme {
    
    let realm = try! Realm()
    
    var activities: Results<Activity>?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Table view config
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ActivityCell", bundle: Bundle.main), forCellReuseIdentifier: "ActivityCell")
        tableView.rowHeight = 84.0
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        
        // Navigation bar style
        
        setTheme()
        
        let activity1 = Activity(name: "Running", description: "I ran like 20 kilomemters")
        let activity2 = Activity(name: "Push-Up", description: "I did 100 push ups")
        do {
            try realm.write({
                realm.add(activity1)
                realm.add(activity2)
            })
        } catch {
            print(error)
        }
        activities = realm.objects(Activity.self)
        
        //tableView.reloadData()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        setTheme()
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    func deleteActivity(activity: Activity) {
        do {
            try self.realm.write {
                self.realm.delete(activity)
            }
        } catch {
            print(error)
        }
    }

}

//MARK: - UITableViewDelegate and SwipeTableViewCellDelegate
extension ActivitiesView:  UITableViewDelegate, SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
//            let alert = UIAlertController(title: "Delete Activity", message: "Are you sure you want to delete this activity?", preferredStyle: .alert)
//
//            let deleteAlertAction = UIAlertAction(title: "Delete", style: .default) { _ in
//                if let activity = self.activities?[indexPath.row] {
//                    self.deleteActivity(activity: activity)
//                }
//
//                self.tableView.reloadData()
//            }
//
//            alert.addAction(deleteAlertAction)
//
//            self.present(alert, animated: true, completion: nil)
            if let activity = self.activities?[indexPath.row] {
                self.deleteActivity(activity: activity)
            }

        }
        
        deleteAction.image = UIImage(systemName: "delete")
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension ActivitiesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (activities?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
        cell.delegate = self
        cell.name = activities![indexPath.row].name
        cell.actDescription = activities![indexPath.row].actDescription
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.backgroundColor = .clear
//        cell.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: tableView.rectForRow(at: indexPath), andColors: [UIColor.flatWhite()!, UIColor(hexString: "#219ebc")!, UIColor(hexString: "#023047")!])
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    
    
}