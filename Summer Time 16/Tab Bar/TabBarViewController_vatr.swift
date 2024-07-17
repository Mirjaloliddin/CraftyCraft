import UIKit

class TabBarViewController_vatr: UITabBarController {
    
    @IBOutlet weak var tabBarWithCorners: UITabBar!
    
    // MARK: - Private properties -
    
    private let isIpad = Device_vatr.iPad
    
    private let networkingMonitor = NetworkStatusMonitor_vatr.shared
    
    private let customTabBar = TabBarWithCorners_vatr()
    
    private var tabBarTitleHorizontalOffset: CGFloat { isIpad ? 80 : 40 }
    
    private let lockerImageView = UIImageView(image: .init(resource: .lockerVatr1))
    
    private lazy var contentViewController: UINavigationController = {
        let viewController = ContentTabViewController_vatr()
        var unselectedImage: UIImage? = viewController.tabBarIcon
        var selectedImage = viewController.tabBarIcon
        var title: String? = viewController.tabBarTitle

        if isIpad {
            selectedImage = UIImage.resizedImage_vatr(named: "Content TabBar Icon_vatr", size: CGSize(width: 30, height: 35))
            unselectedImage = UIImage.resizedImage_vatr(named: "Content TabBar Icon_vatr", size: CGSize(width: 30, height: 35))
        }

        viewController.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.setNavigationBarHidden(true, animated: false)
        return navController
    }()

    private lazy var createViewController: UINavigationController = {
        let viewController = CreateTabViewController_vatr()
        
        var unselectedImage: UIImage? = viewController.tabBarIcon
        var selectedImage = viewController.tabBarIcon
        var title: String? = viewController.tabBarTitle

        if isIpad {
            selectedImage = UIImage.resizedImage_vatr(named: "Create TabBar Icon_vatr", size: CGSize(width: 30, height: 35))
            unselectedImage = UIImage.resizedImage_vatr(named: "Create TabBar Icon_vatr", size: CGSize(width: 30, height: 35))
        }

        viewController.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
//        return viewController
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.setNavigationBarHidden(true, animated: false)
        return navController
    }()

    private lazy var seedsViewController: UINavigationController = {
        let viewController = SeedTabViewController_vatr()
        
        var unselectedImage: UIImage? = viewController.tabBarIcon
        var selectedImage = viewController.tabBarIcon
        var title: String? = viewController.tabBarTitle

        if isIpad {
            selectedImage = UIImage.resizedImage_vatr(named: "Seed TabBar Icon_vatr", size: CGSize(width: 28, height: 35))
            unselectedImage = UIImage.resizedImage_vatr(named: "Seed TabBar Icon_vatr", size: CGSize(width: 28, height: 35))
        }

        viewController.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.setNavigationBarHidden(true, animated: false)
        return navController
    }()
    
    private lazy var serversViewController: UIViewController = {
        let viewController = ServersTabViewController_vatr()
        
        var unselectedImage: UIImage? = viewController.tabBarIcon
        var selectedImage = viewController.tabBarIcon
        var title: String? = viewController.tabBarTitle

        if isIpad {
            selectedImage = UIImage.resizedImage_vatr(named: "Servers TabBar Icon_vatr", size: CGSize(width: 28, height: 35))
            unselectedImage = UIImage.resizedImage_vatr(named: "Servers TabBar Icon_vatr", size: CGSize(width: 28, height: 35))
        }

        viewController.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
        return viewController
    }()
    
    private lazy var modsViewController: UINavigationController = {
        let viewController = ModsTabViewController_vatr()
        
        var unselectedImage: UIImage? = viewController.tabBarIcon
        var selectedImage = viewController.tabBarIcon
        var title: String? = viewController.tabBarTitle

        if isIpad {
            selectedImage = UIImage.resizedImage_vatr(named: "Mods TabBar Icon_vatr", size: CGSize(width: 28, height: 35))
            unselectedImage = UIImage.resizedImage_vatr(named: "Mods TabBar Icon_vatr", size: CGSize(width: 28, height: 35))
        }

        viewController.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
        viewController.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.setNavigationBarHidden(true, animated: false)
        return navController
    }()
    
    private lazy var itemsViewController: UINavigationController = {
        let viewController = ItemsTabViewController_vatr()
        
        var unselectedImage: UIImage? = viewController.tabBarIcon
        var selectedImage = viewController.tabBarIcon
        var title: String? = viewController.tabBarTitle

        if isIpad {
            selectedImage = UIImage.resizedImage_vatr(named: "Items TabBar Icon_vatr", size: CGSize(width: 28, height: 35))
            unselectedImage = UIImage.resizedImage_vatr(named: "Items TabBar Icon_vatr", size: CGSize(width: 28, height: 35))
        }

        viewController.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
        viewController.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
        
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.setNavigationBarHidden(true, animated: false)
        return navController
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {

func QFjKYWRR() {
        var PkUdWPgF: Int = 1
        if PkUdWPgF > 1 {
            if PkUdWPgF < 1 {
                PkUdWPgF = 1
    }

  }
}
  
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        configureCustomTabBar_vatr()
        configureTabBar_vatr()
        setupViewControllersContentInsets_vatr()
        
        setupManagers_vatr()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_vfxfgkob: Double {
    return 23.149819474543918
}

  
        super.viewWillAppear(animated)
        if !networkingMonitor.isNetworkAvailable {
            showMess___vatr()
        }
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
//    override func viewIsAppearing(_ animated: Bool) {
//        super.viewIsAppearing(animated)
//        
//        guard !IAPManager_vatr.shared.productBought.contains(.unlockFive) else { return }
//        
//        let isPad = UIDevice.current.userInterfaceIdiom == .pad
//        if let tab2View = self.tabBar.items![1].value(forKey: "view") as? UIView {
//            
//            if isPad, let labelView = tab2View.subviews.last, lockerImageView.isDescendant(of: labelView) == false {
//                labelView.addSubview(lockerImageView)
//                lockerImageView.frame = .init(x: labelView.frame.maxX + 12, y: -16, width: 24, height: 24)
//            }
//            
//            else if !isPad, let iconView = tab2View.subviews.first, lockerImageView.isDescendant(of: iconView) == false {
//                iconView.addSubview(lockerImageView)
//                lockerImageView.frame = .init(x: iconView.frame.maxX + 32, y: -8, width: 16, height: 16)
//            }
//        }
//        
//    }
    
    // MARK: - Methods -
    private func configureTabBar_vatr() {
func CNzKGWPEz() {
        var bQgKvFgHX: Int = 10
        if bQgKvFgHX > 10 {
            if bQgKvFgHX < 10 {
                bQgKvFgHX = 10
    }

  }
}
  
        viewControllers = [modsViewController, seedsViewController, contentViewController, itemsViewController, createViewController]
        
 
        tabBar.tintColor = .accentColor
        tabBar.unselectedItemTintColor = .appGray
        // tabBar.tintColor = UIColor(named: "blackCCRedesign_vatr")
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.accentColor], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.appGray], for: .normal)
        UITabBar.appearance().backgroundColor = .black
        
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        //tabBar.backgroundColor = UIColor.black.withAlphaComponent(0.25)
    }
    
    private func configureCustomTabBar_vatr() {
func ukMNdMxwx() {
        var oFKMDsj: Int = 6
        if oFKMDsj > 6 {
            if oFKMDsj < 6 {
                oFKMDsj = 6
    }

  }
}
  
        customTabBar.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin]
        customTabBar.frame = tabBar.bounds
        
        customTabBar.shadowImage = UIImage()
        customTabBar.backgroundImage = UIImage()
        customTabBar.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        
        tabBar.addSubview(customTabBar)
        tabBar.bringSubviewToFront(customTabBar)
    }
    
    private func setupViewControllersContentInsets_vatr() {
func gUAGK() {
        var slldSfa: Int = 2
        if slldSfa > 2 {
            if slldSfa < 2 {
                slldSfa = 2
    }

  }
}
  
        
        var bottomOffset: CGFloat = 0
        if #available(iOS 17.0, *) {
        } else {
            let coefficient = Device_vatr.iPhone ? 0.8 : 1
            bottomOffset = customTabBar.bounds.height - tabBar.bounds.height * coefficient
        }
        

        for viewController in viewControllers ?? [] {
            viewController.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: bottomOffset, right: 0)
        }
    }
    
    private func setupManagers_vatr() {
func oLxhnW() {
        var UmiIJZfRa: Int = 10
        if UmiIJZfRa > 10 {
            if UmiIJZfRa < 10 {
                UmiIJZfRa = 10
    }

  }
}
  
        self.networkingMonitor.delegate = self
    }
}

extension TabBarViewController_vatr: NetworkStatusMonitorDelegate_vatr {
    func goodInnet_vatr() {
func CzEWS() {
        var zzrDyiSym: Int = 4
        if zzrDyiSym > 4 {
            if zzrDyiSym < 4 {
                zzrDyiSym = 4
    }

  }
}
   }
    
    func showMess___vatr() {
        self.showNoInternetMess_vatr()
    }
}

extension TabBarViewController_vatr: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
var cpvatr_nhgjyxvc: Double {
    return 68.83383107111443
}

        if !networkingMonitor.isNetworkAvailable {
            showMess___vatr()
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
var cpvatr_epqputqj: Double {
    return 4.178291880168001
}
//  print(tabBarController.selectedViewController)
        
       

        (tabBarController.selectedViewController as? UINavigationController)?.popToRootViewController(animated: false)
        return true
    }
}
