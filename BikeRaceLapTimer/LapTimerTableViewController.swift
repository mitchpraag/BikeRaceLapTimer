//
//  LapTimerTableViewController.swift
//  BikeRaceLapTimer
//
//  Created by Mitch Praag on 10/3/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import UIKit

class LapTimerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        let playerAddNotification = UIAlertController(title: "Add Rider", message: "Add a Rider for timing", preferredStyle: .alert)
        playerAddNotification.addTextField { (textField) in
            textField.textColor = UIColor.red
        }
            let doneButton2 = UIAlertAction(title: "Done", style: .default, handler: { (UIalertAction) in
                RiderController.shareInstance.create(riderWithName: (playerAddNotification.textFields?.first?.text)!)
                self.tableView.reloadData()

            })
        playerAddNotification.addAction(doneButton2)
        self.present(playerAddNotification, animated: true, completion: nil)
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCells", for: indexPath) as! CustomTimerTableViewCell
        
        let rider = RiderController.shareInstance.riders[indexPath.row]
        cell.rider = rider
        return cell
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RiderController.shareInstance.riders.count
    }
}


