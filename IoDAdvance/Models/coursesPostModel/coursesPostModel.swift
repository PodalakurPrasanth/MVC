//
//  coursesPostModel.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class coursesPostModel: NSObject {

    var id:Int?
    var linkedCourseID:Int?
    var name:String?
    var orderSequence:Int?
    var postId:Int?
    var postName:String?
    
    
    func instanceFromDictionary(dictionary:NSDictionary) -> coursesPostModel{
       
        
        if let ID = dictionary.object(forKey: "id"){
            if let courseID = ID as? Int{
                self.id = courseID
                print( self.id!)
            }
        }
        if let linkeedCourseID1 = dictionary.object(forKey: "linkedCourseId"){
            
            if linkeedCourseID1 is Int{
                self.linkedCourseID = linkeedCourseID1 as? Int
                print(self.linkedCourseID!)
            }
            
        }
        if let name = dictionary.object(forKey: "name"){
            
            if let name1 = name as? String {
                
                self.name = name1
                print(self.name!)
            }
           
        }
        if let orderSeq = dictionary.object(forKey: "orderSequence"){
            
            if let orderSeq1 = orderSeq as? Int {
                
                self.orderSequence = orderSeq1
                print(self.orderSequence!)
            }
            
        }
        if let postID = dictionary.object(forKey: "postId"){
            
            if let postID1 = postID as? Int {
                
                self.postId = postID1
                
                print(self.postId!)
            }
            
        }

        if let postName = dictionary.object(forKey: "postName"){
            if let postName1 = postName as? String{
                self.postName = postName1
                print(self.postName!)
            }
        }
        return self
    }
}
