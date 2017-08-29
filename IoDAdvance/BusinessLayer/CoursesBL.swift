//
//  CoursesBL.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class CoursesBL: NSObject {
    
    static let sharedInstance :CoursesBL = {
        
        let instance = CoursesBL()
        return instance
    }()

    
    func parsedData(dataArray:Array<NSDictionary>) -> [CoursesModel] {
        var modelArray = [CoursesModel]()
        for data in dataArray
        {
            let model = CoursesModel()
            let data = model.instanceFromDictionary(dictionary: data )
            modelArray.append(data)
        }
        return modelArray
    }

}
