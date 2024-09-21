//
//  ToastHelper.swift
//  j-lingo
//
//  Created by as on 8/3/24.
//

import UIKit

final class ToastHelper {
    
    static func showToast(imageName: String = "sad", titleStr: String = "Uh, Oh!", subtitleStr: String = "Something went wrong") {
        
        guard let image = UIImage(named: imageName) else {
            return
        }
        
        let toast = Toast.default(
            image: image,
            title: titleStr,
            subtitle: subtitleStr
        )
        
        toast.show()
    }

}
