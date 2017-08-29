//
//  CoursesViewController.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var coursesTableView: UITableView!
    var coursePostArray:NSArray = NSArray()
    var courseModelObj:coursesPostModel?
    
   
    var courseID:Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 0.0/255, green: 83.0/255, blue: 120.0/255, alpha: 1.0)]
        self.title = "Courses"
        let backButtonImage = UIImage(named: "back")!
        let backButton   = UIBarButtonItem(image: backButtonImage,  style: .plain, target: self, action:#selector(CoursesViewController.backButtonTapped))
        self.navigationController?.navigationBar.tintColor = UIColor(red: 7.0/255, green: 86.0/255, blue: 123.0/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = backButton
        self.coursesTableView.tableFooterView = UIView()
        
        self.cellNibRegister()
        WebServiceHandler.sharedInstance.getCoursePost(courseID: self.courseID!, success: { (result) in
             self.courseModelObj = coursesPostModel()
            self.coursePostArray = result as! NSArray
            self.coursesTableView.reloadData()
            print(result)
        }) { (error) in
            print(error)
            
        }
        // Do any additional setup after loading the view.
    }

    func backButtonTapped(){
        let _ = self.navigationController?.popViewController(animated: true)
        
        //self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cellNibRegister(){
        self.coursesTableView.register(UINib(nibName: "CourcesTableViewCell", bundle: nil), forCellReuseIdentifier: "CourcesTableViewCell")
    }

    
    //MARK:- TableView Delegate and DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coursePostArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coursePostOBJ = self.coursePostArray.object(at: (indexPath as NSIndexPath).row) as? coursesPostModel
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourcesTableViewCell") as! CourcesTableViewCell
        cell.coursesNameLabel.textColor = UIColor(red: 102.0/255, green: 132.0/255, blue: 155.0/255, alpha: 1.0)
        cell.coursesNameLabel.text = coursePostOBJ?.postName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let coursePostOBJ = self.coursePostArray.object(at: (indexPath as NSIndexPath).row) as? coursesPostModel
        let dnnVC = DNNViewController(nibName: "DNNViewController", bundle: nil)
        dnnVC.coursePostID = coursePostOBJ?.postId

        self.navigationController?.pushViewController(dnnVC, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }

    @IBAction func BackButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  

    func showAlertToUser(){
        let alert = UIAlertController(title: "IODAdvance", message: "No data Found.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        
        present(alert, animated: true, completion: nil)
    }
}
