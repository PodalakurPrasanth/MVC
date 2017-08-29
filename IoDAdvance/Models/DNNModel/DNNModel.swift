//
//  DNNModel.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class DNNModel: NSObject {
    var Description:String?
    var descriptionshortCodeData:String?
    var dnnTitle:String?
    
    
    func instanceFromDictionary(dictionary:NSDictionary) -> DNNModel{
        if let Description = dictionary.object(forKey: "description"){
            if let Description1 = Description as? String{
                self.Description = Description1
                print( self.Description!)
            }
        }
        if let coredata = dictionary.object(forKey: "descriptionshortCodeData"){
            if let coredata1 = coredata as? String{
                self.descriptionshortCodeData = coredata1
                print( self.descriptionshortCodeData!)
            }
        }
        
        if let title = dictionary.object(forKey: "title"){
            if let title1 = title as? String{
                self.dnnTitle = title1
                print( self.dnnTitle!)
            }
        }
        
        //title
        return self
    }
}
