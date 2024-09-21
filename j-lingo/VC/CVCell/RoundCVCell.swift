//
//  RoundCVCell.swift
//  j-lingo
//
//  Created by as on 8/6/24.
//

import UIKit

final class RoundCVCell: UICollectionViewCell , NibLoadableView {
    
    @IBOutlet weak var parentHolderView: DesignableView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var centerLbl: UILabel!
    @IBOutlet weak var topCons: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        
        img.image = UIImage()
        lbl.text = ""
        centerLbl.text = ""
    }

}
