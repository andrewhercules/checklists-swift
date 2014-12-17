import UIKit

class ChecklistViewController: UITableViewController {

  var rowOitem: ChecklistItem
  var row1item: ChecklistItem
  var row2item: ChecklistItem
  var row3item: ChecklistItem
  var row4item: ChecklistItem
  
  required init(coder aDecoder: NSCoder) {
    
    rowOitem = ChecklistItem()
    rowOitem.text = "Get a coffee"
    rowOitem.checked = false
    row1item = ChecklistItem()
    row1item.text = "Pay mobile phone bill"
    row1item.checked = true
    row2item = ChecklistItem()
    row2item.text = "Go to gymnastics"
    row2item.checked = true
    row3item = ChecklistItem()
    row3item.text = "Buy gifts"
    row3item.checked = false
    row4item = ChecklistItem()
    row4item.text = "Donate to Chum Christmas Wish"
    row4item.checked = true
    
    super.init(coder: aDecoder)
  
  }
  
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
    if indexPath.row % 5 == 0 { label.text = rowOitem.text
    } else if indexPath.row % 5 == 1 { label.text = row1item.text
    } else if indexPath.row % 5 == 2 { label.text = row2item.text
    } else if indexPath.row % 5 == 3 { label.text = row3item.text
    } else if indexPath.row % 5 == 4 { label.text = row4item.text
    }
    
    configureCheckmarkForCell(cell, indexPath: indexPath)
    
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
    
      if indexPath.row == 0 {
        rowOitem.checked = !rowOitem.checked
      } else if indexPath.row == 1 {
        row1item.checked = !row1item.checked
      } else if indexPath.row == 2 {
        row2item.checked = !row2item.checked
      } else if indexPath.row == 3 {
        row3item.checked = !row3item.checked
      } else if indexPath.row == 4 {
        row4item.checked = !row4item.checked
      }
      
      configureCheckmarkForCell(cell, indexPath: indexPath)
  
    }
    
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  
  }
  
  func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
  
    var isChecked = false
    
    if indexPath.row == 0 {
      isChecked = rowOitem.checked
    } else if indexPath.row == 1 {
      isChecked = row1item.checked
    } else if indexPath.row == 2 {
      isChecked = row2item.checked
    } else if indexPath.row == 3 {
      isChecked = row3item.checked
    } else if indexPath.row == 4 {
      isChecked = row4item.checked }
    
    if isChecked {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
  }
  

}