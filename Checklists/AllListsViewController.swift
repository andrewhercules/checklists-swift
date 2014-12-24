import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate {
  
  var dataModel: DataModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataModel.lists.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cellIdentifier = "Cell"
    var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
    if cell == nil {
      cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
    }
    
    let checklist = dataModel.lists[indexPath.row]
    cell.textLabel!.text = checklist.name
    cell.accessoryType = .DetailDisclosureButton
    
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let checklist = dataModel.lists[indexPath.row]
    performSegueWithIdentifier("ShowChecklist", sender: checklist)
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath) {
    dataModel.lists.removeAtIndex(indexPath.row)
    
    let indexPaths = [indexPath]
    tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
  }
  
  override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
    let navigationController = storyboard!.instantiateViewControllerWithIdentifier("ListNavigationController") as UINavigationController
    
    let controller = navigationController.topViewController as ListDetailViewController
    controller.delegate = self
    
    let checklist = dataModel.lists[indexPath.row]
    controller.checklistToEdit = checklist
    
    presentViewController(navigationController, animated: true, completion: nil)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowChecklist" {
      let controller = segue.destinationViewController as ChecklistViewController
      controller.checklist = sender as Checklist
    } else if segue.identifier == "AddChecklist" {
      let navigationController = segue.destinationViewController
        as UINavigationController
      let controller = navigationController.topViewController
        as ListDetailViewController
      controller.delegate = self
      controller.checklistToEdit = nil
    }
  }
  
  func listDetailViewControllerDidCancel(controller: ListDetailViewController) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func listDetailViewController(controller: ListDetailViewController, didFinishAddingChecklist checklist: Checklist) {
    let newRowIndex = dataModel.lists.count
    
    dataModel.lists.append(checklist)
    
    let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
    let indexPaths = [indexPath]
    tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func listDetailViewController(controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist) {
    if let index = find(dataModel.lists, checklist) {
      let indexPath = NSIndexPath(forRow: index, inSection: 0)
      if let cell = tableView.cellForRowAtIndexPath(indexPath) {
        cell.textLabel!.text = checklist.name
      }
    }
    dismissViewControllerAnimated(true, completion: nil)
  }
}
