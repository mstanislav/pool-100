class PlayersController < UITableViewController
  attr_accessor :window

  def viewDidLoad
    view.dataSource = view.delegate = self
  end

  def addPlayer
    controller = UIApplication.sharedApplication.delegate.player_controller
    navigationController.pushViewController(controller, animated:true)
  end

  def viewWillAppear(animated)
    navigationItem.title = 'Players'
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'addPlayer')
    view.reloadData
  end

  def tableView(tableView, numberOfRowsInSection:section)
    PlayersStore.shared.players.size
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:CellID)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
    end
    player = get_row(indexPath.row)

    cell.textLabel.text = player.name
    cell.detailTextLabel.text = player.score.to_s
    cell
  end

  def tableView(tableView, editingStyleForRowAtIndexPath:indexPath)
    UITableViewCellEditingStyleDelete
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    player = get_row(indexPath.row)
    PlayersStore.shared.remove_player(player)
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    player = get_row(indexPath.row)
    controller = UIApplication.sharedApplication.delegate.pool_controller
    navigationController.pushViewController(controller, animated:true)
    controller.show_player(player)
  end

private
  def get_row(row)
    PlayersStore.shared.players[row]
  end
end
