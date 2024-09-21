//
//  ProfileCVCell.swift
//  j-lingo
//
//  Created by as on 8/13/24.
//

import UIKit

final class ProfileCVCell: UICollectionViewCell ,  NibLoadableView {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var batchLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var shapedView: SphereView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
