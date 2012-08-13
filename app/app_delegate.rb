class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)   
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(PlayersController.alloc.init)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end

  def player_controller
    @player_controller ||= PlayerController.alloc.init
  end

  def pool_controller
    @pool_controller ||= PoolController.alloc.init
  end

  def rules_controller
    @rules_controller ||= RulesController.alloc.init
  end
end
