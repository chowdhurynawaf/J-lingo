//
//  EmbededVideoCVCell.swift
//  j-lingo
//
//  Created by as on 8/16/24.
//

import UIKit
import WebKit

final class EmbededVideoCVCell: UICollectionViewCell, NibLoadableView {
    
    var vc : UIViewController?
    @IBOutlet weak var embedView: WKWebView!
    @IBOutlet weak var dropButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    deinit {
          // Remove observers if any were added
        embedView?.navigationDelegate = nil
        embedView?.uiDelegate = nil
        embedView?.stopLoading()
        embedView?.removeFromSuperview()
        embedView = nil

         
          
      }
    
    @IBAction func tappedDropBtn(_ sender: Any) {
        
        if let vc = vc {
            vc.navigationController?.popViewController(animated: true)
        }
        
    }
    
    func configure(with url: String) {
           if let videoURL = URL(string: url) {
               let request = URLRequest(url: videoURL)
               embedView.load(request)
           }
       }

}
