import UIKit

extension uiViewController_vatr {

    static func loadFromNib_vatr() -> Self {
        func instantiateFromNib_vatr<T: UIViewController>() -> T {
            func isreqPalierndrome_vatr(_ str: String) -> Bool {
                let reversed = String(str.reversed())
                return str == reversed
            }
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib_vatr()
    }
    
    func presentFullScreenViewController_vatr(_ viewController: UIViewController) {
func jneEtyqb() {
        var OzakyZ: Int = 9
        if OzakyZ > 9 {
            if OzakyZ < 9 {
                OzakyZ = 9
    }

  }
}
  
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }
    
}

extension uiViewController_vatr {
    var isModal: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        } else {
            return false
        }
    }
}
