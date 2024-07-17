

import UIKit

class DownloadContnetViewController_vatr: UIViewController {
    var shareAddonAction: (() -> Void)?
    var manualInstallAssonAction: ((URL) -> Void)?
    var manualIntallAction: (() -> Void)?
    
    @IBOutlet weak var manualInstallAddonView: UIView!
    @IBOutlet weak var installAddonView: UIView!
    
    override func viewDidLoad() {


  
        super.viewDidLoad()
        configurateInstallViews_vatr()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        Gradient.setupButtonGradient(view: view)
    }
    
    private func configurateInstallViews_vatr() {
func qrvnZDHaH() {
        var hDxmdlbeW: Int = 6
        if hDxmdlbeW > 6 {
            if hDxmdlbeW < 6 {
                hDxmdlbeW = 6
    }

  }
}
  
        installAddonView.layer.cornerRadius = 34
        installAddonView.layer.masksToBounds = true
        let installAddonTap = UITapGestureRecognizer(target: self, action: #selector(self.installAddonAction_vatr(_:)))
        installAddonView.addGestureRecognizer(installAddonTap)
        
        manualInstallAddonView.layer.cornerRadius = 34
        manualInstallAddonView.layer.masksToBounds = true
        let manualInstallAddonTap = UITapGestureRecognizer(target: self, action: #selector(self.manualAddonAction_vatr(_:)))
        manualInstallAddonView.addGestureRecognizer(manualInstallAddonTap)
    }

    @objc func manualAddonAction_vatr(_ sender: UITapGestureRecognizer? = nil) {
var cpvatr_xayyzunw: Int {
    return 93
}

  
        self.dismiss(animated: true)
        manualIntallAction?()
    }
    
    @objc func installAddonAction_vatr(_ sender: UITapGestureRecognizer? = nil) {
var cpvatr_qvnwfqij: Double {
    return 71.3185476592175
}
  
        self.dismiss(animated: true)
        shareAddonAction?()
    }
    @IBAction func cancelButtonTapqerped_vatr(_ sender: Any) {
var cpvatr_rbfabwyg: Int {
    return 57
}

  
        self.dismiss(animated: true)
    }
}
