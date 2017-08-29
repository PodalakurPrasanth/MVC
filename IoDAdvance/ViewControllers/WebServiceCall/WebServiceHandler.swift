//
//  WebServiceHandler.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit
import Alamofire

class WebServiceHandler: NSObject {
    
    
   
    class var sharedInstance :  WebServiceHandler
    {
        struct Static
        {
            static let instance : WebServiceHandler =  WebServiceHandler()
        }
        return Static.instance
    }
    

    
    //MARK:- Common Api Methods
    func apiRequestWithParam(_ method: Alamofire.HTTPMethod, url: String, apiData: [String : AnyObject]?,encoding:ParameterEncoding,header:Dictionary<String,String>?, completion:@escaping (_ finished: Bool, _ response: AnyObject?) ->Void) {
        
        Alamofire.request(url, method: method, parameters: apiData,encoding: encoding, headers:header).responseJSON { response in
            
            print(response)
            if response.result.isSuccess {
                if(response.response?.statusCode == 200){
                    if let jsonLoginResponse = response.result.value {
                        completion(true, jsonLoginResponse as AnyObject?)
                    }
                }
                else{
                    completion(false, response.result.value as AnyObject?)
                }
            } else{
                completion(false, CONNECTION_ERR as AnyObject?)
            }
        }
    }
    
    
    func apiRequestWithResponseString(_ method: Alamofire.HTTPMethod, url: String, apiData: [String : AnyObject]?,encoding:ParameterEncoding?,header:Dictionary<String,String>?, completion:@escaping (_ finished: Bool, _ response: AnyObject?) ->Void) {
        
        Alamofire.request(url, method: method, parameters: apiData,encoding: encoding!, headers:header).responseString { response in
            
            
            
            print(response)
            print(response.response?.statusCode as Any)
            
            if response.result.isSuccess {
                if(response.response?.statusCode == 200){
                    if let jsonLoginResponse = response.result.value {
                        completion(true, jsonLoginResponse as AnyObject?)
                    }
                }
                else if(response.response?.statusCode == 500){
                    completion(false,INTERNAL_ERR as AnyObject?)
                }else if(response.response?.statusCode == 502){
                    completion(false,INTERNAL_ERR as AnyObject?)
                }else if(response.response?.statusCode == 504){
                    completion(false,INTERNAL_ERR as AnyObject?)
                }
                    //                else if(response.response?.statusCode == 403){
                    //                    completion(false,INTERNAL_ERR as AnyObject?)
                    //                }
                else{
                    completion(false, response.result.value as AnyObject?)
                }
            }else{
                completion(false, CONNECTION_ERROR as AnyObject?)
            }
        }
    }

    
    func getCoursesList(success:@escaping (_ responseObj: AnyObject) -> Void,failure:@escaping(_ error:NSError)->Void){
        
        let headerDict = ["Accept":"application/json"]
        
        self.apiRequestWithParam(.get, url: GET_COURSES, apiData: nil, encoding: URLEncoding.default, header: headerDict) { (succes, response) in
            print(response!)
            
            if succes {
                let responseDict = (response! as! NSDictionary).mutableCopy() as! NSMutableDictionary
                
                let array2 = responseDict.object(forKey: "data")!
             print(responseDict.object(forKey: "data")!)
                print(array2)
                
                let arrayModel:[CoursesModel] = CoursesBL.sharedInstance.parsedData(dataArray: array2 as! Array<NSDictionary>)
                print(arrayModel)
                success(arrayModel as AnyObject)
   
            }else{
                failure((response as? NSError)!)
            }
        }
      
    }



    
    func getCoursePost(courseID:Int,success:@escaping (_ responseObj: AnyObject) -> Void,failure:@escaping(_ error:NSError)->Void){
       
        let headerDict = ["Accept":"application/json"]
        let parameter = ["LinkedCoursedID":courseID] as NSDictionary
        
        self.apiRequestWithParam(.get, url: GET_COURSE_POSTS, apiData: parameter as? [String : AnyObject], encoding: URLEncoding.default, header: headerDict) { (succes, response) in
            print(response!)
            
            if succes {
                
                let responseDict = (response! as! NSDictionary).mutableCopy() as! NSMutableDictionary
                print(responseDict)
                let msg:String = responseDict.object(forKey: "message")! as! String
                
                if msg == "SUCCESS"{
                    
                    let dataArray = responseDict.object(forKey: "data")!
                    let modelArray:[coursesPostModel] = coursesPostBL.sharedInstance.parsedCoursesData(dataArray:dataArray as! Array<NSDictionary>)
                   
                    success(modelArray as AnyObject)
                   
                }
     
            }else{
              failure(response as! NSError)
            }
        }
    }

    
    //GET_POST_DETAIL

    func getCoursePostDetails(coursePostID:Int,success:@escaping (_ responseObj: AnyObject) -> Void,failure:@escaping(_ error:NSError)->Void){
        let parameter = ["id":coursePostID] as NSDictionary
        let headerDict = ["Accept":"application/json"]
        
        self.apiRequestWithParam(.get, url: GET_POST_DETAIL, apiData: parameter as? [String : AnyObject], encoding: URLEncoding.default, header: headerDict) { (succes, response) in
             print(response)
             if succes {
            let responseDict = (response! as! NSDictionary).mutableCopy() as! NSMutableDictionary
             let msg:String = responseDict.object(forKey: "message")! as! String
           
                if msg == "SUCCESS"{
                    let dataArray:NSArray = responseDict.object(forKey: "data")! as! NSArray
                    let disc1 = dataArray.object(at: 0)
                    print(disc1)
                    
                     let modelArray:[DNNModel] = DnnBL.sharedInstance.parsedCoursesData(dataArray:dataArray as! Array<NSDictionary>)
                    
                    success(modelArray as AnyObject)
                }
                
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    func removeUnnecessarySymbols(message:String)-> String{
        var messageString:String = message.replacingOccurrences(of: "[", with: "")
        messageString = messageString.replacingOccurrences(of: "]" , with: "")
        messageString = messageString.replacingOccurrences(of: "\"", with: "")
        messageString = messageString.replacingOccurrences(of: "\n", with: "")
        return messageString
    }




}








