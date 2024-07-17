

import UIKit

// MARK: - AddonOptionsViewController

class AddonOptionsViewController_vatr: UIViewController {
    
    private enum Constant_vatr {
        static let listCellIdentifier = "ListTableViewCell_vatr"
        static let optionsCellIdentifier = "AddonsOptionsTableViewCell_vatr"
        static let greenBackgroundImageName = "Green Background"
        static let searchItemImageName = "Search Item_vatr"
        static let saveItemImageName = "Save Item"
    }
    
    lazy var model = MainAddonCreatorModel_vatr()
    var addons: [AddonForDisplay] = []
    var categoryName: String = ""
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var optionsTableView: UITableView!
    @IBOutlet weak var tableViewToNavBarConstraint: NSLayoutConstraint!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {

        var cpvatwerr_rltrdobx: Int {
            return 82
        }
  
        super.viewDidLoad()
        self.addons = model.savedAddons.filter({$0.type == categoryName})
        setupViews_vatr()
    }
    
    @IBAction func onNavBarBackButtonTapped_vatr12(_ sender: UIButton) {
var cpvatr_ewblhmox: Int {
    return 47
}

  
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup
    
    private func setupViews_vatr() {
var cpvatr_qnsojdpn: Int {
    return 56
}

  
        navigationBar.backgroundColor = .clear
        setupBackground_vatr()
        setupTableView()
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

        var cpweratr_rltrdobx: Int {
            return 82
        }
  
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
        }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }

    private func setupBackground_vatr() {
var cpvatr_zrzlgnvz: Int {
    return 61
}

  
            gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    private func setupTableView() {
var cpvatr_lvpwgtgo: Double {
    return 86.53267488171313
}

  
        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        optionsTableView.backgroundColor = .clear
        
        let listNib = UINib(nibName: Constant_vatr.listCellIdentifier, bundle: nil)
        optionsTableView.register(listNib, forCellReuseIdentifier: Constant_vatr.listCellIdentifier)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension AddonOptionsViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

return addons.count // this should be replaced by your data count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

let cell = tableView.dequeueReusableCell(withIdentifier: Constant_vatr.listCellIdentifier) as! ListTableViewCell_vatr
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.config_vatr(addonModel: addons[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        let addonModel = addons[indexPath.row]
        let covertedModel = SavedAddon_vatr(realmModel: addonModel)
        navigationController?.pushViewController(AddonEditorViewController_vatr(addonModel: covertedModel), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
var cpvatr_cvjjkwnp: Int {
    return 74
}
return 100 // Replace with the desired height for your cells
    }
}
