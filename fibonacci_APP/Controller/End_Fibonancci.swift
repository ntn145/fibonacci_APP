import UIKit
import ProgressHUD
class endFibonacci: UIViewController {
    var result: [Int] = []
    var listnull: [String] = []
    let arr = ["0", "1","1","2","3", "5", "8", "13","21","34"]
    var counter = 0
    var numbers = ""
    var titles = "COMPLETE"
    @IBOutlet weak var lbt_Views: UITextView!
    @IBAction func btn_Recalculator(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringArray = result.map(String.init)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            if counter == stringArray.count{
                timer.invalidate()
                lbt_Views.textAlignment = NSTextAlignment.center
                ProgressHUD.showSucceed("COMPLETE")
                lbt_Views.text = "COMPLETE\nThe Fibonacci sequence \(numbers):\n\(result)"
            }
            if counter < stringArray.count{
                listnull.append(stringArray[counter])
                lbt_Views.text = "\(listnull)"
                counter += 1
            }
        }
    }
}
