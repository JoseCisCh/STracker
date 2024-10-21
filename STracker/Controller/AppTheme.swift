//
//  AppTheme.swift
//  STracker
//
//  Created by José Cisneros on 30/04/22.
//

import Foundation
import ChameleonFramework

class AppTheme: UIViewController {
    
    static var principalColor = UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme") ?? "#005f73")
    static var contastColor = ContrastColorOf(UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme") ?? "#005f73")!, returnFlat: true)
    
    func setTheme() {
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme") ?? "#005f73")
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf( UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme") ?? "#005f73")!, returnFlat: true)]
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme") ?? "#005f73")!, returnFlat: true)]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = ContrastColorOf(UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme") ?? "#005f73")!, returnFlat: true)
        
        view.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: view.frame, andColors: [UIColor.flatWhite(), UIColor(hexString: UserDefaults.standard.string(forKey: "colorTheme") ?? "#005f73")!])
        
        
    }
    
    func backgroundBlurView(for viewToApply: UIView, cornerRadious: Double = 0)  {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = viewToApply.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = false
        viewToApply.layer.cornerRadius = cornerRadious
        viewToApply.clipsToBounds = true
        viewToApply.addSubview(blurEffectView)
        viewToApply.sendSubviewToBack(blurEffectView)
    }
}

