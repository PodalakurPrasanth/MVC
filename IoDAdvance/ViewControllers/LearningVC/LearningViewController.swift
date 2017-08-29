//
//  LearningViewController.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class LearningViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var navController:NavigationVC?
    var tabBarControl:TabBarViewController?
    var courseModel:CoursesModel?
    var courseListArray:NSArray = NSArray()
    @IBOutlet weak var learnigTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.courseModel = CoursesModel()
        self.learnigTableView.tableFooterView = UIView()
       WebServiceHandler.sharedInstance.getCoursesList(success: { (response) in
        
        self.courseListArray = response as! NSArray
        
        self.learnigTableView.reloadData()
        print(response)
       }) { (error) in
        
             print(error)
        
        
            
            self.showAlertToUser()
            
       
        }


        self.cellNibRegister()
        //self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 0.0/255, green: 83.0/255, blue: 120.0/255, alpha: 1.0)]
       
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Learning"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func cellNibRegister(){
         self.learnigTableView.register(UINib(nibName: "LearningTableViewCell", bundle: nil), forCellReuseIdentifier: "LearningTableViewCell")
    }

    
    //MARK:- TableView Delegate and DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courseListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let courseList = self.courseListArray.object(at: (indexPath as NSIndexPath).row) as? CoursesModel
        let cell = tableView.dequeueReusableCell(withIdentifier: "LearningTableViewCell") as! LearningTableViewCell
        cell.courseNamleLabel.textColor = UIColor(red: 102.0/255, green: 132.0/255, blue: 155.0/255, alpha: 1.0)
        cell.courseNamleLabel.text = courseList?.datasString
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(courseListArray[indexPath.row])
        let courseList = self.courseListArray.object(at: (indexPath as NSIndexPath).row) as? CoursesModel
       
        
        let courseVC = CoursesViewController(nibName: "CoursesViewController", bundle: nil)
        courseVC.courseID = courseList?.dataInt
        
        
        
        self.navigationController?.pushViewController(courseVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
    
         return UITableViewAutomaticDimension
    }
    
    func showAlertToUser(){
        let alert = UIAlertController(title: "IODAdvance", message: "No data Found.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        
        present(alert, animated: true, completion: nil)
    }

}
