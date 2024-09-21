//
//  BaseVC.swift
//  j-lingo
//
//  Created by as on 6/13/24.
//

import UIKit
import Lottie
import SideMenu

class BaseVC: UIViewController {
    
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblViewHolderView: UIView!
    @IBOutlet weak var parentHolderView: UIView!
    @IBOutlet weak var redview: UIView!
    @IBOutlet weak var menuBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        hideNavBar()
        self.menuBtn.isHidden = false
        self.menuBtn.tintColor = .white
        
        
    }
    
    override func loadView() {
        if let nibView = Bundle.main.loadNibNamed("BaseVC", owner: self, options: nil)?.first as? UIView {
            self.view = nibView
        }
    }
    
    
    public func getTitle (_ title: String)  {
        self.TitleLbl.text = title
    }
    
    private func hideNavBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    

    
    @IBAction func tappedMenuBtn(_ sender: Any) {
   
       
    }
    

}
