//
//  TabBarViewController.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
             self.tabBarController?.title = ""
            self.tabBar.barTintColor = UIColor(red: 232.0/255, green: 241.0/255, blue: 245.0/255, alpha: 1.0)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureUI(){
        let selectedColor = UIColor(red: 7.0/255, green: 83.0/255, blue: 120.0/255, alpha: 1.0)
        let unSelectedColor = UIColor(red: 134.0/255, green: 180.0/255, blue: 202.0/255, alpha: 1.0)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: unSelectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: selectedColor], for: .selected)
        self.tabBar.clipsToBounds = true
        self.tabBar.isTranslucent = false
        
        
         // LEARNING VIEWCONTROLLER SETUP
        let learningVC:LearningViewController = LearningViewController(nibName: "LearningViewController", bundle: nil)
        learningVC.tabBarControl = self
        let learnImg = UIImage(named: "unselected_learning")?.withRenderingMode(.alwaysOriginal)
        let learnSelectedImg = UIImage(named: "selected_learning")?.withRenderingMode(.alwaysOriginal)
        learningVC.tabBarItem = UITabBarItem(title: nil, image: learnImg, selectedImage: learnSelectedImg)
        self.adjustShareinsets(tabBarItem: learningVC.tabBarItem)
        
        let nav1 = NavigationVC(rootViewController: learningVC)
        learningVC.navController = nav1

         // BENCHMARK VIEWCONTROLLER SETUP
        
        
        let benchMarkVC:BenchMarkViewController = BenchMarkViewController(nibName: "BenchMarkViewController", bundle: nil)
        benchMarkVC.tabBarControl = self
        let benchImg = UIImage(named: "unselected_benchmarking")?.withRenderingMode(.alwaysOriginal)
        let benchSelectedImg = UIImage(named: "selected_benchmarking")?.withRenderingMode(.alwaysOriginal)
        benchMarkVC.tabBarItem = UITabBarItem(title: nil, image: benchImg, selectedImage: benchSelectedImg)
        self.adjustShareinsets(tabBarItem: benchMarkVC.tabBarItem)
        let nav2 = NavigationVC(rootViewController: benchMarkVC)
        
        
        
        // CONNECT VIEWCONTROLLER SETUP
        
        let connectVC:ConnectViewController = ConnectViewController(nibName: "ConnectViewController", bundle: nil)
        connectVC.tabBarControl = self
        let connectImg = UIImage(named: "unselected_connect")?.withRenderingMode(.alwaysOriginal)
        let connectSelectedImg = UIImage(named: "selected_connect")?.withRenderingMode(.alwaysOriginal)
        connectVC.tabBarItem = UITabBarItem(title: nil, image: connectImg, selectedImage: connectSelectedImg)
        self.adjustShareinsets(tabBarItem: connectVC.tabBarItem)
        let nav3 = NavigationVC(rootViewController: connectVC)
        

        // MYACADEMY  VIEWCONTROLLER SETUP
        
        let academyVC:AcademyViewController = AcademyViewController(nibName: "AcademyViewController", bundle: nil)
        academyVC.tabBarControl = self
        let academyImg = UIImage(named: "unselected_my_academy")?.withRenderingMode(.alwaysOriginal)
        let academySelectedImg = UIImage(named: "selected_my_academy")?.withRenderingMode(.alwaysOriginal)
        academyVC.tabBarItem = UITabBarItem(title: nil, image: academyImg, selectedImage: academySelectedImg)
        self.adjustShareinsets(tabBarItem: academyVC.tabBarItem)
        let nav4 = NavigationVC(rootViewController: academyVC)
        

        
        self.viewControllers = [nav1,nav2,nav3,nav4]
        self.selectedIndex = 0
        
        self.tabBar.layer.borderWidth = 0.50
        self.tabBar.layer.borderColor = UIColor(red: 232.0/255, green: 241.0/255, blue: 245.0/255, alpha: 1.0).cgColor
        
        
        
    }

    func adjustShareinsets(tabBarItem:UITabBarItem)
    {
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: 0.0)
        
    }
    
    
    
}
