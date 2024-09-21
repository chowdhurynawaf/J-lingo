//
//  MyLearningCVCell.swift
//  j-lingo
//
//  Created by as on 8/12/24.
//

import UIKit

final class MyLearningCVCell: UICollectionViewCell , NibLoadableView{
    
    @IBOutlet weak var parentHolderView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var ContentTitle: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var stkView: UIStackView!
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var startCourseBtn: UIButton!
    @IBOutlet weak var percentageHolderView: UIView!
    @IBOutlet weak var percentageView: UIView!
    @IBOutlet weak var percentageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tappedStartCourse(_ sender: Any) {
        
    }
    

}
