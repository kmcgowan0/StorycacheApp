import UIKit
import MapKit
import CoreLocation
import AVFoundation


class DataViewController: UIViewController {
    
    @IBOutlet weak var img0: UIImageView!
    @IBOutlet weak var imgcapt1: UITextView!
    @IBOutlet weak var pauseplay: UIButton!
    @IBOutlet weak var instruction: UILabel!
    
    
    //audioplayer
    var audioPlayer: AVAudioPlayer!


    
    var currentImage = 0
    var currentText = 0
    var currentAudio = 0
    
    
    let story = buildStories().first!
    
    let images = [
        UIImage(named: "title1.png"),
        UIImage(named: "1story1.jpg"), //“Bournemouth Beach” by Robertcourtman, licensed under CC BY 4.0.
        UIImage(named: "1story2.jpg"), //“Beach Huts near Bournemouth Pier” by  Paul Gillett, licensed under CC BY-SA.
        UIImage(named: "1story3.jpg"),
        UIImage(named: "1story4.jpg"),
        UIImage(named: "1story5.jpg"),
        UIImage(named: "1story6.jpg"),
        UIImage(named: "1story7.jpg"), //“Happy Family” by David Amsler, licensed under CC BY 2.0.
        UIImage(named: "credits.png")
    ]
    
    let captions = [
        "By: Greg Hamis",
        "Once upon a time, there was a little girl called Megan who loved going to the beach. Every summer she’d make the trip down to Bournemouth with her family, where she’d spend hours playing in the sand and in the sea.",
        "She loved hunting for shells on the beach, and looking at the beautiful, bright-coloured beach huts that lined the path. She wanted more than anything to live in one of them, so she could be right at the beach forever. ",
        "One summer, when Megan was nine years old, she was walking along the beach with her older brother. It had been a very rainy summer, but this was the first dry day in a week. That didn’t last long though, as the heavens opened and torrential rain poured down. Megan and her brother ran for shelter under the porch of one beach hut, which just happened to be open. Megan stuck her head inside to have a look at it.",
        "Suddenly, a voice behind Megan made her jump. She turned around and saw a boy, about her age looking at her. She apologised and quickly went to leave, but he told her to calm down. He offered her a seat on one of the two deck chairs inside, and when she sat, he explained how this was his family’s beach hut. ",
        "They talked for what seemed like hours, finding out more and more about each other. Megan learnt that the boy’s name was Greg, and he was one year older than her. He lived in Bournemouth, which made her very jealous of him. He told her that he spent all summer at the beach, and that she could come visit the hut any time she liked.",
        "Finally, when the rain eased off, Megan said goodbye to Greg, and began the walk back wth her brother. She was sad that she couldn’t spend more time with Greg, but she was excited for next summer already. Little did either of them know, this brief encounter would be the beginning of the rest of their lives together.",
        "Fifteen years after they first met, Greg finally proposed, and not long after that they had a beautiful daughter named Alice. The rest, as they say, is history. ",
        ""
    ]
    
    let audioArray = [
        "quiet",
        "1story1",
        "1story2",
        "1story3",
        "1story4",
        "1story5",
        "1story6",
        "1story7",
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
    
    @IBAction func playbtn(sender: AnyObject) {
        playSound()
       
    }

    @IBAction func stopBtn(sender: AnyObject) {
        stopSound()
    
    }
   
    @IBAction func pauseBtn(sender: AnyObject) {
        if (audioPlayer.playing == true){
            audioPlayer.pause()
            pauseplay.setTitle("▷", forState: UIControlState.Normal)
        }
        else {
            audioPlayer.play()
            pauseplay.setTitle("||", forState: UIControlState.Normal
            )
        }
    }
    
    
    
    func leftSwipe() {
        if currentImage < images.count - 1 {
            currentImage++
            img0.image = images[currentImage]

        }
        if currentText < captions.count - 1 {
            currentText++
            imgcapt1.text = captions[currentText]
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
            img0.image = images[currentImage]
            
        }
        if currentText > 0 {
            currentText--
            imgcapt1.text = captions[currentText]
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

