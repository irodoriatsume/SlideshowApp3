//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by 竹田理恵 on 2023/09/03.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = selectedImage {
            imageView.image = image
            // Do any additional setup after loading the view.
        }
        

        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
