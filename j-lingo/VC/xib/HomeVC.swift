//
//  HomeVC.swift
//  j-lingo
//
//  Created by as on 8/5/24.
//

import UIKit
import SnapKit
import SideMenu


final class HomeVC: BaseVC {

    
    //MARK: - Properties
    
    var isResourceOpen : Bool =  false
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupXib()
       // showAnimation()
        tblView.sectionHeaderHeight = 0
        setSideBar()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // tblView.reloadSections(IndexSet(integer: 0), with: .right)
        reloadtbl()
    }
    
    //MARK: - API
    
    
    //MARK: - Selectors
    
    //MARK: - helpers
    
    private func reloadtbl(){
        DispatchQueue.main.async {
            
            let indexPath = IndexPath(row: 0, section: 0)
            self.tblView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    private func createLabeledBtnView(withText text: String, btnTag : Int, fontsize : CGFloat = 15, withCenterY : CGFloat = -2) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        // Create and configure the label
        let label = UILabel()
        label.text = text
        label.font = UIFont.init(name: Constants.Font.poppins_regular, size: fontsize)
        view.addSubview(label)
        label.applyDropShadow()
        
        // Create and configure the arrow button
        let arrowButton = UIButton()
        let arrowImage = UIImage(systemName: "arrow.right") // Use SF Symbols for the arrow image
        arrowButton.setImage(arrowImage, for: .normal)
        arrowButton.tintColor = .black // Set the color of the arrow
        arrowButton.isUserInteractionEnabled = true
        arrowButton.tag = btnTag
        arrowButton.addTarget(self, action: #selector(tappedRightArrow(btn:)), for: .touchUpInside)
        view.addSubview(arrowButton)
        
        // Set constraints for the label
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(withCenterY)
        }
        
        // Set constraints for the arrow button
        arrowButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview().offset(withCenterY)
            make.width.height.equalTo(30)
        }
        
        return view
    }
    
    private func createMidBtnView(with vc: HomeVC) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        btn.tintColor = .red
        btn.backgroundColor = .black.withAlphaComponent(0.05)
        btn.layer.cornerRadius = 10
        
        view.addSubview(btn)
        btn.addTarget(vc, action: #selector(tappedArrow), for: .touchUpInside)
        
        btn.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalToSuperview().multipliedBy(0.9)
            
        }
        
        
        return view
    }
    
    private func setSideBar() {
        
        let menu = SideMenuNavigationController(rootViewController: SideBarVC())
        SideMenuManager.default.leftMenuNavigationController = menu

       
        
    }
    
    @objc func showMenu() {
        
        if let menu = SideMenuManager.default.leftMenuNavigationController {
            present(menu, animated: true, completion: nil)
        }
    }

    
   private func setup() {
        tblView.delegate = self
        tblView.dataSource = self
        TitleLbl.text = "Learning Journey"
        menuBtn.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
    }

    private func showAnimation() {
       
        redview.isHidden = false
        redview.animateFillWithColor(Constants.Colors.appcolor, duration: 3.0)
        TitleLbl.zoomIn(duration: 2.0) { _ in
            
        }
    }
    
    private func setupXib(){
        
        tblView.register(ResourceTVCell.self)
        tblView.register(CmnTVCell.self)
        
    }
    
    private func addPullToRefresh() {
        tblView.addPullToRefresh {
            self.loadData {
                self.tblView.reloadData()
                self.tblView.stopRefreshing()
            }
        }
    }
    
    private func loadData(completion: @escaping() -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            completion()
        })
    }
    
    @objc func tappedRightArrow(btn:UIButton) {
        switch btn.tag {
        case CVTag.DQ.rawValue:
            print("dgf")
        default:
            print("u")
        }
    }
    
    @objc func tappedArrow(){
        
        let vc = ResourceVC(nibName: "ResourceVC", bundle: nil)
        let navController = UINavigationController(rootViewController: vc)
        navController.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - tableview delegate methods

extension HomeVC : UITableViewDelegate , UITableViewDataSource {
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    fileprivate func configureResourceCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "ResourceTVCell", for: indexPath) as! ResourceTVCell
        cell.vc = self
        cell.cv.isScrollEnabled = false
        cell.cv.tag = CVTag.resource.rawValue
        
        if isResourceOpen {
            cell.hideview.isHidden = true
            cell.downarrowview.isHidden = true
        } else {
            cell.hideview.isHidden = false
            cell.downarrowview.isHidden = false
        }
        
        return cell
    }
    
    fileprivate func configurePromotionCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "ResourceTVCell", for: indexPath) as! ResourceTVCell
        cell.hideview.isHidden = true
        cell.downArrowBtn.isHidden = true
        cell.downarrowview.isHidden = true
        cell.cv.tag = CVTag.promotion.rawValue
        cell.vc = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        cell.cv.collectionViewLayout = layout
        return cell
    }
    
    fileprivate func configureDQCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell: CmnTVCell = tblView.dequeueReusableCell(for: indexPath)
        cell.vc = self
        cell.cv.tag = CVTag.DQ.rawValue
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 10
        cell.cv.collectionViewLayout = layout
        return cell
    }
    
    fileprivate func configureWQcell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "CmnTVCell", for: indexPath) as! CmnTVCell
        cell.vc = self
        cell.cv.tag = CVTag.WQ.rawValue
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 10
        cell.cv.collectionViewLayout = layout
        return cell
    }
    
    fileprivate func configureCoursesCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "CmnTVCell", for: indexPath) as! CmnTVCell
        cell.vc = self
        cell.cv.tag = CVTag.Courses.rawValue
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        cell.cv.collectionViewLayout = layout
        return cell
    }
    
    private func configureCells(_ indexpath : IndexPath , cvtag:Int, scroolDirection : UICollectionView.ScrollDirection , edge : UIEdgeInsets , minimumSpacing:CGFloat = 0 ,  minimumLineSpacing : CGFloat = 0 ) -> UITableViewCell{
        
        let cell: CmnTVCell = tblView.dequeueReusableCell(for: indexpath)
        cell.vc = self
        cell.cv.tag = cvtag
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scroolDirection
        layout.sectionInset = edge
        layout.minimumInteritemSpacing = minimumSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        cell.cv.collectionViewLayout = layout
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return configureResourceCell(indexPath)
        case 1:
            return configurePromotionCell(indexPath)
        case 2:
            return configureDQCell(indexPath)
        case 3:
            return configureWQcell(indexPath)
        case 4:
            return configureCoursesCell(indexPath)
        case 5:
            return configureCells(indexPath, cvtag: CVTag.Books.rawValue, scroolDirection: .horizontal, edge: UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0))
        case 6:
            return configureCells(indexPath, cvtag: CVTag.OClass.rawValue, scroolDirection: .horizontal, edge: UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0))
        case 7:
            return configureCells(indexPath, cvtag: CVTag.Pt.rawValue, scroolDirection: .horizontal, edge: UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0))
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case (0...9):
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            if isResourceOpen {
                return 520
            } else {
                return 250
            }
        case 1:
            return 160
        case 2:
            return 120
        case 3:
            return 130
        case 4:
            return 300
        case 5:
            return 125
        case 6:
            return 200
        case 7:
            return 150
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            let view = Helper.createLabeledView(withText: "Resources")
            return view
        case 1:
            return UIView()
        case 2:
            return createLabeledBtnView(withText: "Daily Quiz", btnTag: CVTag.DQ.rawValue)
        case 3:
            return createLabeledBtnView(withText: "Weekly Quiz", btnTag: CVTag.WQ.rawValue)
        case 4:
            return createLabeledBtnView(withText: "Courses", btnTag: CVTag.Courses.rawValue,withCenterY: -5)
        case 5:
            return createLabeledBtnView(withText: "Books", btnTag: CVTag.Courses.rawValue,withCenterY: -5)
        case 6:
            return createLabeledBtnView(withText: "Online Class Record", btnTag: CVTag.OClass.rawValue,withCenterY: -5)
        case 7:
            return createLabeledBtnView(withText: "Practice Test", btnTag: CVTag.Pt.rawValue,withCenterY: -5)
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 0 {
            let view = self.createMidBtnView(with: self)
            return view
        } else if (1...6).contains(section) {
            return UIView()
        }else if section == 7{
            return UIView()
        }else {
            return nil
        }
}
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        switch section {
        case CVTag.resource.rawValue:
            return isResourceOpen ? 50.0 : 0.0
        case CVTag.promotion.rawValue, CVTag.DQ.rawValue, CVTag.WQ.rawValue:
            return 0.0
        case CVTag.Pt.rawValue:
            return 30
        default:
            return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case CVTag.resource.rawValue:
            return 20.0
        case CVTag.promotion.rawValue:
            return 0.0
        case CVTag.DQ.rawValue, CVTag.WQ.rawValue, CVTag.Courses.rawValue , CVTag.Books.rawValue , CVTag.OClass.rawValue , CVTag.Pt.rawValue:
            return 10.0
        default:
            return 0.0
        }
    }
}

