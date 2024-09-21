//
//  PracticeVC.swift
//  j-lingo
//
//  Created by as on 8/13/24.
//

import UIKit

final class PracticeVC:UIViewController{
    
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var parentHolderView: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    var flag : Int?
    var remainingArr : [String]  = []
    var dic : [String : String] = [:]
    var current = ""
    @IBOutlet weak var playagainBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setArr()
        
    }
    override func loadView() {
        if let nibView = Bundle.main.loadNibNamed("PracticeVC", owner: self, options: nil)?.first as? UIView {
            self.view = nibView
        }
    }
    
    func showNext() {
          if remainingArr.isEmpty {
              resultLabel.text = "Congratulations! You've completed all quiz!"
              keyLabel.text = ""
              playagainBtn.isHidden = false
              return
          }
          current = remainingArr.removeFirst()
          keyLabel.text = current
          resultLabel.text = ""
          inputTextField.text = ""
      }

    private func checkCorrectOrNot(str : String) {
        
        if str == dic[current]?.lowercased(){
            resultLabel.text = "Correct"
            resultLabel.zoomIn(duration: 0.3) { _ in
                self.showNext()
            }
        }else {
            resultLabel.text = "Incorrect. Try again."
            inputTextField.text = ""
            resultLabel.zoomIn(duration: 0.3) { _ in
                self.resultLabel.text = ""
            }
        }
    }

    private func setup() {
        
       TitleLbl.text = "Practice"
       TitleLbl.isHidden = false
       inputTextField.delegate = self
       inputTextField.autocorrectionType = .no
    }
    
    private func setArr() {
        
        switch flag {
        case PracticeFlag.hiragana.rawValue:
            remainingArr = Array(Constants.Hiragana.combinedHiraganaDictionary.keys).shuffled()
            dic = Constants.Hiragana.combinedHiraganaDictionary
        case PracticeFlag.katakana.rawValue:
            remainingArr = Array(Constants.Katakana.combinedKatakanaDictionary.keys).shuffled()
            dic = Constants.Katakana.combinedKatakanaDictionary
        case PracticeFlag.wh.rawValue:
            remainingArr = Array(Constants.WH.dic.keys).shuffled()
            dic = Constants.WH.dic
        case PracticeFlag.kanji.rawValue:
            remainingArr = Array(Constants.Kanji.k1.keys).shuffled()
            dic = Constants.Kanji.k1
        default:
            print("")
        }
        
        if remainingArr.count > 0 {
            current = remainingArr.removeLast()
        }
        inputTextField.text = ""
        keyLabel.text = current
        resultLabel.text = ""
    }
    
    @IBAction func tappedMenuBtn(_ sender: Any) {
        
    }
    
    @IBAction func tappedBackBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    fileprivate func verifyAndcheck() {
        if inputTextField.text == "" {
            ToastHelper.showToast(imageName: "cross.fill", titleStr: "Uh! oh", subtitleStr: "enter some text")
        }else{
            checkCorrectOrNot(str: inputTextField.text!.lowercased())
        }
    }
    
    @IBAction func tappedSubmit(_ sender: Any) {
        
        verifyAndcheck()
    }
    
    @IBAction func palyagaintapped(_ sender: Any) {
        
        setArr()
        playagainBtn.isHidden = true
    }
}


extension PracticeVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        verifyAndcheck()
        return true
    }
}
