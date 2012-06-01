class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)   
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(PlayersController.alloc.init)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    return true
  end
  
  def players
    playersController = PlayersController.alloc.init
    playersController.window = @window
    @window.rootViewController.pushViewController(playersController, animated: true)
    @window.rootViewController.navigationBar.topItem.title = "Players"
  end

  def player_controller
    @player_controller ||= PlayerController.alloc.init
  end

  def pool_controller
    @pool_controller ||= PoolController.alloc.init
  end
end
