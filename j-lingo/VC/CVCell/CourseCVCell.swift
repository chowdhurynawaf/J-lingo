//
//  CourseCVCell.swift
//  j-lingo
//
//  Created by as on 8/10/24.
//

import UIKit
import Cosmos

final class CourseCVCell: UICollectionViewCell, NibLoadableView {
    
    
    @IBOutlet weak var parentHolderView: UIView!
    @IBOutlet weak var imageHolderView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var cosmos: CosmosView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
        imgView.image = UIImage()
        titleLbl.text = ""
        namelbl.text = ""
    }
    

}
