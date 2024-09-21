//
//  ForumCVCell.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit

final class ForumCVCell: UICollectionViewCell , NibLoadableView {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var whenpostedlbl: UILabel!
    @IBOutlet weak var batchlbl: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commnentBtn: UIButton!
    @IBOutlet weak var shortdescriptionLbl: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tappedLikedBtn(_ sender: Any) {
        
        
        
    }
    
    @IBAction func commentBtntapped(_ sender: Any) {
        
        
    }
    
    

}
