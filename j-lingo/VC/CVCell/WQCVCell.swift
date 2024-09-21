//
//  WQCVCell.swift
//  j-lingo
//
//  Created by as on 8/11/24.
//

import UIKit

final class WQCVCell: UICollectionViewCell , NibLoadableView {
    
    @IBOutlet weak var parentHolderView: DesignableView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var centerLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        
        img.image = UIImage()
        lbl.text = ""
        centerLbl.text = ""
        
        super.prepareForReuse()
        
    }

}
