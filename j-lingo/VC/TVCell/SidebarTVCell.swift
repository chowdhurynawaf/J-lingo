//
//  SidebarTVCell.swift
//  j-lingo
//
//  Created by as on 8/14/24.
//

import UIKit

final class SidebarTVCell: UITableViewCell , NibLoadableView{
    
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}
