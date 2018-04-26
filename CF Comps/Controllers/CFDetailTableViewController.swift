//
//  CFDetailTableViewController.swift
//  CF Comps
//
//  Created by marcosgn1 on 4/19/18.
//  Copyright © 2018 Marcos G. All rights reserved.
//

import UIKit

class CFDetailTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New Title" style:UIBarButtonItemStylePlain target:nil action:nil];

        
        //self.navigationItem.backBarButtonItem?.title = "Back"
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: goback())
        
        //Register reusable cell
        tableView.register(UINib(nibName: "CFBannerView", bundle: nil), forCellReuseIdentifier: "CFBannerView")
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CFBannerView") as! CFBannerView
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212.0
    }
 
    
}
