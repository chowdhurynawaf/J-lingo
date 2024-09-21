//
//  QuizCVCell.swift
//  j-lingo
//
//  Created by as on 8/8/24.
//

import UIKit

final class QuizCVCell: UICollectionViewCell , NibLoadableView {
    
    
    @IBOutlet weak var parentHolderView: UIView!
    @IBOutlet weak var shapedView: UIView!
    @IBOutlet weak var centerLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var lblHeightCons: NSLayoutConstraint!
    @IBOutlet weak var imgview: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        
        centerLbl.text = ""
        titleLbl.text = ""
        imgview.image = UIImage()
        
        super.prepareForReuse()
    }

}
