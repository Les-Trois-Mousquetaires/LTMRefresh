//
//  ViewController.swift
//  LTMRefresh
//
//  Created by 柯南 on 2020/5/7.
//  Copyright © 2020 LTM. All rights reserved.
//

import UIKit

import GTMRefresh

let RefreshHeight = 150


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .yellow
        self.view.addSubview(self.refreshTableView)
        self.refreshTableView.frame = self.view.frame
       print(Bundle.main.infoDictionary!["CFBundleExecutable"]!);
        let title = Bundle.main.infoDictionary!["CFBundleExecutable"]!
        
        self.refreshTableView.gtm_addRefreshHeaderView {
            print("刷新开始咯")
            self.refreshTableView.endRefreshing()
        }
        
        self.refreshTableView.headerTextColor(.brown)
        self.refreshTableView.headerSucImage(UIImage.init(named: "iam"))
        self.refreshTableView.triggerRefreshing()
        
//        let LTMRefresh: UIRefreshControl = UIRefreshControl.init(frame: .init(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: RefreshHeight))
//        // 菊花颜色
//        LTMRefresh.tintColor = .red
//        LTMRefresh.attributedTitle = NSAttributedString.init(string: title as! String, attributes: [.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(rawValue: 1))])
//        self.refreshTableView.addSubview(LTMRefresh)
//        LTMRefresh.beginRefreshing()
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            print("2秒之后了哦")
//            LTMRefresh.endRefreshing()
//        }
    }

//MARK: - UITableViewDelegate,UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellIdentifier")!
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    
//MARK: - UILAZY
    lazy var refreshTableView: UITableView = {
        let tableview: UITableView = UITableView.init(frame: .zero, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellIdentifier")
        return tableview
    }()
}

