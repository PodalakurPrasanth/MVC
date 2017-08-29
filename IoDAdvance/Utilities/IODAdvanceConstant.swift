//
//  IODAdvanceConstant.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import Foundation
import UIKit

var BASE_URL = "http://34.251.251.222:5051/DesktopModules/IoDAcademy/API/"
var GET_COURSES = BASE_URL+"CourseTest/GetCoursesList"
var GET_COURSE_POSTS = BASE_URL+"Course/GetCourseByLinkedCoursedID"
var GET_POST_DETAIL = BASE_URL+"Post/GetLearningPostData"
var GET_RECOMMENDED_POSTS = BASE_URL+"Post/RecommendedListSearch"
//Error Strings
//Error Strings

var ERROR = "Error"
var ACCESS_TOKEN = "Access Token"
var CONNECTION_ERR = ["Connectivity/Server Error"]
var CONNECTION_ERROR = "Connectivity/Server Error"
var TRYAGAIN = "Please Try Again"
var INTERNAL_ERR = "Internal Server Error"
var CSRF_FAILED = "CSRF validation failed"
var ALREADY_LOGIN = "Already logged in as Link."
