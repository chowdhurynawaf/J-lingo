//
//  ViewController.swift
//  j-lingo
//
//  Created by as on 5/30/24.
//



import UIKit



final class SplashVC: UIViewController {
    
    
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var roundView: SphereView!
    @IBOutlet weak private var sunImageView: UIImageView!
    @IBOutlet weak private var roundViewCenterY: NSLayoutConstraint!
    @IBOutlet weak private var jLingoLbl: UILabel!
    @IBOutlet weak private var mountfujiView: MountFujiView!
    @IBOutlet weak private var fujiImageView: UIImageView!
    @IBOutlet weak private var fujiImageWidthCons: NSLayoutConstraint!
    
    let selectedColor = UIColor(red: 238 / 255.0, green: 110 / 255.0, blue: 115 / 255.0, alpha: 1)
    let unselectedColor = UIColor(red: 37 / 255.0, green: 37 / 255.0, blue: 37 / 255.0, alpha: 1)
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.movetoGames()
       
        //self.move()
        //self.gotoTabBar()
        
        setupMainPage()
        
    }
    
    //MARK: - API
    
    
    //MARK: - Selectors
    
    //MARK: - helpers
    
    private func setupMainPage() {
        let u = UserDefaultsHelper()
        let str = u.retrieveString()
        
        if str == "loggedIn" {
            self.gotoTabBar()
        }else {
            self.animateWholeView()
        }
    }
    
    private func gotoTabBar(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showMainTabBarController()
        }
    }
    
    
    func showMainTabBarController() {
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
    
    func createTabBarController(with viewControllers: [(UIViewController, UITabBarItem)]) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers.map { (viewController, tabBarItem) in
            viewController.tabBarItem = tabBarItem
            return viewController
        }
        return tabBarController
    }

    
    private func hideNav() {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func animateAppTitle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.jLingoLbl.isHidden = false
            self.mountfujiView.isHidden = false
            self.jLingoLbl.setAngle(-30.0)
            self.jLingoLbl.animateCursiveWriting(initialText: "J-Lingo", duration: 1.0){
                
                self.moveToLogin()
                
            }
        })
    }
    
    private func animateWholeView() {
        
        DispatchQueue.main.async {
            self.sunImageView.flip360(duration: 0.5, repeatCount: 5)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.sunImageView.animateToZeroSize()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.sunImageView.hideView()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2, execute: {
            self.roundView.fadeIn()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8, execute: {
            
            let safeConstant =   -((self.view.frame.height / 3))
            self.roundViewCenterY.constant = safeConstant
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveLinear, animations: {
                self.view.layoutIfNeeded()
                self.animateMountFuji()
                self.animateAppTitle()
            })
        })
    }
    
    private func moveToLogin(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            let vc = EmailLoginVC(nibName: "EmailLoginVC", bundle: nil)//OptionVC()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.present(vc, animated: true, completion: {
                
            })
            
        }
    }
    
    private func move() {
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)//OptionVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func movetoGames() {
        pushViewController(ofType: GameVC.self)
    }
    
    private func animateMountFuji() {
        self.mountfujiView.isHidden = false
        self.fujiImageView.isHidden = false
        
        UIView.animate(withDuration: 1.2) {
            self.fujiImageWidthCons.constant = Constants.Screen.screenwidth
            self.view.layoutIfNeeded()
        }
    }
}



