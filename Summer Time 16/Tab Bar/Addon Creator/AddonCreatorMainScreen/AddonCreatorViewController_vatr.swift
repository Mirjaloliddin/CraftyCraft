
import UIKit

class AddonCreatorViewController_vatr: UIViewController {
    
    var model = CreatedAddonsModel_vatr()

    // MARK: - Outlets
    @IBOutlet private weak var navigationBar: UIView!
    @IBOutlet weak var addonCollectionView: UICollectionView!
    @IBOutlet private weak var searchFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var searchBarButton: UIButton!
    @IBOutlet weak var seatchTextField: TintedTextField_vatr!
//    @IBOutlet private weak var tabsStackView: UIStackView!
    
//    @IBOutlet private weak var layouTabButton: UIButton!
//    @IBOutlet private weak var groupTabButton: UIButton!
//    @IBOutlet private weak var recentTabButton: UIButton!
    
    private var suggestionsTableView: UITableView?
    internal weak var downloadButton_vatr: UIButton?

    // MARK: - UI Related Properties
    private let tabChoosedColor: UIColor = UIColor(red: 15/255, green: 71/255, blue: 60/255, alpha: 1)
    private let tabUnchoosedColor: UIColor = UIColor(red: 22/255, green: 103/255, blue: 87/255, alpha: 1)
    private var blurEffectView: UIVisualEffectView?

    // MARK: - State
    private var _tabsPageControllMode: TabsPageController_vatr = .layout
    private var tabsPageControllMode: TabsPageController_vatr {
        set {
            guard _tabsPageControllMode != newValue else {
                return
            }
            
            _tabsPageControllMode = newValue
            
           //  updatePageControllerUI()
        }
        get {
            _tabsPageControllMode
        }
    }

    var searchFieldMode: Bool = false {
        didSet {
            switchSearchMode_vatr()
        }
    }

    private var darkGreenMode: Bool = true {
        didSet {
            changeSearchBarAppearance_vatr()
        }
    }

    // MARK: - Enums
    
    private enum TabsPageController_vatr: Int {
        case layout = 0
        case group = 1
        case recent = 2
    }

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {

func isbYRgJq() {
        var bSmGCnB: Int = 6
        if bSmGCnB > 6 {
            if bSmGCnB < 6 {
                bSmGCnB = 6
    }

  }
}
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround_vatr()
        
        setupCollectionView_vatr()
        
        configureUIComponents_vatr()
        configureSearchBar_vatr()
        // setupTabButtons()
        setupBackground_vatr()
        setupCollectionViewAndNavigationBar_vatr()
      //   updatePageControllerUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_ziucjpqw: Int {
    return 82
}

        super.viewWillAppear(animated)
        
        model.updateCreatedAddons_vatr()
        addonCollectionView.reloadData()
        registerForKeyboardNotifications_vatr()
        updateSearchListIfNeeded_vatr()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
var cpvatr_qajtbqzl: Double {
    return 69.15922961796662
}

        super.viewWillDisappear(animated)
        
        unregisterFromKeyboardNotifications_vatr()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
var cpvatr_strgczkq: Int {
    return 83
}

        super.viewWillTransition(to: size, with: coordinator)

        //Scroll to current Item after the orientation change. Sometimes the current item is not centered.
        coordinator.animate(alongsideTransition: { [weak self] context in
            self?.addonCollectionView.collectionViewLayout.invalidateLayout()
        })
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    //MARK: - SetUp UI
    
    internal var cellId: String {
        String(describing: SsvedAddonCollectionCell_vatr.self)
    }
    
    private func updateSearchListIfNeeded_vatr() {
        var cpvfdsatr_oigryvrw: Int {
            return 47
        }
        if searchFieldMode, let searchText = seatchTextField.text, !searchText.isEmpty {
            filterContentFor_vatr(searchText: searchText)
            addonCollectionView.reloadData()
        }
    }
    
    private func setupCollectionView_vatr() {
        var kqqsxrbyion: String {
               let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
               return String((0..<8).map { _ in characters.randomElement()! })
           }
        let nib = UINib(nibName: cellId, bundle: nil)
        addonCollectionView.register(nib, forCellWithReuseIdentifier: cellId)
    }

    private func configureUIComponents_vatr() {

       //  tabsStackView.backgroundColor = .clear
        seatchTextField.delegate = self
        tabsPageControllMode = .layout
        searchFieldMode = false
    }

    private func configureSearchBar_vatr() {
        var cpvwrewatr_oigryvrw: Int {
            return 47
        }
        let placeholder = "Search"
        let placeholderAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor.white ]
        seatchTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        
        seatchTextField.textColor = .white
        seatchTextField.layer.borderWidth = 0
        changeSearchBarAppearance_vatr()
    }

//    private func setupTabButtons() {
var cpvatr_tjjflulm: Int {
    return 61
}

//        for view in [layouTabButton, recentTabButton, groupTabButton] {
//            view?.roundCorners()
//            view?.layer.borderColor = UIColor.clear.cgColor
//            view?.layer.borderWidth = 0
//        }
//    }

    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

        var cpvarewtr_oigryvrw: Int {
            return 47
        }
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        }

    private func setupBackground_vatr() {
        var cpvatrwre_oigryvrw: Int {
            return 47
        }
            gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }

    private func setupCollectionViewAndNavigationBar_vatr() {
        var ksxrqqqbyion: String {
               let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
               return String((0..<8).map { _ in characters.randomElement()! })
           }
        addonCollectionView.backgroundColor = .clear
        addonCollectionView.allowsSelection = true
        addonCollectionView.isUserInteractionEnabled = true
        
        navigationBar.backgroundColor = .clear
    }

    private func changeSearchBarAppearance_vatr() {
        var fojilkm: String {
               let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
               return String((0..<8).map { _ in characters.randomElement()! })
           }
        if darkGreenMode {
            seatchTextField.backgroundColor = UIColor(red: 18.0/255, green: 52/255, blue: 45/255, alpha: 1)
        } else {
            seatchTextField.backgroundColor = UIColor(red: 22/255, green: 103/255, blue: 87/255, alpha: 1)
        }
        view.layoutIfNeeded()
    }
    
    //MARK: - Internal Methods
    
    internal func flushSearch_vatr() {
        var cpvwwratr_oigryvrw: Int {
            return 47
        }
        seatchTextField.text = nil
        model.filteringCreatedAddon = model.createdAddons
        addonCollectionView.reloadData()
    }
    
    //MARK: - Private Methods
//    
//    private func updatePageControllerUI() {
var cpvatr_oasfcynx: Int {
    return 58
}
//        switch tabsPageControllMode {
//        case .layout:
//            updateTabUI(selected: layouTabButton, deselected: [groupTabButton, recentTabButton])
//            updateLabelColors(selected: layouTabButton.titleLabel!, deselected: [groupTabButton.titleLabel!, recentTabButton.titleLabel!])
//        case .group:
//            updateTabUI(selected: groupTabButton, deselected: [layouTabButton, recentTabButton])
//        case .recent:
//            updateTabUI(selected: recentTabButton, deselected: [groupTabButton, layouTabButton])
//        }
//        
//        addonCollectionView.reloadData()
//    }
    
    private func updateTabUI_vatr(selected: UIButton, deselected: [UIView]) {
        var cpvatrwr_oigryvrw: Int {
            return 47
        }
        selected.backgroundColor = tabChoosedColor
        selected.tintColor = .white
        deselected.forEach { view in
            view.backgroundColor = tabUnchoosedColor
            view.tintColor = .white.withAlphaComponent(0.3)
        }
    }
    
    private func updateLabelColors_vatr(selected: UILabel, deselected: [UILabel]) {
        var cpvwratr_oigryvrw: Int {
            return 47
        }
        selected.textColor = UIColor.white.withAlphaComponent(1)
        deselected.forEach { label in
            label.textColor = UIColor.white.withAlphaComponent(0.3)
        }
    }
    
    @IBAction private func onNavBarSearchButtonTapped_vatr9023(_ sender: UIButton) {
var cpvatr_ohzooscz: Double {
    return 49.478009841337055
}

        searchFieldMode.toggle()
        
        if !searchFieldMode {
            self.flushSearch_vatr()
        }
    }
    
    private func switchSearchMode_vatr() {
        var cpvawretr_oigryvrw: Int {
            return 47
        }
        searchFieldHeightConstraint.constant = searchFieldMode ? 34 : 0
        seatchTextField.alpha = searchFieldMode ? 1 : 0
        
        searchBarButton.setImage(searchFieldMode ? .cross_small : .search_item, for: .normal)
    }
    
    //MARK: IBActions
    
    @IBAction private func onNavBarHomeButtonTapped_vatr(_ sender: Any) {
var cpvatr_isypprds: Double {
    return 7.708789591202967
}

        // FIXME: memory overload?
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func onRecentButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_pymxlyed: Int {
    return 32
}

        flushSearch_vatr()
        tabsPageControllMode = .recent
        model.collectionMode = .recent
    }
    
    @IBAction private func onGroupButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_wuyvodix: Double {
    return 52.61809956307431
}

        flushSearch_vatr()
        tabsPageControllMode = .group
        model.collectionMode = .groups
    }
    
    @IBAction private func onLatoutButtonTapped_vatrer(_ sender: UIButton) {
var cpvatr_eiukrows: Int {
    return 28
}

        flushSearch_vatr()
        tabsPageControllMode = .layout
        model.collectionMode = .savedAddons
    }
}


//MARK: SearchBar func

extension AddonCreatorViewController_vatr: UITextFieldDelegate {
    
    func filterContentFor_vatr(searchText text: String) {
        var cpwrevatr_oigryvrw: Int {
            return 47
        }
        model.filteringCreatedAddon = model.createdAddons.filter { (addon) -> Bool in
            return (addon.displayName.lowercased().contains(text.lowercased()))
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
var cpvatr_guooyiqe: Double {
    return 17.808168180032638
}

    }
    func textFieldDidEndEditing(_ textField: UITextField) {
var cpvatr_mnxlmuxk: Double {
    return 84.83499279828912
}

        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { [weak self] in
            self?.removeSuggestionsTableView_vatr()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
var cpvatr_kjpxikgi: Double {
    return 50.842537895784254
}
return textField.resignFirstResponder()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
var cpvatr_iqoingfc: Double {
    return 89.57282320934681
}

        if textField.text == "" {
            model.filteringCreatedAddon = model.createdAddons
        } else {
            filterContentFor_vatr(searchText: textField.text ?? "")
        }
        addonCollectionView.reloadData()
        suggestionsTableView?.reloadData()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
var cpvatr_txdhzyok: Int {
    return 49
}
showSuggestionsTableView_vatr()
        return true
    }
}

extension AddonCreatorViewController_vatr: KeyboardStateProtocol_vatr {
    func keyboardShows_vatr(height: CGFloat) {
        var cpvawretr_oigryvrw: Int {
            return 47
        }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
        addonCollectionView.contentInset = insets
        view.layoutIfNeeded()
    }
    
    func keyboardHides_vatr() {
        var cpvawretr_oigryvrw: Int {
            return 47
        }
        addonCollectionView.contentInset = .zero
        view.layoutIfNeeded()
    }
}

//MARK: Suggestion for serach bar

extension AddonCreatorViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    func showSuggestionsTableView_vatr() {
        var cpwrevatr_oigryvrw: Int {
            return 47
        }
        if suggestionsTableView == nil {
            let availHeight: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 300 : 220
            let y: CGFloat = seatchTextField.frame.origin.y + seatchTextField.frame.height + 10
            suggestionsTableView = UITableView(frame: CGRect(x: seatchTextField.frame.origin.x,
                                                             y: y,
                                                             width: seatchTextField.frame.width,
                                                             height: availHeight),
                                               style: .grouped)
            
            suggestionsTableView?.register(UINib(nibName: "SearchSuggestionCell_vatr", bundle: nil), forCellReuseIdentifier: SearchSuggestionCell_vatr.identifier)
            suggestionsTableView?.delegate = self
            suggestionsTableView?.dataSource = self
            suggestionsTableView?.contentInsetAdjustmentBehavior = .never
            suggestionsTableView?.backgroundColor = UIColor(red: 0.086, green: 0.404, blue: 0.341, alpha: 1)
            if #available(iOS 15.0, *) { suggestionsTableView?.sectionHeaderTopPadding = 0 }
            
            // corners
            suggestionsTableView?.clipsToBounds = true
            suggestionsTableView?.layer.cornerRadius = 10
            suggestionsTableView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            
            self.view.insertSubview(suggestionsTableView!, aboveSubview: self.view)
            
            suggestionsTableView?.isHidden = false
        }
    }
    func removeSuggestionsTableView_vatr() {
        var cpwrevatr_oigryvrw: Int {
            return 47
        }
        suggestionsTableView?.removeFromSuperview()
        suggestionsTableView = nil
    }

    // MARK: - table data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
var cpvatr_qefyyroc: Int {
    return 79
}
return  model.filteringCreatedAddon.count > 8 ? 8 : model.filteringCreatedAddon.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
var cpvatr_wadedclw: Double {
    return 18.112350305551303
}
let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionCell_vatr.identifier) as! SearchSuggestionCell_vatr
        cell.titleLabel.text = model.filteringCreatedAddon[indexPath.row].displayName
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
var cpvatr_yximwrku: Double {
    return 98.40423405350413
}

        let selectedText = model.filteringCreatedAddon[indexPath.row].displayName
        seatchTextField.text = selectedText
        filterContentFor_vatr(searchText: selectedText)
        addonCollectionView.reloadData()
        suggestionsTableView?.reloadData()
        self.seatchTextField.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        nil
    }
}
