//
//  PhotosViewController.swift
//  myApp
//
//  Created by Kevin Alfonso on 2/1/17.
//  Copyright © 2017 Kevin Alfonso. All rights reserved.
//

import UIKit
import AFNetworking


class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts: [NSDictionary] = []
    
    @IBOutlet weak var tableView: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 240;
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(
            with: request as URLRequest,
            completionHandler: { (data, response, error) in
                if let data = data {
                    if let responseDictionary = try! JSONSerialization.jsonObject(
                        with: data, options:[]) as? NSDictionary {
                        print("responseDictionary: \(responseDictionary)")
                        
                        // Recall there are two fields in the response dictionary, 'meta' and 'response'.
                        // This is how we get the 'response' field
                        let responseFieldDictionary = responseDictionary["response"] as! NSDictionary

                        self.posts = responseFieldDictionary["posts"] as! [NSDictionary]
                    }
                }
                self.tableView.reloadData()
        });
        task.resume()
        // Do any additional setup after loading the view.
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    
        return posts.count
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        
        let post = posts[indexPath.row]
        
        
        if let photos = post.value(forKeyPath: "photos") as? [NSDictionary] {
            // photos is NOT nil, go ahead and access element 0 and run the code in the curly braces
            let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
            
            // let imageUrl = URL(string: imageUrlString!)!
            
            
            if let imageUrl = URL(string: imageUrlString!) {
                // URL(string: imageUrlString!) is NOT nil, go ahead and unwrap it and assign it to imageUrl and run the code in the curly braces
                cell.posterView.setImageWith(imageUrl)
                
                
            } else {
                // URL(string: imageUrlString!) is nil. Good thing we didn't try to unwrap it!
            }
            
            
        }
        else {
            
            // photos is nil. Good thing we didn't try to unwrap it!
        }
        

        
        
        // Configure YourCustomCell using the outlets that you've defined.
        
        return cell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}









