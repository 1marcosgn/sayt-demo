//
//  CFSearchViewController.swift
//  CF Comps
//
//  Created by Marcos Garcia on 4/13/18.
//  Copyright © 2018 Marcos G. All rights reserved.
//

import UIKit

class CFSearchViewController: UITableViewController {
    
    var competitions: [CFCompetition] = []
    let searchController = UISearchController(searchResultsController: nil)
    var filteredComps = [CFCompetition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //Register reusable cell
        tableView.register(UINib(nibName: CFConstants.kCellNibName, bundle: nil), forCellReuseIdentifier: CFConstants.kCellNibName)
        
        //Setup SearchController
        self.setUpSearchController()
        
        //Setup Competition Array
        self.setUpCompetitionsArray()
        
        tableView.tableFooterView = UIView()
    }

    // MARK: - Private instance methods
    func setUpSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = CFConstants.kSearchPlaceHolder
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func setUpCompetitionsArray() {
        competitions = [CFCompetition(name: "CANWEST GAMES", style: CFCompetition.CFStyle.Individual),
                        CFCompetition(name: "THE GRIND", style: CFCompetition.CFStyle.Individual),
                        CFCompetition(name: "Whiskey Throttle Throwdown VI", style: CFCompetition.CFStyle.Team),
                        CFCompetition(name: "Pride WOD", style: CFCompetition.CFStyle.Team),
                        CFCompetition(name: "Espirit De Corps", style: CFCompetition.CFStyle.Team),
                        CFCompetition(name: "RCF GAMES", style: CFCompetition.CFStyle.Team),
                        CFCompetition(name: "Every Girl Needs a Hero 4", style: CFCompetition.CFStyle.Team),
                        CFCompetition(name: "CASCADE CLASSIC", style: CFCompetition.CFStyle.Individual),
                        CFCompetition(name: "Midnight Murph 4.0", style: CFCompetition.CFStyle.Individual)]
    }
    
    /// Returns true if the text is empty or nil
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    /// Filters the 'competitions' array based on searchText and will put the results in the 'filteredComps' array
    func filterContentForSearchText(_ searchText: String, scope: String = CFConstants.kScope) {
        filteredComps = competitions.filter({ (competition: CFCompetition) -> Bool in
            return competition.style.rawValue.lowercased().contains(searchText.lowercased()) || competition.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    /// Determines if you are currently filtering results or not
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view Delegates
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CFConstants.kCellNibName) as! CFCompCell
        let competition: CFCompetition
        
        if isFiltering() {
            competition = filteredComps[indexPath.row]
    
            guard let searchText = searchController.searchBar.text else {
                return cell
            }
            
            cell.title.attributedText = self.highLight(characters: searchText, inString: competition.name, withColor: UIColor.lightGray)
            
        } else {
            competition = competitions[indexPath.row]
            cell.title.textColor = UIColor.black
            cell.title.text = competition.name
        }
        
        cell.subtitle.text = competition.style.rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Detail View Controller
        let detailVC = CFDetailTableViewController(nibName: CFConstants.kCFDetailView, bundle: Bundle.main)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return CFConstants.kSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredComps.count
        }
        return competitions.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CFConstants.kRowHeight
    }

}

extension CFSearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}


// MARK: - Helper methods
extension CFSearchViewController {
    
    /**
     Highlight a given set of characters in a partiular string
     
     - parameter characters: String with the characters to be higlighted
     - parameter inString: Original String that contains or not the set of highlighted characters
     - parameter withColor: Color used to highlight the characters
     - Returns: An Optional NSAttributedString with the highlighted text
     */
    func highLight(characters: String, inString: String, withColor:UIColor) -> NSAttributedString? {
        let range = (inString.lowercased() as NSString).range(of: characters.lowercased())
        let highLightedText = NSMutableAttributedString.init(string: inString)
        
        highLightedText.addAttribute(NSAttributedStringKey.foregroundColor, value: withColor, range: range)
        return highLightedText
    }
    
}

