//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 竹田理恵 on 2023/09/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    
    @IBOutlet weak var transparentButton: UIButton!
    var images: [UIImage] = [UIImage(named: "cat1")!, UIImage(named: "cat2")!, UIImage(named: "cat3")!]
    var currentIndex = 0
    var isPlaying = false
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        imageViewController.selectedImage = imageView.image
    }

    func updateUI() {
        imageView.image = images[currentIndex]
        
        forwardButton.isEnabled = !isPlaying
        backwardButton.isEnabled = !isPlaying
        playStopButton.setTitle(isPlaying ? "停止" : "再生", for: .normal)
    }
    
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        if  currentIndex == 0 {
            currentIndex = 2
        } else {
            currentIndex -= 1
        }
        imageView.image = images[currentIndex]
        
    }
    
    @IBAction func backwardButtonTapped(_ sender: Any) {
        if  currentIndex == 2 {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
        imageView.image = images[currentIndex]
        
    }
    
    
    @IBAction func playStopButtonTapped(_ sender: UIButton) {
        if isPlaying {
            timer?.invalidate()
        } else {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoSlide), userInfo: nil, repeats: true)
        }
        isPlaying.toggle()
        updateUI()
    }
    
    @objc func autoSlide() {
        forwardButtonTapped(forwardButton)
    }
    
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
    
   }

