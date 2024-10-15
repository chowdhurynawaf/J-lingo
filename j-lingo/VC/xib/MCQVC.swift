//
//  MCQVC.swift
//  j-lingo
//
//  Created by Macbook Pro on 9/22/24.
//

import UIKit

class MCQVC: UIViewController {

    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var stackV: UIStackView!
    @IBOutlet weak var correctLbl: UILabel!
    @IBOutlet weak var answerLbl: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBOutlet weak var flagBtn: CustomButton!
    
    
    var flag : String = ""
    var dic: [(String, String)] = []
    var remainingQuestions: [(String, String)] = []
    var currentQuestion: (String, String)?
    var options : [String] = []
    var alterOptions : [(String,String)] = []
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        setupArr()
        
    }

    @IBAction func playAgainTapped(_ sender: Any) {
       
        setupArr()
    }
    
    @IBAction func tappedAnswer(_ sender: UIButton) {
        
        checkAnswer(tag: sender.tag)
    }
    
    @IBAction func backbtnTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tappedFlagBtn(_ sender: Any) {
        
        showNextQuestion()
        UIView.transition(with: self.flagBtn, duration: 0.5, options: .transitionFlipFromBottom, animations: {
          self.flagBtn.setTitle("Boom....", for: .normal)
          self.flagBtn.setTitleColor(UIColor.white, for: .normal)
        }, completion: nil)
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIView.transition(with: self.flagBtn, duration: 1.5, options: .transitionFlipFromLeft, animations: {
              self.flagBtn.setTitle("flag", for: .normal)
              self.flagBtn.setTitleColor(UIColor.white, for: .normal)
            },completion: nil)
            
        }
    }
    
    func saveDataInFlagDatabase() {
        
        let userDefaultsHelper = UserDefaultsHelper()
        userDefaultsHelper.appendToArray(tuple:currentQuestion!)
    }
    
    fileprivate func setupArr() {
        remainingQuestions = dic.map{$0}
        remainingQuestions.shuffle()
        showNextQuestion()
        
    }
    
    private func checkAnswer(tag:Int) {
    
        if(currentQuestion!.1 == options[tag-1]){
            correctLbl.text = "Correct"
            correctLbl.zoomIn(duration: 0.7) { _ in
                self.showNextQuestion()
            }
        }else{
            
            if let foundKey = dic.first(where: { $0.1 == options[tag-1] })?.0 {
                print("Found key: \(foundKey)")
                correctLbl.text = "InCorrect\nTapped Option : \(foundKey)"
                correctLbl.zoomIn(duration: 0.5) { _ in
                    self.correctLbl.text = ""
                }
            } else {
                print("Value not found.")
            }
        }
    }
    
   private func showNextQuestion() {
       
       if (flag == "") {
           self.flagBtn.isHidden = false
       }else {
           self.flagBtn.isHidden = true
       }
            correctLbl.text = ""
            options.removeAll()
            alterOptions.removeAll()
            if remainingQuestions.isEmpty {
                correctLbl.text = "All done!"
                
                return
            }
            
            // Select a random question from the remaining ones
            currentQuestion = remainingQuestions.removeFirst()
            
            guard let currentQuestion = currentQuestion else { return }
            alterOptions.append(currentQuestion)
            // Update the question label
            questionLbl.text = "\(currentQuestion.0)?"
            
            // Prepare the answer options
            options = [currentQuestion.1]
             
            // Add three random incorrect options
            while options.count < 4 {
                let randomKanji = dic.randomElement()
                if !options.contains(randomKanji!.1) {
                    options.append(randomKanji!.1)
                    alterOptions.append(randomKanji!)
                }
            }
            
            // Shuffle options and update buttons
            options.shuffle()
            for (i, option) in options.enumerated() {
               // answerButtons[i].setTitle(option, for: .normal)
                if (i == 0) {
                    optionA.setTitle("A: "+option, for: .normal)
                }else if (i == 1){
                    optionB.setTitle("B: "+option, for: .normal)
                }else if (i == 2){
                    optionC.setTitle("C: "+option, for: .normal)
                }else if (i == 3){
                    optionD.setTitle("D: "+option, for: .normal)
                }
            }
        }
    
}
