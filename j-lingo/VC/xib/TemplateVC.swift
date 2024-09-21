//
//  TemplateVC.swift
//  j-lingo
//
//  Created by as on 8/5/24.
//

import UIKit

class TemplateVC: UIViewController {
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var parentHolderView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        if let nibView = Bundle.main.loadNibNamed("TemplateVC", owner: self, options: nil)?.first as? UIView {
            self.view = nibView
        }
    }

    
    @IBAction func tappedMenuBtn(_ sender: Any) {
        
    }
    
    @IBAction func tappedBackBtn(_ sender: Any) {
        
    }
    
    
    
}
