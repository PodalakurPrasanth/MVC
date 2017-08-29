//
//  LearningWebVC.swift
//  IoDAdvance
//
//  Created by prasanth.podalakur on 6/27/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit
import WebKit

class LearningWebVC: UIViewController, WKUIDelegate, WKNavigationDelegate {
  
    var getDescription:String?
    var getDescriptionshortCodeData:String?
    var backforwordButton:UIBarButtonItem?
    var forwordButton:UIBarButtonItem?
    var dismissButton:UIBarButtonItem?
  
    @IBOutlet weak var viewForEmbeddingWebView: UIView!
//    @IBOutlet weak var webView: UIWebView!
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Learning"

        self.addBarBUttonitems()

        webView = WKWebView()
        webView = WKWebView(frame: CGRect(x: self.viewForEmbeddingWebView.frame.origin.x, y: self.viewForEmbeddingWebView.frame.origin.y, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50), configuration: WKWebViewConfiguration() )
        
        self.viewForEmbeddingWebView.addSubview(webView)
        self.webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.loadHTMLString(self.getDescriptionshortCodeData!, baseURL: nil)
        

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBarBUttonitems(){
        self.backforwordButton   = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(LearningWebVC.backForwordButtonTapped))
        
        
        self.forwordButton   = UIBarButtonItem(title: ">", style: .plain, target: self, action: #selector(LearningWebVC.ForwordButtonTapped))
        self.dismissButton = UIBarButtonItem(title: "x", style: .plain, target: self, action: #selector(LearningWebVC.dismissButtonTapped))
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 7.0/255, green: 86.0/255, blue: 123.0/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItems = [backforwordButton!,forwordButton!]
        self.navigationItem.rightBarButtonItem = dismissButton
    }
    func backForwordButtonTapped(){
        if(webView.canGoBack)
        {
            webView.goBack()
        }
    }
    func ForwordButtonTapped(){
       
        if(webView.canGoForward)
        {
            webView.goBack()
        }
    }

    func dismissButtonTapped(){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebView content loaded.")
        if(webView.canGoBack)
        {
            self.backforwordButton?.isEnabled = true
        }else{
            self.backforwordButton?.isEnabled = false
        }
        if(webView.canGoForward)
        {
            self.forwordButton?.isEnabled = true
        }else{
            self.forwordButton?.isEnabled = false
        }
        
        //self.backwordButton.isEnabled = true
    }

    

}



