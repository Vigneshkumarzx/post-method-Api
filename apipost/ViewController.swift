//
//  ViewController.swift
//  apipost
//
//  Created by vignesh kumar c on 02/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   postService()
}
   
func postService() {
        guard let serviceUrl = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
      print("making API call")
        
        var request =  URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/Json", forHTTPHeaderField: "Content-type")
        
        let body: [String: AnyHashable] = [
            "userid": 1,
            "title": "Hello From Vignesh",
            "body": "something somthing somthing somthing something somthing somthing somthing something somthing somthing somthing something somthing somthing somthing something somthing somthing somthing something somthing somthing somthing something somthing somthing somthing",
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
       
        
    let task = URLSession.shared.dataTask(with: request) {(data, _, error) in
            
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            print("success\(response)")
        }catch {
            print(error)
        }
        
    }
        task.resume()
}
}

