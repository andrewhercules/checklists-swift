//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Andrew Hercules on 2014-12-17.
//  Copyright (c) 2014 Andrew Hercules. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
  }
  
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  @IBOutlet weak var textField: UITextField!
  
  @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func done() {
    println("Contents of the text field: \(textField.text)")
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    let oldText: NSString = textField.text
    let newText: NSString = oldText.stringByReplacingCharactersInRange(
      range, withString: string)
    if newText.length > 0 {
        doneBarButton.enabled = true
      } else {
        doneBarButton.enabled = false
    }
    return true
  }
  
}
