import UIKit

class ChecklistViewController: UITableViewController {

  var items: [ChecklistItem]
  
  required init(coder aDecoder: NSCoder) {
    
    items = [ChecklistItem]()
    
    let row0item = ChecklistItem()
    row0item.text = "Get a coffee"
    row0item.checked = false
    items.append(row0item)
    
    let row1item = ChecklistItem()
    row1item.text = "Pay mobile phone bill"
    row1item.checked = true
    items.append(row1item)
    
    let row2item = ChecklistItem()
    row2item.text = "Go to gymnastics"
    row2item.checked = true
    items.append(row2item)
    
    let row3item = ChecklistItem()
    row3item.text = "Buy gifts"
    row3item.checked = false
    items.append(row3item)
    
    let row4item = ChecklistItem()
    row4item.text = "Donate to holiday toy drive"
    row4item.checked = true
    items.append(row4item)
    
    let row5item = ChecklistItem()
    row5item.text = "Buy bus tokens"
    row5item.checked = false
    items.append(row5item)
    
    super.init(coder: aDecoder)
  
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
    let item = items[indexPath.row]
    let label = cell.viewWithTag(5) as UILabel
    label.text = item.text
    configureCheckmarkForCell(cell, indexPath: indexPath)
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
      let item = items[indexPath.row]
      item.checked = !item.checked
      configureCheckmarkForCell(cell, indexPath: indexPath)
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
    let item = items[indexPath.row]
    if item.checked {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
  }
  

}