//
//  MapTableViewController.swift
//  toVisitPlaces2_Naveen_c0765772
//
//  Created by Navi Malhotra on 2020-06-15.
//  Copyright © 2020 Naveen Kumar. All rights reserved.
//

import UIKit
import  CoreLocation
import MapKit

class MapTableViewController: UITableViewController {
    
    var templat = [Double]()
    var templong = [Double]()
    var tempaddress = [String]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let defaults = UserDefaults.standard
//        let dictionary = defaults.dictionaryRepresentation()
//        dictionary.keys.forEach { key in
//            defaults.removeObject(forKey: key)
        
//        }
//
}
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        templat = defaults.array(forKey: "locationlat") as! [Double] 
        if templat.count > 0
        {
        return templat.count
        }
        return 0
    }
    
    
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                
       
            templat = defaults.array(forKey: "locationlat") as! [Double]
         templong = defaults.array(forKey: "locationlong") as! [Double]
        tempaddress = defaults.stringArray(forKey: "locationaddress")!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstcell", for: indexPath)
        cell.textLabel?.text = tempaddress[indexPath.row]
        cell.detailTextLabel?.text = " \(templat[indexPath.row])  \(templong[indexPath.row])"
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let defaults = UserDefaults.standard
        templat = defaults.array(forKey: "locationlat") as! [Double]
         templong = defaults.array(forKey: "locationlong") as? [Double] ?? [Double]()
         tempaddress = defaults.stringArray(forKey: "locationaddress") ?? [String]()
        
        
        let currlat =  templat[indexPath.row]
        let currlong =  templong[indexPath.row]
        let curraddress = tempaddress[indexPath.row]
        
     
               
        let newVC = storyboard!.instantiateViewController(identifier: "mapVC") as! mapSelectViewController
        
        let coordinate = CLLocationCoordinate2D(latitude: currlat, longitude: currlong)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        newVC.annotation = annotation
        newVC.address = curraddress
        
        
        
               
                     
                     navigationController?.pushViewController(newVC, animated: true)
           }
        

    
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tempaddress.remove(at: indexPath.row)
             templat.remove(at: indexPath.row)
             templong.remove(at: indexPath.row)
            
          defaults.set(templat, forKey: "locationlat")
          defaults.set(templong, forKey: "locationlong")
        defaults.set(tempaddress, forKey: "locationaddress")
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
   
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
