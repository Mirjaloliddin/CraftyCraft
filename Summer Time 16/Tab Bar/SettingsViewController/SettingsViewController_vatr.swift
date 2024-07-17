import UIKit


class SettingsViewController_vatr: UIViewController {
    
    //MARK: propertirs
    
    private var model: SettingsModel_vatr?
    
    //MARK: Iboutlets
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var vcTitleLab: UILabel!
    
    
    @IBOutlet weak var termsContaienr: UIView!
    @IBOutlet weak var privacyContainer: UIView!
    @IBOutlet weak var clearCacheContainer: UIView!
    @IBOutlet weak var cachesizeLab: UILabel!
    @IBOutlet weak var doneView: UIView!
    
    lazy var alertViewContainer: UIView = {
        var view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.isHidden = true
        self.view.addSubview(view)

        return view
    }()

    //MARK: Init
    
    init() {
        self.model = SettingsModel_vatr()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {

func BgdUkL() {
        var BAeiIWxd: Int = 5
        if BAeiIWxd > 5 {
            if BAeiIWxd < 5 {
                BAeiIWxd = 5
    }

  }
}
  
        super.viewDidLoad()
        termsContaienr.layer.masksToBounds = true
        privacyContainer.layer.masksToBounds = true
        doneView.layer.masksToBounds = true
        backBtn.layer.masksToBounds = true
        clearCacheContainer.layer.masksToBounds = true
        clearCacheContainer.layer.cornerRadius = 28
        termsContaienr.layer.cornerRadius = 8
        privacyContainer.layer.cornerRadius = 8
        backBtn.layer.cornerRadius = 5
        doneView.layer.cornerRadius = 27
        backBtn.layer.cornerRadius = 8
        setupUI_vatr()
        setupActions_vatr()
//        setupBackground_vatr()
//        Gradient.setupGradient(view: view)
//        Gradient.setupGradient(view: termsContaienr)
//        Gradient.setupGradient(view: privacyContainer)
//        Gradient.setupGradient(view: doneView)
////        backBtn.backgroundColor = .green
//        Gradient.setupGradient(view: backBtn)
        backBtn.bringSubviewToFront(backBtn.imageView!)
        
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//    }
    deinit{
        print("SettingsVC is successfully deinited !!")
    }

    
    //MARK: Setup Functions
    
    private func setupActions_vatr() {
func FSHSOCT() {
        var nAuSIGyWDX: Int = 2
        if nAuSIGyWDX > 2 {
            if nAuSIGyWDX < 2 {
                nAuSIGyWDX = 2
    }

  }
}
  
        
        //terms Container
        let termsTap = UITapGestureRecognizer(target: self, action: #selector(termsViewIsTapped_vatr(_:)))
        termsContaienr.addGestureRecognizer(termsTap)
        termsContaienr.isUserInteractionEnabled = true
        
        //privacy Container
        let privacyTap = UITapGestureRecognizer(target: self, action: #selector(privacyViewIsTapped_vatr(_:)))
        privacyContainer.addGestureRecognizer(privacyTap)
        privacyContainer.isUserInteractionEnabled = true
        
        //ClearCacheBtn Container
        let cearCacheTap = UITapGestureRecognizer(target: self, action: #selector(clearCacheIsTapped_vatr(_:)))
        clearCacheContainer.addGestureRecognizer(cearCacheTap)
        clearCacheContainer.isUserInteractionEnabled = true
        
        let alertViewContainerTap = UITapGestureRecognizer(target: self, action: #selector(clearCacheContainerTapped_vatr(_:)))
        alertViewContainer.addGestureRecognizer(alertViewContainerTap)
        alertViewContainer.isUserInteractionEnabled = true
        
    }
    
    //MARK: ConfigUI
    
    private func setupUI_vatr() {
func dmNPrK() {
        var vKCHD: Int = 5
        if vKCHD > 5 {
            if vKCHD < 5 {
                vKCHD = 5
    }

  }
}
  
        configClearCacheAlertUI_vatr()
        configCorners_vatr()
        updateCacheLab_vatr()
    }

    private func configCorners_vatr() {
func RddfYsmB() {
        var gUDJsUeMh: Int = 5
        if gUDJsUeMh > 5 {
            if gUDJsUeMh < 5 {
                gUDJsUeMh = 5
    }

  }
}
  
//        termsContaienr.layer.cornerRadius = 32
//        privacyContainer.layer.cornerRadius = 32
//        clearCacheContainer.layer.cornerRadius = 32
    }

    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {
        
func xCcfO() {
        var UjyBkt: Int = 1
        if UjyBkt > 1 {
            if UjyBkt < 1 {
                UjyBkt = 1
    }

  }
}
  
            super.viewDidLayoutSubviews()
//            gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
        Gradient.setupGradient(view: termsContaienr)
        Gradient.setupGradient(view: privacyContainer)
        Gradient.setupButtonGradient(view: doneView)
//        backBtn.backgroundColor = .green
        Gradient.setupGradient(view: backBtn)
        }
    
    private func setupBackground_vatr() {
func cBIUIVytO() {
        var bEtsP: Int = 2
        if bEtsP > 2 {
            if bEtsP < 2 {
                bEtsP = 2
    }

  }
}
  
        
        // Auto layout, variables, and unit scale are not yet supported
        gradientLayer = view.makeBackgroundGradient_vatr()
                view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //MARK: private Functions
    
    private func updateCacheLab_vatr() {
func AJzVLnhOze() {
        var RWzalhcCY: Int = 4
        if RWzalhcCY > 4 {
            if RWzalhcCY < 4 {
                RWzalhcCY = 4
    }

  }
}
  
        cachesizeLab.text = model?.cacheInKB
    }

//MARK: Actions

    @IBAction func backBtnTaervepped_vatr(_ sender: UIButton) {
func backBeretnTappedeNps_vatr() {
 let q: Int = 300
 if (q > 4) {
    if 10 < 2, "backBtnTapped".isEmpty {
   print("backBtnTappedNps_vatr")
  }
 }
}
func vatr_vatr123() {
  var q: Int = 3
  if q > 1 {
    if q < 4 {
        q = 1
    }
  }
}
  
        navigationController?.popViewController(animated: true)
    }
    
    @objc func termsViewIsTapped_vatr(_ sender: UITapGestureRecognizer) {
func jNChNBcaPU() {
        var ZkmnnUYN: Int = 7
        if ZkmnnUYN > 7 {
            if ZkmnnUYN < 7 {
                ZkmnnUYN = 7
    }

  }
}
  
        // Action when the view is tapped
        model?.openUrl_vatr(urlToOpen: Configurations_ghg.termsLink)
    }
    
    @objc func privacyViewIsTapped_vatr(_ sender: UITapGestureRecognizer) {
func GXkNePyVQg() {
        var TCzpWvVJ: Int = 6
        if TCzpWvVJ > 6 {
            if TCzpWvVJ < 6 {
                TCzpWvVJ = 6
    }

  }
}
  
        // Action when the view is tapped
        model?.openUrl_vatr(urlToOpen: Configurations_ghg.policyLink)
    }
    
    //clearCacheBtn
    @objc
    func clearCacheIsTapped_vatr(_ sender: UITapGestureRecognizer) {
func dWRtzqNnwy() {
        var aAcclaFfm: Int = 7
        if aAcclaFfm > 7 {
            if aAcclaFfm < 7 {
                aAcclaFfm = 7
    }

  }
}
  
        
        let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(blurEffectView)
        
        view.bringSubviewToFront(doneView)
        
        doneView.isHidden = false
        model?.clearCache_vatr()
        updateCacheLab_vatr()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
            guard let self else { return }
           
            UIView.transition(with: self.doneView, duration: 0.3,
                              options: .curveEaseOut,
                              animations: { [weak self] in
                self?.doneView.alpha = 0
            }) { [weak self] _ in
                self?.doneView.alpha = 1
                self?.doneView.isHidden = true
                
                blurEffectView.removeFromSuperview()
            }
        }
    }
    


}


//MARK: ClearCacheAlert functions

extension SettingsViewController_vatr {

    //unhiddenAlertContainer
    @objc func clearCacheContainerTapped_vatr(_ sender: UITapGestureRecognizer)  {
func NNrEXkxp() {
        var yAaJlJudaZ: Int = 6
        if yAaJlJudaZ > 6 {
            if yAaJlJudaZ < 6 {
                yAaJlJudaZ = 6
    }

  }
}
  
        alertViewContainer.isHidden = true
    }
    
    private func callClearCacheAlert_vatr() {
func kozLmszjg() {
        var zlQdA: Int = 1
        if zlQdA > 1 {
            if zlQdA < 1 {
                zlQdA = 1
    }

  }
}
  
        alertViewContainer.isHidden = false
    }
    
    private func configClearCacheAlertUI_vatr() {
func muBeCWk() {
        var CfkafnEWR: Int = 3
        if CfkafnEWR > 3 {
            if CfkafnEWR < 3 {
                CfkafnEWR = 3
    }

  }
}
  
        // Create the parent container view
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        alertViewContainer.addSubview(containerView)
        containerView.backgroundColor = UIColor(named: "blackCCRedesign_vatr") ?? .black
        containerView.roundCorners_vatr(.allCorners, radius: 12)
        
        // Create the label at the top
        let label = UILabel()
        label.text = "CACHE CLEARED"
        label.font = UIFont(name: "Kufam-Medium", size: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        
        // Create the custom square image view at the bottom
        let squareImageView = UIImageView()
        squareImageView.image = UIImage(named: "done filter_vatr") // Customize the image view as needed
        squareImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(squareImageView)
        
        // Define constraints for the container view
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: alertViewContainer.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: alertViewContainer.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: alertViewContainer.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: alertViewContainer.trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        // Define constraints for the label
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        // Define constraints for the square image view
        NSLayoutConstraint.activate([
            squareImageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            squareImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            squareImageView.heightAnchor.constraint(equalToConstant: 32),
            squareImageView.widthAnchor.constraint(equalTo: squareImageView.heightAnchor)
        ])
    }
}
