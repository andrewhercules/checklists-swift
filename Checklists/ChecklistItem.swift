import Foundation

class ChecklistItem: NSObject, NSCoding {

  var text = ""
  var checked = false
  var dueDate = NSDate()
  var shouldRemind = false
  var itemID: Int
  
  func toggleChecked() {
    checked = !checked
  }

  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(text, forKey: "Text")
    aCoder.encodeBool(checked, forKey: "Checked")
    aCoder.encodeObject(dueDate, forKey: "DueDate")
    aCoder.encodeBool(shouldRemind, forKey: "ShouldRemind")
    aCoder.encodeInteger(itemID, forKey: "ItemID")
  }
  
  required init(coder aDecoder: NSCoder) {
    text = aDecoder.decodeObjectForKey("Text") as String
    checked = aDecoder.decodeBoolForKey("Checked")
    dueDate = aDecoder.decodeObjectForKey("DueDate") as NSDate
    shouldRemind = aDecoder.decodeBoolForKey("ShouldRemind")
    itemID = aDecoder.decodeIntegerForKey("ItemID")
    super.init()
  }
  
  override init() {
    itemID = DataModel.nextChecklistItemID()
    super.init()
  }
  
}