//
//  ViewController.swift
//  IOS-XO-CW5
//
//  Created by lulu rashed on 6/27/20.
//  Copyright © 2020 LULU. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {
    
   
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var xCounterLabel: UILabel!
    
    @IBOutlet weak var oCounterLabel: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
  var xCounter = 0
  var oCounter = 0
    
    
    
    ///...........
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    var turn = 0
    
   let images = [#imageLiteral(resourceName: "dark blue bg"),#imageLiteral(resourceName: "blue pg"),#imageLiteral(resourceName: "light-blue_bg"),#imageLiteral(resourceName: "gray bg")]

    
    @IBAction func sound(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func mute(_ sender: Any) {
        if audioPlayer.isPlaying{
            
            audioPlayer.pause()
        }else{
            
          
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "song", ofType:"mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch{
            print(error)
        }
        
        
    }
    
    @IBAction func reset(_ sender: Any) {
        
        b1.titleLabel?.text = " "
        b2.titleLabel?.text = " "
        b3.titleLabel?.text = " "
        b4.titleLabel?.text = " "
        b5.titleLabel?.text = " "
        b6.titleLabel?.text = " "
        b7.titleLabel?.text = " "
        b8.titleLabel?.text = " "
        b9.titleLabel?.text = " "
        
        b1.setTitle("", for: .normal)
        b2.setTitle("", for: .normal)
        b3.setTitle("", for: .normal)
        b4.setTitle("", for: .normal)
        b5.setTitle("", for: .normal)
        b6.setTitle("", for: .normal)
        b7.setTitle("", for: .normal)
        b8.setTitle("", for: .normal)
        b9.setTitle("", for: .normal)
        
        
        b1.isUserInteractionEnabled = true
        b2.isUserInteractionEnabled = true
        b3.isUserInteractionEnabled = true
        b4.isUserInteractionEnabled = true
        b5.isUserInteractionEnabled = true
        b6.isUserInteractionEnabled = true
        b7.isUserInteractionEnabled = true
        b8.isUserInteractionEnabled = true
        b9.isUserInteractionEnabled = true
        
        turn = 0
        
        
        imageView.image = images.randomElement()
        
        
    
    }
    
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    
    
    @IBAction func tap(_ sender: UIButton) {
        xCounterLabel.text = String(xCounter)
                oCounterLabel.text = String(oCounter)
        if turn % 2 == 0{
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.systemGreen, for: .normal)
            turnLabel.text = "O Turn"
          
        }else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            turnLabel.text = "X Turn"
           
        }
        sender.isUserInteractionEnabled = false
        turn += 1
        
        if checkWinner(player: "X"){
            okAlert(title: "YUPPPEE X WINS 🎊", message: "CONGRATS, reset the game now!!")
            xCounter += 1
        }
        if checkWinner(player: "O"){
            okAlert(title: "YUPPPEE O WINS 🎊", message: "CONGRATS, reset the game now!!")
            oCounter += 1
            
        }else if turn == 9{
            okAlert(title: "NO ONE WINS⚠️", message: "reset the game now!!")
        }
   let generator = UINotificationFeedbackGenerator()
             generator.notificationOccurred(.success)
        
 AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }

    }
    
    
    
    
    func checkWinner(player: String)-> Bool{
        let f1 = b1.titleLabel?.text
        let f2 = b2.titleLabel?.text
        let f3 = b3.titleLabel?.text
        let f4 = b4.titleLabel?.text
        let f5 = b5.titleLabel?.text
        let f6 = b6.titleLabel?.text
        let f7 = b7.titleLabel?.text
        let f8 = b8.titleLabel?.text
        let f9 = b9.titleLabel?.text
        
        let r1 = (f1,f2,f3) == (player,player,player)
        let r2 = (f4,f5,f6) == (player,player,player)
        let r3 = (f7,f8,f9) == (player,player,player)
        let c1 = (f1,f4,f7) == (player,player,player)
        let c2 = (f2,f5,f8) == (player,player,player)
        let c3 = (f3,f6,f9) == (player,player,player)
        let d1 = (f1,f5,f9) == (player,player,player)
        let d2 = (f3,f5,f7) == (player,player,player)
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            return true
        }else{
            return false
            
        }
        
        func theWinner(){
            if xCounter == 3{
                okAlert(title: "x WINNS 3 TIME", message: "OK")
            }else if oCounter == 3{
                okAlert(title: "o WINNS 3 TIME", message: "ok")
            }
                
            }
            
            
            
            
        }
        
      
        
        
        
    }
    

