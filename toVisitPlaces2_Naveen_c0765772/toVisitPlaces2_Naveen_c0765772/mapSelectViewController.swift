//
//  mapSelectViewController.swift
//  toVisitPlaces2_Naveen_c0765772
//
//  Created by Navi Malhotra on 2020-06-15.
//  Copyright © 2020 Naveen Kumar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapSelectViewController: UIViewController {
    
    @IBOutlet var mapView1: MKMapView!
    var address : String?
    var annotation : MKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        annotation!.title = address
        annotation!.subtitle = address
        
                   mapView1.addAnnotation(annotation!)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

