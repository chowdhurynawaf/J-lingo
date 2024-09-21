//
//  ChangVC.swift
//  j-lingo
//
//  Created by as on 8/5/24.
//

import UIKit
import Lottie
import SDWebImage

class ChangVC: UIViewController {
    
    
    @IBOutlet weak var changImgView: SDAnimatedImageView!
    @IBOutlet weak var loaderView: LottieAnimationView!
    @IBOutlet weak var loadingLbl: UILabel!
    @IBOutlet weak var parentview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showLoader()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gotoTabBar))
        parentview.addGestureRecognizer(gesture)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        showChang()
    }
    
    private func showChang() {
       
        changImgView.center = self.view.center
        
        if let gifPath = Bundle.main.path(forResource: "chang", ofType: "gif"),
           let gifData = try? Data(contentsOf: URL(fileURLWithPath: gifPath)) {
            let animatedImage = SDAnimatedImage(data: gifData)
            changImgView.image = animatedImage
        }
    }
    
    fileprivate func showLoader() {
        
        loaderView.loopMode = .loop
        loaderView.contentMode = .scaleAspectFit
        loaderView.play()
    }
    
    
    
    @objc func gotoTabBar() {
        
       showMainTabBarController()
    }
    
    private func showMainTabBarController() {
            // Initialize view controllers with XIB files
            let firstViewController = HomeVC(nibName: "HomeVC", bundle: nil)
            let secondViewController = MyLearningVC(nibName: "MyLearningVC", bundle: nil)
            let thirdViewController = NotificationVC(nibName: "NotificationVC", bundle: nil)
            let fourthViewController = GameVC(nibName: "GameVC", bundle: nil)
            let fifthViewController = ProfileVC(nibName: "ProfileVC", bundle: nil)
        
            let firstNavController = UINavigationController(rootViewController: firstViewController)
            let secondNavController = UINavigationController(rootViewController: secondViewController)
            let thirdNavController = UINavigationController(rootViewController: thirdViewController)
            let fourthNavController = UINavigationController(rootViewController: fourthViewController)
            let fifthNavController = UINavigationController(rootViewController: fifthViewController)
            
            // Create UITabBarItem instances
            let firstTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
            let secondTabBarItem = UITabBarItem(title: "My Learning", image: UIImage(systemName: "book"), tag: 1)
            let thirdTabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), tag: 2)
            let fourthTabBarItem = UITabBarItem(title: "Games", image: UIImage(systemName: "gamecontroller"), tag: 3)
            let fifthTabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 4)
            
            // Create the Tab Bar Controller with the reusable function
            let tabBarController = createTabBarController(with: [
                (firstNavController, firstTabBarItem),
                (secondNavController, secondTabBarItem),
                (fourthNavController, fourthTabBarItem),
                (thirdNavController, thirdTabBarItem),
                (fifthNavController, fifthTabBarItem)
            ])
        
            tabBarController.tabBar.backgroundColor = .white
            tabBarController.tabBar.tintColor = .black
            
            // Transition to the tab bar controller
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = tabBarController
                window.makeKeyAndVisible()
                
                // Optionally add a transition animation
                let transition = CATransition()
                transition.type = .fade
                transition.duration = 0.3
                window.layer.add(transition, forKey: kCATransition)
            }
        }
    
    private func createTabBarController(with viewControllers: [(UIViewController, UITabBarItem)]) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers.map { (viewController, tabBarItem) in
            viewController.tabBarItem = tabBarItem
            return viewController
        }
        return tabBarController
    }
}
