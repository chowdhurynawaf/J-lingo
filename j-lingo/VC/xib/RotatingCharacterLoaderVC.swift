//
//  RotatingCharacterLoaderVC.swift
//  j-lingo
//
//  Created by Macbook Pro on 10/18/24.
//

import UIKit

class RotatingCharacterLoaderVC: UIViewController {
    
    @IBOutlet weak var loaderview: UIView!
    @IBOutlet weak var loaderTextView: CircularTextView!
    
    let mixed = [
        "あ", "い", "う", "え", "お", // Hiragana
        "ア", "イ", "ウ", "エ", "オ", // Katakana
        "日", "本", "語", "学", "生" // Kanji
    ]
    
    let hiragana = [
        "あ", "い", "う", "え", "お", // Hiragana
        "か", "き", "く", "け", "こ",
        "さ", "し", "す", "せ", "そ"
    ]

    let katakana = [
        "ア", "イ", "ウ", "エ", "オ", // Katakana
        "カ", "キ", "ク", "ケ", "コ"
        
    ]

    let kanji = [
        "日", "月", "火", "水", "木", // Days of the week
        "金", "土"
    ]

    let kanjiExtra = [
        "山", "川", "田", "花", "鳥", // Additional Kanji
        
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       setLayers()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        loaderTextView.startRotating()
    }
    
    
    override func loadView() {
        if let nibView = Bundle.main.loadNibNamed("RotatingCharacterLoaderVC", owner: self, options: nil)?.first as? UIView {
            self.view = nibView
        }
    }
    
    private func setLayers() {
        loaderTextView.layers = [
                   CircularTextView.Layer(
                       texts: kanjiExtra,
                       radius: 30,
                       rotationSpeed: 0.05,
                       font: UIFont.systemFont(ofSize: 16),
                       textColor: UIColor.red,
                       alpha: 1.0,
                       direction: .clockwise
                   ),
                   CircularTextView.Layer(
                       texts: kanji,
                       radius: 60,
                       rotationSpeed: 0.03,
                       font: UIFont.boldSystemFont(ofSize: 18),
                       textColor: UIColor.blue,
                       alpha: 0.8,
                       direction: .counterclockwise
                   ),
                   CircularTextView.Layer(
                       texts: katakana,
                       radius: 90,
                       rotationSpeed: 0.02,
                       font: UIFont.italicSystemFont(ofSize: 20),
                       textColor: UIColor.green,
                       alpha: 0.6,
                       direction: .clockwise
                   ),
                   CircularTextView.Layer(
                       texts: hiragana,
                       radius: 120,
                       rotationSpeed: 0.01,
                       font: UIFont.systemFont(ofSize: 22),
                       textColor: UIColor.purple,
                       alpha: 0.4,
                       direction: .counterclockwise
                   ),
                   
                   CircularTextView.Layer(
                       texts: mixed,
                       radius: 150,
                       rotationSpeed: 0.01,
                       font: UIFont.systemFont(ofSize: 22),
                       textColor: UIColor.purple,
                       alpha: 0.4,
                       direction: .clockwise
                   )
               ]
    }
    
    private func showChangView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
            let vc = ChangVC(nibName: "ChangVC", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        })
        
    }
}
