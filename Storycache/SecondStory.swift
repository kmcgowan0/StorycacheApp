import UIKit
import MapKit
import CoreLocation
import AVFoundation


class SecondStory: UIViewController {
    
    
    
    @IBOutlet weak var imag1: UIImageView!
    @IBOutlet weak var imgcapt2: UITextView!
    @IBOutlet weak var pauseplay2: UIButton!
    @IBOutlet weak var instruction: UILabel!
    //@IBOutlet weak var audioClip2: UIButton!
    
    
    //audioplayer
    var audioPlayer: AVAudioPlayer!
    
    
    
    var currentImage = 0
    var currentText = 0
    var currentAudio = 0
    
    
    let story = buildStories().first!
    
    let images2 = [
        UIImage(named: "title2.png"),
        UIImage(named: "2story1.jpg"), //“Haeundae Beach” by Sirocumo, licensed under CC0.
        UIImage(named: "2story2.jpg"), //"Bournemouth: a surfer by the pier” by Chris Downer, licensed under CC BY-SA.
        UIImage(named: "2story3.jpg"), //“Children’s Sand Castle” by Ben_Kerckx, licensed under CC0.
        UIImage(named: "2story4.jpg"), //“Sunglasses” by antriksh, licensed under CC0.
        UIImage(named: "credits.png")
    ]
    
    let captions = [
        "By: Katie Mcgowan",
        "The sun on my face, and the sand in my toes, makes any day a delight",
        "Hunting for seashells, and surfing the waves, makes everything seem alright",
        "Building a castle, fit for a king, makes all my dreams within reach",
        "Wearing my shades and getting a tan, makes a great day at the Beach",
        ""
    ]
    
    let audioArray = [
        "quiet",
        "2story1",
        "2story2",
        "2story3",
        "2story4",
        "quiet"
    ]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let leftSwift = UISwipeGestureRecognizer(target: self, action: "leftSwipe")
        leftSwift.direction = .Left
        view.addGestureRecognizer(leftSwift)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: "rightSwipe")
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
        
        
    }
    
   
    @IBAction func playbtn2(sender: AnyObject) {
        //playSound()
    }
    
    @IBAction func stopBtn2(sender: AnyObject) {
        stopSound()
        
    }
    
    
    
    @IBAction func pauseBtn2(sender: AnyObject) {
        if (audioPlayer.playing == true){
            audioPlayer.pause()
            pauseplay2.setTitle("▷", forState: UIControlState.Normal)
        }
        else {
            audioPlayer.play()
            pauseplay2.setTitle("||", forState: UIControlState.Normal
            )
        }
    }
    

    
    
    func leftSwipe() {
        if currentImage < images2.count - 1 {
            currentImage++
            imag1.image = images2[currentImage]
            
        }
        if currentText < captions.count - 1 {
            currentText++
            imgcapt2.text = captions[currentText]
        }
        if currentAudio < audioArray.count - 1 {
            currentAudio++
            
        }
        playSound()
        instruction.hidden = true
        
    }
    
    func rightSwipe() {
        if currentImage > 0 {
            currentImage--
            imag1.image = images2[currentImage]
            
        }
        if currentText > 0 {
            currentText--
            imgcapt2.text = captions[currentText]
        }
        if currentAudio > 0 {
            currentAudio--
            //audioClip == audioArray[currentAudio]
            
        }
        playSound()
        instruction.hidden = true
    }
    
    
    func playSound() {
        do {
            self.audioPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(audioArray[currentAudio], ofType: "mp3")!))
            self.audioPlayer.play()
        } catch {
            print("Error")
        }
    }
    
    func stopSound() {
        do {
            self.audioPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(audioArray[currentAudio], ofType: "mp3")!))
            self.audioPlayer.stop()
        } catch {
            print("Error")
        }
    }
    
}

