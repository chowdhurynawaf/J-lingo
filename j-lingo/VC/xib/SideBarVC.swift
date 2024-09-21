//
//  SideBarVC.swift
//  j-lingo
//
//  Created by as on 8/14/24.
//

import UIKit

final class SideBarVC: UITableViewController {
    
    private var dic: [String: String] = [
          "Message": "envelope",
          "Forum": "bubble.left.and.bubble.right",
          "LeaderBoard": "rosette",
          "Statistics": "chart.bar.xaxis"
      ]
    
    var nameArr: [String] = ["Message","Forum","LeaderBoard","Statistics"]
    var iconName : [String] = ["envelope", "bubble.left.and.bubble.right","rosette","chart.bar.xaxis"]
      
    override func viewDidLoad() {
        super.viewDidLoad()

      setup()
        
    }
    
    private func setup () {
        
        tableView.register(SidebarTVCell.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Array(dic.keys).count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SidebarTVCell", for: indexPath) as! SidebarTVCell

        cell.lbl.text = nameArr[indexPath.row]
        cell.img.image = UIImage.init(systemName: iconName[indexPath.row])
        cell.img.tintColor = .black

        return cell
    }
    
    fileprivate func gotoVC(_ indexPath: IndexPath) {
     
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            pushViewController(ofType: AllMessageVC.self)
        case 1:
            pushViewController(ofType: ForumVC.self)
        case 2:
            pushViewController(ofType: LeadershipByCategoryVC.self)
        case 3:
            pushViewController(ofType: ChartVC.self)
        case 4:
            print("")
        case 5:
            print("")
        default:
            print("")
        }
    }
}

struct Feature {
    let name: String
    let icon: String
}
