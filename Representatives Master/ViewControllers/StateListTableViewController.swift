
import UIKit

class StateListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return States.all.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        cell.textLabel?.text = States.all[indexPath.row]
        
        return cell
    }
    
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //        i
        if segue.identifier == "detailSegue" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let destinationVC = segue.destination as? StateDetailTableViewController
            //        o
            let stateTakeOff = States.all[indexPath.row]
            
            destinationVC?.state = stateTakeOff
            
        }
    }
}
