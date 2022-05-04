//
//  ConfigViewController.swift
//  STracker
//
//  Created by José Cisneros on 28/04/22.
//

import UIKit
import ChameleonFramework

class ConfigViewController: AppTheme {

    @IBOutlet weak var verticalStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalStackView.subviews.forEach { hStack in
            if let hStackCasted = hStack as? UIStackView {
                hStackCasted.subviews.forEach { button in
                    if let buttonCasted = button as? UIButton {
                        buttonCasted.layer.cornerRadius = 30
                        buttonCasted.clipsToBounds = true
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        setTheme()
    }
    
    
    
    @IBAction func setNewTheme(_ sender: UIButton) {
        print(sender.backgroundColor!.hexValue()!)
        UserDefaults.standard.set(sender.backgroundColor!.hexValue()! , forKey: "colorTheme")
        
        setTheme()
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.backgroundColor = UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))
//        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(backgroundColor: UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))!, returnFlat: true)]
//        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(backgroundColor: UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))!, returnFlat: true)]
//
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//
//        view.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: view.frame, andColors: [UIColor.flatWhite()!, UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))!])
//    }
//
//    func setTheme() {
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.backgroundColor = UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))!
//        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(backgroundColor: UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))!, returnFlat: true)]
//        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(backgroundColor: UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))!, returnFlat: true)]
//
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//        navigationController?.navigationBar.tintColor = ContrastColorOf(backgroundColor: UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))!, returnFlat: true)
//
//        view.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: view.frame, andColors: [UIColor.flatWhite()!, UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme"))!])

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
