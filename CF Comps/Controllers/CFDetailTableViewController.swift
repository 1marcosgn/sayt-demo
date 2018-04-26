//
//  CFDetailTableViewController.swift
//  CF Comps
//
//  Created by Marcos Garcia on 4/19/18.
//  Copyright © 2018 Marcos G. All rights reserved.
//

import UIKit

class CFDetailTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register reusable cell
        tableView.register(UINib(nibName: CFConstants.kCFBannerView, bundle: nil), forCellReuseIdentifier: CFConstants.kCFBannerView)
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func goback() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CFConstants.kCFBannerView) as! CFBannerView
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212.0
    }
 
    
}
