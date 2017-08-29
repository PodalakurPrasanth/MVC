//
//  DNNViewController.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class DNNViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dnnTAbleView: UITableView!
    var dnnListArray:NSArray = NSArray()
    var dnnModelOBJ:DNNModel?
    
    var coursePostID:Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dnnTAbleView.tableFooterView = UIView()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 0.0/255, green: 83.0/255, blue: 120.0/255, alpha: 1.0)]
        self.title = "Dnn"
        let backButtonImage = UIImage(named: "back")!
        let backButton   = UIBarButtonItem(image: backButtonImage,  style: .plain, target: self, action:#selector(CoursesViewController.backButtonTapped))
        self.navigationController?.navigationBar.tintColor = UIColor(red: 7.0/255, green: 86.0/255, blue: 123.0/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = backButton
        self.cellNibRegister()
        WebServiceHandler.sharedInstance.getCoursePostDetails(coursePostID: coursePostID!, success: { (response) in
            print(response)
            self.dnnModelOBJ = DNNModel()
            self.dnnListArray = response as! NSArray
            
            
            
            self.dnnTAbleView.reloadData()
        }) { (error) in
            print(error)
            self.showAlertToUser()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backButtonTapped(){
        let _ = self.navigationController?.popViewController(animated: true)
        
        //self.dismiss(animated: true, completion: nil)
    }
    
   


    func cellNibRegister(){
        self.dnnTAbleView.register(UINib(nibName: "DNNTableViewCell", bundle: nil), forCellReuseIdentifier: "DNNTableViewCell")
    }
    
    
    //MARK:- TableView Delegate and DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dnnListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dnnModOBJ = self.dnnListArray.object(at: (indexPath as NSIndexPath).row) as? DNNModel
        let cell = tableView.dequeueReusableCell(withIdentifier:"DNNTableViewCell") as! DNNTableViewCell
        cell.dnnNameLabel.textColor = UIColor(red: 102.0/255, green: 132.0/255, blue: 155.0/255, alpha: 1.0)
        cell.dnnNameLabel.text = dnnModOBJ?.dnnTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dnnModOBJ = self.dnnListArray.object(at: (indexPath as NSIndexPath).row) as? DNNModel
        let learnWebVC = LearningWebVC(nibName: "LearningWebVC", bundle: nil)
        learnWebVC.getDescription = dnnModOBJ?.Description
        learnWebVC.getDescriptionshortCodeData = dnnModOBJ?.descriptionshortCodeData
        self.navigationController?.pushViewController(learnWebVC, animated: true)
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
