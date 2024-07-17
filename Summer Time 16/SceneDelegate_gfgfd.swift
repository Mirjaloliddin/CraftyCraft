import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    static weak var shared: SceneDelegate?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.overrideUserInterfaceStyle = .dark
        
        window?.isMultipleTouchEnabled = false
        UIView.appearance().isExclusiveTouch = true
        
        
        l0adApp()
        DropBoxParserFiles_vatr.shared.zetupDropBox_vatr()

        Self.shared = self
        
    }
    
    func l0adApp() -> Void {
        let tabBarVC = LoadingViewController()
        let navVC = UINavigationController(rootViewController: tabBarVC)
        navVC.setNavigationBarHidden(true, animated: false)
        navVC.navigationBar.isHidden = true
        window?.overrideUserInterfaceStyle = .unspecified
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {


  
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {


  
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {


  
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {


  
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {


  
        
    }
}
