//
//  TableViewController.swift
//  LugaresFavoritos
//
//  Created by Romildo Jozue Paiter on 4/5/16.
//  Copyright © 2016 Paiter Tecnologia. All rights reserved.
//

import UIKit

var places = [Dictionary<String, String>()]

var activePlace = -1;

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ao se criar um dictinary, ele já vem um item devemos remover esse item 
        if places.count == 1 {
            places.removeAtIndex(0)
            
            // Adicionando um local de teste.
            places.append(["name": "Taj Mahal", "lat": "27.1754868012591", "lon": "78.04219077962989"])
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "mapSegue" {
            activePlace = -1
        }
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
        return places.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = places[indexPath.row]["name"]
        
        return cell
    }

    /**
    * Função responsavel por passar a informação de um linha do tableView selecionada para passar para o 
    * próximo controller ViewController que esta controlando o mapa.
    */
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        print("Cliquei na linha \(indexPath.row)")
        activePlace = indexPath.row
        return indexPath
    }
    
    /**
    * Função responsavel por to
    */
    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear: TableViewController")
        tableView.reloadData()
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
