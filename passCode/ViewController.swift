//
//  ViewController.swift
//  passCode
//
//  Created by Bryan Kuo on 2021/9/23.
//

import UIKit

class ViewController: UIViewController {
    
    let correctPasscode = "9898"
    var enterPasscode = ""
    
    @IBOutlet var guessBackImage: [UIImageView]!
    @IBOutlet var guessImages: [UIImageView]!
    
    @IBOutlet var numberButton: [UIButton]!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        reset()
    }
    
    @IBAction func enterPasscoded(_ sender: UIButton) {
        if enterPasscode.count != 4 {
            if let inputNumber = sender.currentTitle {
                enterPasscode.append(inputNumber)
            }
        }
        showImage()
        print(enterPasscode)
    }
    
    

    func showImage() {
        switch enterPasscode.count {
        case 1:
            guessImages[0].isHidden = false
            guessBackImage[0].isHidden = true
            
            for i in 1...3 {
                guessImages[i].isHidden = true
                guessBackImage[i].isHidden = false
            }
        case 2:
            for i in 0...1 {
                guessImages[i].isHidden = false
                guessBackImage[i].isHidden = true
            }
            for i in 2...3 {
                guessImages[i].isHidden = true
                guessBackImage[i].isHidden = false
            }
        case 3:
            for i in 0...2 {
                guessImages[i].isHidden = false
                guessBackImage[i].isHidden = true
            }
                guessImages[3].isHidden = true
                guessBackImage[3].isHidden = false
        case 4:
            for i in 0...3 {
                guessImages[i].isHidden = false
                guessBackImage[i].isHidden = true
            }
            
            checkPassword()
            
        default:
            reset()
        }
    }
    
    @IBAction func deletePass(_ sender: UIButton) {
        if enterPasscode.count != 0 {
            enterPasscode.removeLast()
        }
        print(enterPasscode)
        showImage()
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
    }
    

    func reset() {
        for i in 0...3 {
            guessImages[i].isHidden = true
            guessBackImage[i].isHidden = false
        }
        enterPasscode = ""
        print(enterPasscode)
        imageView.isHidden = true
        
    }
    
    func checkPassword() {
        if enterPasscode == correctPasscode {
            let controller = UIAlertController(title: "密碼正確", message: "恭喜！", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default) { action in
                self.reset()
            }
            
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            
            imageView.isHidden = false
            imageView.image = UIImage(named: "1")
            
        } else if enterPasscode != correctPasscode {
            let controller = UIAlertController(title: "密碼錯誤", message: "請確認密碼", preferredStyle: .alert)
            let action = UIAlertAction(title: "再次輸入", style: .default) { action in
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            
            imageView.isHidden = false
            imageView.image = UIImage(named: "2")
            
        }
    }
}

