//
//  TeamsListTableViewController.swift
//  meettheteam
//
//  Created by apple on 03/03/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class TeamsListTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var teamsArray = [Team]()
    var filteredTeamsArray = [Team]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registering the tableview cell
        self.tableView.registerClass(TeamTableViewCell.classForCoder(), forCellReuseIdentifier: "TeamTableViewCell")

        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = GlobalSettings.hexStringToUIColor(GlobalVariables.appColor)

        self.title = "Teams"
        self.loadTeamDataFromJsonFile()
        
    }
    
    //Loading data
    func loadTeamDataFromJsonFile(){
        
        if let filePath = NSBundle.mainBundle().pathForResource("team", ofType: "json"), data = NSData(contentsOfFile: filePath) {
            do {
                let rootArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            
                dispatch_async(dispatch_get_main_queue(),{
                    
                    for dictionary in rootArray{
                        let teamObject = Team(dictionary: dictionary as! [String:AnyObject])
                        self.teamsArray.append(teamObject)
                        
                    }
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        self.reloadTableView()
                    }
                })
             
            }
            catch {
                print("Error while connecting to file")
            }
        }
    }
    func reloadTableView()  {
        self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.active && searchController.searchBar.text != "" {
            return filteredTeamsArray.count
        }
        return teamsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdendifier: String = "TeamTableViewCell"
        var cell: TeamTableViewCell?
        if cell == nil{
            cell = TeamTableViewCell(style: .Default, reuseIdentifier: cellIdendifier)
        }
        cell = tableView.dequeueReusableCellWithIdentifier(cellIdendifier, forIndexPath: indexPath) as? TeamTableViewCell
     
        let teamObject:Team!
        if searchController.active && searchController.searchBar.text != "" {
            teamObject  = filteredTeamsArray[indexPath.row]
        }else{
            teamObject  = teamsArray[indexPath.row]

        }
        cell!.textLabel!.text = "\(teamObject.firstName) \(teamObject.lastName)"

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    
        let detailsViewController = DetailsViewController()
        if searchController.active && searchController.searchBar.text != "" {
            detailsViewController.objectsArray  = filteredTeamsArray
        }else{
             detailsViewController.objectsArray  = teamsArray
            
        }
        detailsViewController.currentIndex = indexPath.row
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredTeamsArray = teamsArray.filter({( team : Team) -> Bool in
            return team.lastName.lowercaseString.containsString(searchText.lowercaseString) || team.firstName.lowercaseString.containsString(searchText.lowercaseString)
        })
        self.reloadTableView()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TeamsListTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension TeamsListTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
