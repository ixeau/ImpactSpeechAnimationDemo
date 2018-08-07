
//
// Martin Lexow
// IXEAU © 2018
// www.ixeau.com
//


import UIKit
import AVFoundation // benötigt für: AVSpeechUtterance


class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBOutlet weak var animateButton: UIButton!
    @IBAction func animateButtonAction(_ sender: Any) {
        
        /*
         Nutze Animationen um dein Interface lebendiger wirken zu lassen
         und um es verständlicher zu machen. Visualisiere mit Ihnen bspw.
         Übergänge oder Rückmeldungen. Sinnvoll eingesetzte Animationen
         steigern die Qualität des Nutzererlebnisses.
         */
        
        let ausschlag: CGFloat = 30.0
        let midX = animateButton.center.x
        let midY = animateButton.center.y
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: midX - ausschlag, y: midY)
        animation.toValue = CGPoint(x: midX + ausschlag, y: midY)
        animateButton.layer.add(animation, forKey: "position")
        
    }
    
    
    
    @IBOutlet weak var rumbleButton: UIButton!
    @IBAction func rumbleButtonAction(_ sender: Any) {
        
        // Haptisches Feedback steigert die Qualität von Interaktionen.
        
        /*
         IMPACT
         Beispiel: UI Element rastet ein oder kollidiert.
         Dokumentation: https://developer.apple.com/documentation/uikit/uiimpactfeedbackgenerator
         */
        let impactFeedback = UIImpactFeedbackGenerator()

        /*
         SELECTION
         Beispiel: Du verschiebst die Zelle einer Listenansicht.
         Dokumentation: https://developer.apple.com/documentation/uikit/uiselectionfeedbackgenerator
         */
        let selectionFeedback = UISelectionFeedbackGenerator()
        
        /*
         NOTIFICATION
         Beispiel: Eine Aufgabe war erfolgreich oder ist fehlgeschlagen.
         Dokumentation: https://developer.apple.com/documentation/uikit/uinotificationfeedbackgenerator
         */
        let notificationFeedback = UINotificationFeedbackGenerator()
        
        
        // Bei Tastendruck wird eine zufällige Vibration ausgelöst:
        
        let zufall = arc4random_uniform(5) + 1 // zufällige Zahl zwischen 1 und 5
        
        switch zufall {
        case 1:
            selectionFeedback.selectionChanged()
            print("selectionChanged")
        case 2:
            notificationFeedback.notificationOccurred(.success)
            print("notificationOccurred .success")
        case 3:
            notificationFeedback.notificationOccurred(.warning)
            print("notificationOccurred .warning")
        case 4:
            notificationFeedback.notificationOccurred(.error)
            print("notificationOccurred .error")
        default:
            impactFeedback.impactOccurred()
            
        }
        
    }
    

    
    @IBOutlet weak var speakButton: UIButton!
    @IBAction func speakButtonAction(_ sender: Any) {
        
        /*
         Die Text-to-Speech Umwandlung ermöglicht dir
         einen gesprochenen Dialog zwischen App und Nutzer.
         */
 
        let aussage = AVSpeechUtterance(string: "Guten Morgen, wie geht es dir?")
        aussage.voice = AVSpeechSynthesisVoice(language: "de-DE")
        
        let synth = AVSpeechSynthesizer()
        synth.speak(aussage)
        
    }
    


}
