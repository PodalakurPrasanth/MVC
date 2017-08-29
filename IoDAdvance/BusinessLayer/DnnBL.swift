//
//  DnnBL.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class DnnBL: NSObject {
    static let sharedInstance :DnnBL = {
        
        let instance = DnnBL()
        return instance
    }()
   
    func parsedCoursesData(dataArray:Array<NSDictionary>) -> [DNNModel] {
        
        var modelArray = [DNNModel]()
        for data in dataArray
        {
            let model = DNNModel()
            let data = model.instanceFromDictionary(dictionary: data )
            modelArray.append(data)
        }

        
        return modelArray
        
    }
    
}
