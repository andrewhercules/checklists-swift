import UIKit

class AllListsViewController: UITableViewController {

  var lists: [Checklist]
  
  required init(coder aDecoder: NSCoder) {
    
    lists = [Checklist]()
    super.init(coder: aDecoder)
    var list = Checklist(name: "Birthdays")
    lists.append(list)
    list = Checklist(name: "Groceries")
    lists.append(list)
    list = Checklist(name: "Cool Apps")
    lists.append(list)
    list = Checklist(name: "To Do")
    lists.append(list)
  
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lists.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "Cell"
    var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
    if cell == nil {
      cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
    }
    let checklist = lists[indexPath.row]
    cell.textLabel!.text = checklist.name
    cell.accessoryType = .DetailDisclosureButton
    return cell
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("ShowChecklist", sender: nil) }
}