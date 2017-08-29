//
//  CoursesModel.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class CoursesModel: NSObject {
 

    var dataInt:Int?
    var datasString:String?
    
    
    func instanceFromDictionary(dictionary:NSDictionary) -> CoursesModel{
        
        
        if let dataInt = dictionary.object(forKey: "data_int"){
            if let dataInt1 = dataInt as? Int{
                self.dataInt = dataInt1
            }
        }
        if let dataString = dictionary.object(forKey: "data_string"){
            if let dataString1 = dataString as? String{
                self.datasString = dataString1
            }
        }

        
        return self
        
    }
    

}
