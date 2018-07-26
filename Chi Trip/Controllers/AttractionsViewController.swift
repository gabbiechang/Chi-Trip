//
//  AttractionsTableViewController.swift
//  Chi Trip
//
//  Created by Gabbie on 7/24/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import UIKit





//class AttractionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    @IBOutlet weak var tableView: UITableView!
//
//    var attractions = [Attraction]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
//
//
//
//
//
//
//
////    FROM NOTES APP AHHHHHH
////
////    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        // 1
////        return notes.count
////    }
////
////    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
////
////        // 2
////        let note = notes[indexPath.row]
////        cell.noteTitle.text = note.title
////        // 3
////        cell.lastModifiedLabel.text = note.modificationTime.convertToString()
////
////        return cell
////    }
//
////
////
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        // 1
////        return attractions.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "attractionTableViewCell", for: indexPath) as! AttractionTableViewCell
////
////        // 2
////        let attraction = attractions[indexPath.row]
////        cell.attractionLabel.text = attraction.name
//////        cell.attractionThumbImage
////
////        return cell
////    }
//
//
//
//
//
//
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        NetworkManager.getAttractions { (attr) in
//
//            self.attractions = attr
//        }
//    }
//
////    override func viewWillAppear(_ animated: Bool) {
////
////    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
