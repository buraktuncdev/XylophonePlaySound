

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {  
        PlaySoundDelegate.sharedInstance.playSound(title: sender.currentTitle!)
    }


}

