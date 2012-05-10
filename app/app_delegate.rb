class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)


    listViewController = ListViewController.alloc.init
    detailsViewController = DetailsViewController.alloc.init
    splitViewController = UISplitViewController.alloc.init    
    splitViewController.delegate = detailsViewController
    listViewController.delegate = detailsViewController    
    detailsNav = UINavigationController.alloc.initWithRootViewController(detailsViewController)    
    splitViewController.viewControllers = [listViewController, detailsNav]
    
    @window.rootViewController = splitViewController
    @window.makeKeyAndVisible;
    true
  end
end
