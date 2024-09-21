//
//  CourseDetailsCVCell.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit
import Cosmos

final class CourseDetailsCVCell: UICollectionViewCell , NibLoadableView {
    

    weak var vc : UIViewController?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var cosmos: CosmosView!
    @IBOutlet weak var enrollNowBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tappedEnroll(_ sender: Any) {
        if let vc = vc {
            vc.pushWithData(ofType: MyLearningVC.self) { vc in
                vc.fromEnroll = true
            }
        }
    }
}
