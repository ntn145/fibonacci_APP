import UIKit
import ProgressHUD

class startFibonancci: UIViewController {
    @IBOutlet weak var txt_Input: UITextField!
//Nut button
    var fiNumber = 0
    var fiString: [Int] = []
    @IBAction func btn_Calculator(_ sender: Any) {
        let number = txt_Input.text!.replacingOccurrences(of: " ", with: "")
        if (Int(number) ?? 0 >= 92 || Int(number) ?? 4 <= 1) {
            ProgressHUD.showError("Please Choose\nn <= 93 and n > 1")
        }else if getInt("\(number)") == -1 {
            if getInt("\(number)") == -1{
            ProgressHUD.showError("ERROR!!!\nNO CHARACTER")
            }
        }
        else if (getInt(number) != -1) {
            fiNumber = Int(number)!
            let result = fibonaccis(n: fiNumber)
            fiString = result
            self.performSegue(withIdentifier: "goToFibonacci", sender: self)
       txt_Input.text = ""
    }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToFibonacci" {
            
            let destinationVC = segue.destination as! endFibonacci
            destinationVC.result = fiString
            destinationVC.numbers = txt_Input.text!

        }
    }
}

func fibonaccis(n: Int) -> [Int] {

    assert(n > 1)

    var array = [0, 1]

    while array.count < n {
        array.append(array[array.count - 1] + array[array.count - 2])
    }
    return array
}

func getInt(_ data: String) -> Int {
    let datas = data.removingLeadingSpaces()
    return Int(datas) ?? -1
}


extension String {
    func removingLeadingSpaces() -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: .whitespaces) }) else {
            return self
        }
        return String(self[index...])
    }
}
