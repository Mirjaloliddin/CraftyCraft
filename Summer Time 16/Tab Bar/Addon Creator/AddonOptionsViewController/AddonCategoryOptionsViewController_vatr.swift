

import UIKit

enum AddonCategoryOptionsSection_vatr: Int, CaseIterable {
    case category = 0
    case items = 1
}

class AddonCategoryOptionsViewController_vatr: UIViewController {
    
    private enum Constant_vatr {
        static let listCellIdentifier = "ListTableViewCell_vatr"
        static let optionsCellIdentifier = "AddonsOptionsTableViewCell_vatr"
        static let greenBackgroundImageName = "Green Background"
        static let searchItemImageName = "Search Item_vatr"
        static let saveItemImageName = "Save Item"
    }
    
    lazy var model = MainAddonCreatorModel_vatr()
    
    // MARK: - IBOutlets
    @IBOutlet weak var btnCollectionView: UICollectionView!
    
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var optionsTableView: UITableView!
    @IBOutlet weak var tableViewToNavBarConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    var btnItems = [
    ButtonsType(text: "GROUPS", isSelect: true),
    ButtonsType(text: "ITEMS", isSelect: false),
    
    ]
    
    var isItem = false
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setupViews_vatr()
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
    
    @IBAction func onNavBarBackButtonTapped_vatr23(_ sender: UIButton) {

        var rerefeferf: [Bool] {
                return (1...5).map { _ in Bool.random() }
            }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup
    
    private func setupViews_vatr() {
        navigationBar.backgroundColor = .clear
        setupBackground_vatr()
        setupTableView()
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

        var referf: [Bool] {
                return (1...5).map { _ in Bool.random() }
            }
        
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        }

    private func setupBackground_vatr() {
            gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    private func setupTableView() {
        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        optionsTableView.backgroundColor = .clear
        
        let listNib = UINib(nibName: Constant_vatr.listCellIdentifier, bundle: nil)
        optionsTableView.register(listNib, forCellReuseIdentifier: Constant_vatr.listCellIdentifier)
        btnCollectionView.delegate = self
        btnCollectionView.dataSource = self
        btnCollectionView.register(UINib(nibName: "BtnCollectionCell", bundle: nil), forCellWithReuseIdentifier: "BtnCollectionCell")
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension AddonCategoryOptionsViewController_vatr: UITableViewDelegate, UITableViewDataSource {
  

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if isItem {
            return model.itemsAddons.count
        }else {
            return model.categories.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

let cell = tableView.dequeueReusableCell(withIdentifier: Constant_vatr.listCellIdentifier) as! ListTableViewCell_vatr
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        if !isItem {
            cell.configCategory_vatr(category: model.categories[indexPath.row])
        }else {
            cell.config_vatr(addonModel: model.itemsAddons[indexPath.row])
        }
        
        
//        if indexPath.section == AddonCategoryOptionsSection_vatr.items.rawValue {
//            cell.config_vatr(addonModel: model.itemsAddons[indexPath.row])
//        } else {
//            cell.configCategory_vatr(category: model.categories[indexPath.row])
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        if isItem {
            let addonModel = model.itemsAddons[indexPath.row]
            let covertedModel = SavedAddon_vatr(realmModel: addonModel)
            navigationController?.pushViewController(AddonEditorViewController_vatr(addonModel: covertedModel), animated: true)
        } else {
            let nextVC = AddonOptionsViewController_vatr()
            nextVC.categoryName = model.categories[indexPath.row].categoryName
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

return ListTableViewCell_vatr.defaultCellHeiht // Replace with the desired height for your cells
    }
}

extension AddonCategoryOptionsViewController_vatr: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return AddonCategoryOptionsSection_vatr.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BtnCollectionCell", for: indexPath) as? BtnCollectionCell else {return UICollectionViewCell()}
        cell.updateCell(item: btnItems[indexPath.item])
        return cell
       
    }
}

extension AddonCategoryOptionsViewController_vatr: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 107, height: 44)
    }
    
}

extension AddonCategoryOptionsViewController_vatr: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<btnItems.count  {
            if i == indexPath.item {
                btnItems[i].isSelect = true
            }else {
                btnItems[i].isSelect = false
            }
            
            if btnItems[1].isSelect {
                isItem = true
            }else {
                isItem = false
            }
        }
        optionsTableView.reloadData()
        btnCollectionView.reloadData()
        
    }
}
