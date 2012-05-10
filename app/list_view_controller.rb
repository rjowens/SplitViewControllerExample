class ListViewController < UITableViewController
  attr_accessor :delegate

  def viewDidLoad
    @links = ['http://www.rubymotion.com/', 'http://www.github.com/', 'rubymotion.com', 'google.com']
  end    
  
  def shouldAutorotateToInterfaceOrientation(*)
    true
  end
  
  def numberOfSetionsInTableView(tableView)
    1
  end
  
  def tableView(tableView, numberOfRowsInSection:section) 
    @links.length
  end
  
  def tableView(tableView, cellForRowAtIndexPath:path)
    cell = tableView.dequeueReusableCellWithIdentifier("cell") || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"cell")
    cell.textLabel.text = @links[path.row]
    cell
  end
  
  def tableView(tableView, didSelectRowAtIndexPath:path)  
    @delegate.openURL(@links[path.row]) if @delegate.respond_to?'openURL'
  end
  
end