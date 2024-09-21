//
//  PromotionCVCell.swift
//  j-lingo
//
//  Created by as on 8/8/24.
//

import UIKit

final class PromotionCVCell: UICollectionViewCell ,  NibLoadableView {
    
    @IBOutlet weak var parentHolderView: DesignableView!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        
        imgView.image = UIImage()
    }

}
