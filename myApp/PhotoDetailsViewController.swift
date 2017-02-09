//
//  PhotoDetailsViewController.swift
//  myApp
//
//  Created by Kevin Alfonso on 2/8/17.
//  Copyright © 2017 Enzo Ames. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    var post: NSDictionary!
    
    @IBOutlet weak var photoDetail: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if let photos = post.value(forKeyPath: "photos") as? [NSDictionary] {
            let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
            
            // let imageUrl = URL(string: imageUrlString!)!
            
            
            if let imageUrl = URL(string: imageUrlString!) {
                photoDetail.setImageWith(imageUrl)
                
                
            } else {
            }
            
            
        }
        else {
            
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
