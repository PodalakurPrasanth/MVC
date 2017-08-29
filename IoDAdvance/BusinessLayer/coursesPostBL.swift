//
//  coursesPostBL.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class coursesPostBL: NSObject {

    
    static let sharedInstance :coursesPostBL = {
        
        let instance = coursesPostBL()
        return instance
    }()
    
    func parsedCoursesData(dataArray:Array<NSDictionary>) -> [coursesPostModel] {
        var modelArray = [coursesPostModel]()
        for data in dataArray
        {
            let model = coursesPostModel()
            let data = model.instanceFromDictionary(dictionary: data )
            modelArray.append(data)
        }
        return modelArray
    }


}
