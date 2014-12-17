import UIKit

class ChecklistViewController: UITableViewController {

  var rowOtext = "Get a coffee"
  var row1text = "Pay mobile phone bill"
  var row2text = "Learn iOS development"
  var row3text = "Gymnastics practice"
  var row4text = "Check email messages"
  
  var row0checked = false
  var row1checked = false
  var row2checked = false
  var row3checked = false
  var row4checked = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
    let label = cell.viewWithTag(5) as UILabel
    if indexPath.row % 5 == 0 { label.text = rowOtext
    } else if indexPath.row % 5 == 1 { label.text = row1text
    } else if indexPath.row % 5 == 2 { label.text = row2text
    } else if indexPath.row % 5 == 3 { label.text = row3text
    } else if indexPath.row % 5 == 4 { label.text = row4text
    }
    
    configureCheckmarkForCell(cell, indexPath: indexPath)
    
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
      
      var isChecked = false
      
      if indexPath.row == 0 {
        row0checked = !row0checked
        isChecked = row0checked
      } else if indexPath.row == 1 {
        row1checked = !row1checked
        isChecked = row1checked
      } else if indexPath.row == 2 {
        row2checked = !row2checked
        isChecked = row2checked
      } else if indexPath.row == 3 {
        row3checked = !row3checked
        isChecked = row3checked
      } else if indexPath.row == 4 {
        row4checked = !row4checked
        isChecked = row4checked
      }
      
      if isChecked {
        cell.accessoryType = .Checkmark
      } else {
        cell.accessoryType = .None
      }
    }
  
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  
  }
  
  func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
  
    var isChecked = false
    
    if indexPath.row == 0 {
      isChecked = row0checked
    } else if indexPath.row == 1 {
      isChecked = row1checked
    } else if indexPath.row == 2 {
      isChecked = row2checked
    } else if indexPath.row == 3 {
      isChecked = row3checked
    } else if indexPath.row == 4 {
      isChecked = row4checked }
    
    if isChecked {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
  }
  

}