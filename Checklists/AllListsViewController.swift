import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate {

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
  
    for list in lists {
      let item = ChecklistItem()
      item.text = "Item for \(list.name)"
      list.items.append(item)
    }
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
    let checklist = lists[indexPath.row]
    performSegueWithIdentifier("ShowChecklist", sender: checklist)
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowChecklist" {
      let controller = segue.destinationViewController as ChecklistViewController
      controller.checklist = sender as Checklist
    } else if segue.identifier == "AddChecklist" {
      let navigationController = segue.destinationViewController as UINavigationController
      let controller = navigationController.topViewController as ListDetailViewController
      controller.delegate = self
      controller.checklistToEdit = nil
    }
  }
  
  func listDetailViewControllerDidCancel(controller: ListDetailViewController) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func listDetailViewController(controller: ListDetailViewController, didFinishAddingChecklist checklist: Checklist) {
      
      let newRowIndex = lists.count
      lists.append(checklist)
      let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
      let indexPaths = [indexPath]
      tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
      dismissViewControllerAnimated(true, completion: nil)
      
  }
  
  func listDetailViewController(controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist) {
        if let index = find(lists, checklist) {
          let indexPath = NSIndexPath(forRow: index, inSection: 0)
          if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.textLabel!.text = checklist.name
          }
        }
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    lists.removeAtIndex(indexPath.row)
    let indexPaths = [indexPath]
    tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
  }
  
  override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
    let navigationController = storyboard!.instantiateViewControllerWithIdentifier("ListNavigationController") as UINavigationController
    let controller = navigationController.topViewController as ListDetailViewController
    controller.delegate = self
    let checklist = lists[indexPath.row]
    controller.checklistToEdit = checklist
    presentViewController(navigationController, animated: true, completion: nil)
  }
}