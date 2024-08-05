//
//  BaseVC.swift
//  j-lingo
//
//  Created by as on 6/13/24.
//

import UIKit

class BaseVC: UIViewController {
    
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblViewHolderView: UIView!
    @IBOutlet weak var parentHolderView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func loadView() {
        if let nibView = Bundle.main.loadNibNamed("BaseVC", owner: self, options: nil)?.first as? UIView {
            self.view = nibView
        }
    }
    
    
    public func getTitle (_ title: String)  {
        self.TitleLbl.text = title
    }


}
