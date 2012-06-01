class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)   
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(PoolController.alloc.init)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    @window.rootViewController.navigationBar.topItem.title = "Pool to 100"
    @window.rootViewController.navigationBar.topItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Settings", style: 0, target: self, action: "settings")

    return true
  end
  
  def settings
    settingsController = SettingsController.alloc.init
    settingsController.window = @window
    @window.rootViewController.pushViewController(settingsController, animated: true)
    @window.rootViewController.navigationBar.topItem.title = "Settings"
  end
end
