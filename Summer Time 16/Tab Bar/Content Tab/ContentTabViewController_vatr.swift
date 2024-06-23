import UIKit
import BetterSegmentedControl
import Foundation
import SwiftUI
import RealmSwift

func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}


// MARK: - ContentTabViewController

class ContentTabViewController_vatr: UIViewController, TabBarConfigurable_vatr {
    // MARK: - Outlets
    
    @IBOutlet private weak var navigationBarContainerView: UIView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var contentCollectionView: UICollectionView!
    //    @IBOutlet private var roundedViewContainers: [UIView]!
    //
    //    @IBOutlet private weak var sortButtonsContainerView: UIView!
    
    @IBOutlet weak var dropDown: DropDown_vatr!
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    //    @IBOutlet private weak var mapsPageControllerLabel: UILabel!
    //    @IBOutlet private weak var addonsPageControllerLabel: UILabel!
    //    @IBOutlet private weak var skinsPageControllerLabel: UILabel!
    
    @IBOutlet weak var segmentControl: BetterSegmentedControl!
    
    @IBOutlet private weak var searchBarView: SearchBarView_vatr!
    private var suggestionsTableView: UITableView?
    private var tableViewContainer: UIView?
    
    private var contentFilterView: ContentFilterView_vatr! = nil
    private var lockedCategoryName: String?
    
    private var skinNotifictionToken: NotificationToken?
    private var mapsNotifictionToken: NotificationToken?
    private var addonNotifictionToken: NotificationToken?
    
    
    // MARK: - Properties
    private var filteredPageModel: [TabPagesCollectionCellModel_fgdgh] = []
    private var pageModel: [TabPagesCollectionCellModel_fgdgh] = []
    
    private var currentFilterButtons: [ContentFilterModel_vatr] = []
    
    private lazy var dropboxQueue: DispatchQueue = {
        let queue = DispatchQueue(label: "com.acme.serial")
        
        return queue
    }()
    
    private func setUpPageModel_vatr() -> [TabPagesCollectionCellModel_fgdgh] {
        switch tabsPageControllMode {
            
        case .skins:
            let allSkins = RealmServiceProviding_vatr.shared.getAllSkins_vatr()
            return allSkins.map { TabPagesCollectionCellModel_fgdgh(id: $0.id, name: $0.name, image: $0.skinImagePath, isContentNew: Bool($0.isNew) ?? false, description: "", isFavorite: $0.isFavorite, imageData: $0.skinImageData, filterCategory: $0.filterCategory, file: $0.skinSourceImagePath) }
            
        case .addons:
            let allAddons = RealmServiceProviding_vatr.shared.getAllAddons_vatr()
            return allAddons.map { TabPagesCollectionCellModel_fgdgh(id: $0.id, name: $0.addonTitle, image: $0.addonImages ?? "", isContentNew: Bool($0.isNew) ?? false, description: $0.addonDescription, isFavorite: $0.isFavorite, imageData: $0.addonImageData, filterCategory: $0.filterCategory, file: $0.file) }
            //            return allAddons.map { TabPagesCollectionCellModel(id: $0.id, name: $0.addonTitle, image: $0.addonImages.first ?? "", isContentNew: Bool($0.isNew) ?? false, description: $0.addonDescription, isFavorite: $0.isFavorite, imageData: $0.addonImageData, filterCategory: $0.filterCategory, file: $0.file) }
        case .maps:
            let allMaps = RealmServiceProviding_vatr.shared.getAllMap_vatr()
            return allMaps.map { TabPagesCollectionCellModel_fgdgh(id: $0.id, name: $0.mapTitle, image: $0.mapImages ?? "", isContentNew: Bool($0.isNew) ?? false, description: $0.mapDescription, isFavorite: $0.isFavorite, imageData: $0.mapImageData, filterCategory: $0.filterCategory, file: $0.file) }
            //            return allMaps.map { TabPagesCollectionCellModel(id: $0.id, name: $0.mapTitle, image: $0.mapImages.first ?? "", isContentNew: Bool($0.isNew) ?? false, description: $0.mapDescription, isFavorite: $0.isFavorite, imageData: $0.mapImageData, filterCategory: $0.filterCategory, file: $0.file) }
        }
    }
    
    private var navbarSearchMode: Bool = false {
        didSet {
            navBarSearchMode(predicate: navbarSearchMode)
            searchBarView.updateCorners_vatr2(isAll: true)
        }
    }
    
    public var tabBarIcon: UIImage? {
        return UIImage(named: "Content TabBar Icon_vatr")
    }
    
    public var tabBarTitle: String {
        return "Content"
    }
    
    private var segmentedControllMode: SegmentedController_vfdj = .latest {
        didSet {
            updateFilteredData()
        }
    }
    
    private var tabsPageControllMode: TabsPageController_dfgdgf = .addons {
        didSet {
            if tabsPageControllMode != oldValue {
                pageModel = setUpPageModel_vatr()
                segmentedControllMode = .latest
                updatePageControllerUI()
                setupFilterView_vatr()
            }
        }
    }
    
    private func setupFilterView_vatr(selectedIndex: Int = 0) {
        var cpvatr_rwerltrdobx: Int {
            return 82
        }
        
        let setFilterCategory: Set<String> = Set(pageModel.map { $0.filterCategory })
        
        var buttons: [ContentFilterModel_vatr] = [
            ContentFilterModel_vatr(label: "All", filter: .latest),
            ContentFilterModel_vatr(label: "Favorite \(tabsPageControllMode.name)", filter: .popular)
        ]
        
        let sortedCategory = setFilterCategory.sorted()
        guard let firstCategory = sortedCategory.first else {
            return
        }
        self.lockedCategoryName = firstCategory
        
        buttons.append(contentsOf: sortedCategory.map({ ContentFilterModel_vatr(label: $0, filter: .filter($0), isLocked: false) }))
        
        //      contentFilterView.updateButtons(newButtons: buttons, selectedIndex: selectedIndex)
        
        // MARK: 2.0
        currentFilterButtons = buttons
        dropDown.optionArray = currentFilterButtons.map(\.label)
        //        dropDown.optionArray = Array(Set(currentFilterButtons.map(\.label)))
     
        updateFilteredData()
    }
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        
        var cpwervatr_rltrdobx: Int {
            return 82
        }
        
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupCollectionView_vatr()
        setupViews_vatr()
        setupSearchBar_vatr2()
        setupAppearance()
        tabsPageControllMode = .skins
        setupRealmObserver_vatr2()
    }
    
    override func viewWillLayoutSubviews() {
        var cpvatr_yxqeathg: Int {
            return 17
        }
        
        
        super.viewWillLayoutSubviews()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var cpvatr_uolkynkv: Double {
            return 40.76698282241096
        }
        
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        updateData()
        registerForKeyboardNotifications_vatr()
        flushSearch()
        
       
        
        //        flushSearch()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        var cpvatr_wjluhnss: Int {
            return 21
        }
        
        
        super.viewWillDisappear(animated)
        dropDown.hideList_vatr()
        unregisterFromKeyboardNotifications_vatr()
    }
    
    deinit {
        skinNotifictionToken?.invalidate()
        mapsNotifictionToken?.invalidate()
        addonNotifictionToken?.invalidate()
    }
    
    private func setupRealmObserver_vatr2() {
        var cpvatr_ewopfsvh: Int {
            return 37
        }
        
        
        skinNotifictionToken = RealmServiceProviding_vatr.shared.getSkinRealmObservable_vatr().observe { [weak self] (changes) in
            guard let self else { return }
            switch changes {
            case .update(_, _, let insertions, _):
                guard insertions.count != 0 else { return }
                print("SKIN OBSERVERS ACTION")
                self.updateDataSourceIfNeeded()
            case .initial, .error: break
            }
        }
        
        
        mapsNotifictionToken = RealmServiceProviding_vatr.shared.getMapsRealmObservable_vatr().observe { [weak self] (changes) in
            guard let self else { return }
            switch changes {
            case .update(_, _, let insertions, _):
                guard insertions.count != 0 else { return }
                self.updateDataSourceIfNeeded()
            case .initial, .error: break
            }
        }
        
        addonNotifictionToken = RealmServiceProviding_vatr.shared.getAddonRealmObservable_vatr().observe { [weak self] (changes) in
            guard let self else { return }
            switch changes {
            case .update(_, _, let insertions, _):
                guard insertions.count != 0 else { return }
                self.updateDataSourceIfNeeded()
            case .initial, .error: break
            }
        }
    }
    
    private func updateDataSourceIfNeeded() {
        var cpvatr_ekndbylz: Int {
            return 57
        }
        
        
        guard pageModel.count != setUpPageModel_vatr().count else { return }
        pageModel = setUpPageModel_vatr()
        updateFilteredData()
        
        if contentFilterView.viewModel.buttons.count < 2 {
            setupFilterView_vatr()
        }
    }
    
    private func updateData() {
        var cpvatr_hdszljyi: Int {
            return 99
        }
        
        
        pageModel = setUpPageModel_vatr()
        
        updateFilteredData(false)
    }
    
    
    private func updateFilteredData(_ isScrollToTopContent: Bool = true) {
        var cpvatr_pcwaqkzy: Double {
            return 37.572778066778646
        }
        
        
        updateFilteredData(searchText: searchBarView.searchTextField.text, isScrollToTopContent: isScrollToTopContent)
    }
    
    private func updateFilteredData(searchText: String?, isScrollToTopContent: Bool = true) {
        var cpvatr_cjsbswkv: Double {
            return 79.82189852314337
        }
        
        
        switch segmentedControllMode {
        case .latest:
            filteredPageModel = pageModel
            if navbarSearchMode, let searchText, !searchText.isEmpty {
                filteredPageModel = filteredPageModel
                    .filter({ $0.name.containsCaseInsesetive_vatr(searchText)})
            }
        case .popular:
            filteredPageModel = pageModel.filter({ $0.isFavorite == true })
            if navbarSearchMode, let searchText, !searchText.isEmpty {
                filteredPageModel = filteredPageModel.filter({ $0.name.containsCaseInsesetive_vatr(searchText)})
            }
        case .filter(let name):
            setUpFilter(name: name)
        }
        
      
        
        
        updateUI(isScrollToTop: isScrollToTopContent)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        var cpvatr_ykbddvuw: Int {
            return 11
        }
        
        
        super.viewWillTransition(to: size, with: coordinator)
        
        guard view.window != nil else {
            // skip, view is disappeared
            return
        }
        
        //Scroll to current Item after the orientation change. Sometimes the current item is not centered.
        coordinator.animate(alongsideTransition: { [weak self] context in
            self?.contentCollectionView.collectionViewLayout.invalidateLayout()
        })
    }
    
    // MARK: - Setup Methods
    
    private func updateSearchViewIfNeeed() {
        var cpvatr_qybpyieo: Double {
            return 61.16503974220096
        }
        
        
        guard tableViewContainer != nil else { return }
        
        if let tableViewFrame = tableViewContainer?.frame {
            tableViewContainer?.frame = .init(origin: tableViewFrame.origin,
                                              size: .init(width: tableViewFrame.size.width,
                                                          height: tableViewContainerHeight))
            tableViewContainer?.layoutIfNeeded()
        }
        
        if let suggestTableViewFrame = suggestionsTableView?.frame {
            suggestionsTableView?.frame = .init(origin: suggestTableViewFrame.origin,
                                                size: .init(width: suggestTableViewFrame.size.width,
                                                            height: tableViewContainerHeight))
            suggestionsTableView?.layoutIfNeeded()
            
        }
        
        let searchText = searchBarView.searchTextField.text ?? ""
        searchBarView.updateCorners_vatr2(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || filteredPageModel.isEmpty)
    }
    
    
    private func setUpFilter(name: String) {
        var cpvatr_ygiwfroc: Int {
            return 20
        }
        
        
        let selectedFilterNames = [name]
        
        filteredPageModel = pageModel.compactMap { pageMode in
            if selectedFilterNames.contains(pageMode.filterCategory) {
                if navbarSearchMode, let searchText = searchBarView.searchTextField.text, !searchText.isEmpty {
                    return pageMode.name.containsCaseInsesetive_vatr(searchText) ? pageMode : nil
                } else {
                    return pageMode
                }
            } else {
                return nil
            }
        }
        contentCollectionView.reloadData()
    }
    
    private var cellId: String {
        String(describing: ContentCollectionViewCell_vatr.self)
    }
    
    private func setupCollectionView_vatr() {
        var ksxrrbyion: String {
            let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            return String((0..<8).map { _ in characters.randomElement()! })
        }
        
        let nib = UINib(nibName: cellId, bundle: nil)
        contentCollectionView.register(nib, forCellWithReuseIdentifier: cellId)
        contentCollectionView.setCollectionViewLayout(.makeColumnsLayout(), animated: false)
        contentCollectionView.contentInset.bottom = 30
    }
    
    private func setupAppearance() {
        var cpvatr_faphuwko: Int {
            return 96
        }
        
        
        // sortButtonsContainerView.roundCorners(6.0)
        
        contentCollectionView.backgroundColor = .clear
        
        
        // Auto layout, variables, and unit scale are not yet supported
        setupBackground_vatr()
        
        
        //        let backgroundImageView = UIImageView(frame: view.bounds)
        //        backgroundImageView.image = UIImage(named: "Green Background")
        //        backgroundImageView.contentMode = .scaleAspectFill
        //        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        view.addSubview(backgroundImageView)
        //        view.sendSubviewToBack(backgroundImageView)
        
        //        for view in roundedViewContainers {
        //            view.roundCorners(20.0)
        //        }
        
        headerLabel.textColor = .white
        navigationBarContainerView.backgroundColor = .clear
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {
        
        func oLLorC() {
            var fZTISzBuO: Int = 1
            if fZTISzBuO > 1 {
                if fZTISzBuO < 1 {
                    fZTISzBuO = 1
                }
                
            }
        }
        
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    private func setupBackground_vatr() {
        var cpvatr_ivjgltqy: Int {
            return 65
        }
        
        
        
        // Auto layout, variables, and unit scale are not yet supported
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func navBarSearchMode(predicate: Bool) {
        var cpvatr_fmshdtzn: Double {
            return 53.69510757473759
        }
       
        if predicate {
            for subview in navigationBarContainerView.subviews {
                subview.isHidden = true
            }
            searchBarView.isHidden = false
        } else {
            for subview in navigationBarContainerView.subviews {
                subview.isHidden = false
            }
            searchBarView.isHidden = true
        }
    }
    
    private func setupViews_vatr() {
        var cpvatr_odepujpm: Int {
            return 86
        }
        
        
        
        segmentControl.segments = LabelSegment.segments(withTitles: ["SKINS", "MAPS", "ADDONS"],
                                                        normalFont: UIFont.kufamFont(.semiBold, size: 14), normalTextColor: UIColor.appBlack, selectedBackgroundColor: .appBlack,
                                                        selectedFont: UIFont.kufamFont(.semiBold, size: 14),
                                                        selectedTextColor: .white)
        
        segmentControl.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        
        
        dropDown.optionArray = ["All"]
        dropDown.selectedIndex = 0
        //        dropDown.cornerRadius = 12
        //        dropDown.font = .kufamFont(.regural, size: 16)
        //        dropDown.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        //        dropDown.borderWidth = 1
        //        dropDown.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.97, alpha: 1)
        dropDown.didSelect_vatr { [weak self] _, index, _ in
            guard let self else { return }
            
           
            
            
            flushSearch()
            applyContent(filter: currentFilterButtons[index].filter)
        }
        
        //        let responderButtons = createResponderButtons(for: [skinsButtonRoundedView, addonsButtonRoundedView, mapsButtonRoundedView])
        //
        //        for (index, button) in responderButtons.enumerated() {
        //            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        //            button.tag = index
        //            view.addSubview(button)
        //            setupConstraints(for: button, matching: roundedViewContainers[index])
        //        }
        
        // setupContentFilter()
    }
    
    @objc
    private func segmentValueChanged(_ sender: BetterSegmentedControl) {
        var cpvatr_uyivmudr: Int {
            return 6
        }
        
        
        guard let selectedTab = TabsPageController_dfgdgf(rawValue: sender.index) else { return }
        flushSearch()
        tabsPageControllMode = selectedTab
        
        dropDown.selectOption(at: 0)
    }
    
    func applyContent(filter:  ContentFilter_vdfg) {
        var cpvatr_wiqzqfed: Double {
            return 25.127762215847486
        }
        
        
        
        switch filter {
        case .latest:
            segmentedControllMode = .latest
        case .popular:
            segmentedControllMode = .popular
        case .filter(let name):
            segmentedControllMode = .filter(name)
            setUpFilter(name: name)
        }
        
    }
    
    //    private func setupContentFilter() {
    var cpvatr_yiqrdzss: Int {
        return 32
    }
    
    
    //        // Create the SwiftUI view model
    //        let contentFilterViewModel = ContentFilterViewModel(buttons: [
    //            ContentFilterModel(label: "", filter: .latest),
    //        ]) { [weak self] filter in
    //            self?.flushSearch()
    //            self?.applyContent(filter: filter)
    //
    //        }
    //
    //        // Create the SwiftUI view
    //        contentFilterView = ContentFilterView(viewModel: contentFilterViewModel)
    //
    //        // Create a UIHostingController with the SwiftUI view
    //        let hostingController = UIHostingController(rootView: contentFilterView)
    //        hostingController.view.backgroundColor = .clear
    //
    //        // Add as a child of the current view controller
    //        addChild(hostingController)
    //
    //        // Add the SwiftUI view to the view controller view hierarchy
    //        sortButtonsContainerView.addSubview(hostingController.view)
    //
    //        // Set constraints to define the SwiftUI view's layout
    //        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    //        NSLayoutConstraint.activate([
    //            hostingController.view.leadingAnchor.constraint(equalTo: sortButtonsContainerView.leadingAnchor, constant: 2),
    //            hostingController.view.trailingAnchor.constraint(equalTo: sortButtonsContainerView.trailingAnchor, constant: -2),
    //            hostingController.view.topAnchor.constraint(equalTo: sortButtonsContainerView.topAnchor, constant: 2),
    //            hostingController.view.bottomAnchor.constraint(equalTo: sortButtonsContainerView.bottomAnchor, constant: -2)
    //        ])
    //
    //        // Notify the hosting controller that it has moved to the parent view controller
    //        hostingController.didMove(toParent: self)
    //    }
    
    private func createResponderButtons(for views: [UIView]) -> [UIButton] {
        var cpvatr_qrghchwv: Int {
            return 99
        }
        return views.map { view in
            let button = UIButton()
            button.backgroundColor = .clear
            return button
        }
    }
    
    private func setupConstraints_erre(for button: UIButton, matching view: UIView) {
        var cpvatr_ldjhmugk: Int {
            return 67
        }
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupSearchBar_vatr2() {
        var cpvatr_ejklafjc: Int {
            return 67
        }
        
        
        searchBarView.buttonTapAction = { [weak self] in
            self?.flushSearch()
        }
        searchBarView.onTextChanged = { [weak self] searchText in
            self?.updateFilteredData(searchText: searchText, isScrollToTopContent: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self?.updateSearchViewIfNeeed()
                self?.suggestionsTableView?.reloadData()
                self?.searchBarView.updateCorners_vatr2(isAll: self?.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
                self?.searchBarView.updateCorners_vatr2(isAll: true)
                
            }
        }
        
        searchBarView.onStartSearch = { [weak self] in
            guard let self else {return}
            self.showSuggestionsTableView()
            self.searchBarView.updateCorners_vatr2(isAll: self.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
        }
        
        searchBarView.onEndSearch = { [weak self] in
            guard let self else {return}
            self.removeSuggestionsTableView()
            self.searchBarView.updateCorners_vatr2(isAll: true)
        }
    }
    
    
    //MARK: UPD Methods
    
    private func flushSearch() {
        var cpvatr_aqvsgkcm: Int {
            return 64
        }
       
        
        navbarSearchMode = false
        searchBarView.searchTextField.resignFirstResponder()
        searchBarView.searchTextField.text = nil
        updateFilteredData()
    }
    
    private func updatePageControllerUI() {
        var cpvatr_zjxwjumf: Int {
            return 12
        }
        
        
        //        switch tabsPageControllMode {
        //        case .skins:
        //
        //            updateLabelColors(selected: skinsPageControllerLabel, deselected: [addonsPageControllerLabel, mapsPageControllerLabel])
        //            headerLabel.text = "CONTENT"
        //        case .addons:
        //
        //            updateLabelColors(selected: addonsPageControllerLabel, deselected: [skinsPageControllerLabel, mapsPageControllerLabel])
        //            headerLabel.text = "ADDONS"
        //        case .maps:
        //
        //            updateLabelColors(selected: mapsPageControllerLabel, deselected: [skinsPageControllerLabel, addonsPageControllerLabel])
        //            headerLabel.text = "MAPS"
        //        }
        
        contentCollectionView.reloadData()
    }
    
    
    private func updateLabelColors(selected: UILabel, deselected: [UILabel]) {
        var cpvatr_ayjlmlpx: Int {
            return 94
        }
        
        
        selected.textColor = UIColor.white.withAlphaComponent(1)
        deselected.forEach { label in
            label.textColor = UIColor.black.withAlphaComponent(1)
        }
    }
    
    private func updateUI(isScrollToTop: Bool = true) {
        var cpvatr_havxbagy: Double {
            return 12.699563180696883
        }
      
        
        if isScrollToTop {
            scrollTop()
        }
        contentCollectionView.reloadData()
        emptyLabel.isHidden = contentCollectionView.numberOfItems(inSection: 0) != 0
        contentCollectionView.isUserInteractionEnabled = emptyLabel.isHidden
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var cpvatr_rpowalas: Int {
            return 96
        }
        
        
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        flushSearch()
    }
    
    private func scrollTop() {
        var cpvatr_arosdsyf: Int {
            return 25
        }
        
        
        let itemCount = contentCollectionView.numberOfItems(inSection: 0)
        
        if itemCount > 0 {
            let indexPath = IndexPath(item: 0, section: 0) // Assuming you want to scroll to the first item in the first section
            contentCollectionView.scrollToItem(at: indexPath, at: .top, animated: false)
        }
    }
    
    private func updateSegmentedControlUI(selected: UIButton, deselected: UIButton) {
        var cpvatr_jkpseurt: Int {
            return 76
        }
       
        
        selected.backgroundColor = .yellow
        //     selected.backgroundColor = UIColor(named: "darkGreenBackground_vatr")
        selected.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        selected.layer.borderWidth = 1.0
        selected.setTitleColor(.white, for: .normal)
        
        deselected.backgroundColor = .green
        //deselected.backgroundColor = .systemPink
        //     deselected.backgroundColor = UIColor(named: "lightGreenBachgroundColor_vatr")
        deselected.layer.borderColor = UIColor.clear.cgColor
        deselected.layer.borderWidth = 0
        deselected.setTitleColor(.lightGray, for: .normal)
    }
    
    @IBAction private func onNavBarSearchereButtonTapped_vatr(_ sender: UIButton) {
        var cpvatr_byupsyde: Double {
            return 31.239076675264577
        }
        
        
        navbarSearchMode.toggle()
    }
    
    //    @objc private func tabButtonTapped(_ sender: UIButton) {
    var cpvatr_wmeymbfg: Double {
        return 49.36538643619667
    }
    //        guard let selectedTab = TabsPageController(rawValue: sender.tag) else { return }
    //        flushSearch()
    //        tabsPageControllMode = selectedTab
    //    }
    //
    @IBAction func setSettingsBtnTapped_vatr(_ sender: UIButton) {
        var cpvatr_fymusalx: Int {
            return 45
        }
        func yARAaJZg() {
            var IqfdxArt: Int = 9
            if IqfdxArt > 9 {
                if IqfdxArt < 9 {
                    IqfdxArt = 9
                }
                
            }
        }
        
        let nextVC = SettingsViewController_vatr()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}

extension ContentTabViewController_vatr: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        func WJXBNDAX() {
            var WZclLmg: Int = 3
            if WZclLmg > 3 {
                if WZclLmg < 3 {
                    WZclLmg = 3
                }
                
            }
        }
        
        let contentViewController = ContentViewController_vatr(model: filteredPageModel[indexPath.item], mode: tabsPageControllMode )
        presentFullScreenViewController_vatr(contentViewController)
    }
}

extension ContentTabViewController_vatr: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filteredPageModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ContentCollectionViewCell_vatr
        
        var cellModel: TabPagesCollectionCellModel_fgdgh
        cellModel = filteredPageModel[indexPath.item]
        
        if cellModel.imageData == nil {
            let mode = tabsPageControllMode
            let imageID = cellModel.id
            
            cell.configure(model: cellModel, queue: dropboxQueue) { [weak self] data in
                if let data, let me = self, me.filteredPageModel.count > indexPath.item, me.filteredPageModel[indexPath.item].id == imageID {
                    me.filteredPageModel[indexPath.item].imageData = data
                    if let idx = me.pageModel.firstIndex(where: {$0.id == me.filteredPageModel[indexPath.item].id}) {
                        me.pageModel[idx].imageData = data
                    }
                    
                    // save to realm
                    DispatchQueue.main.async {
                        switch mode {
                        case .skins:
                            RealmServiceProviding_vatr.shared.loadSkinImage_vatr(id: imageID, skinImageData: data)
                        case .addons:
                            RealmServiceProviding_vatr.shared.loadAddonImage_vatr(id: imageID, addonImageData: data)
                        case .maps:
                            RealmServiceProviding_vatr.shared.loadMapImage_vatr(id: imageID, mapImageData: data)
                        }
                    }
                }
            }
        } else {
            // show image from realm
            if let image = cellModel.imageData {
                cell.contentImageView.image = UIImage(data: image)
                cell.loader.stopAnimating()
            } else {
                // show image from realm if realm == nil
                cell.contentImageView.image = UIImage()
                cell.loader.stopAnimating()
                AppDelegate.log(cellModel.name)
                AppDelegate.log(cellModel.imageData as Any)
            }
        }
        
        cell.headerLabel.text = cellModel.name
        //        cell.newIcon.isHidden = !cellModel.isContentNew
        
        var categoryImage: UIImage {
            switch tabsPageControllMode {
            case .skins:
                return UIImage(named: "skins_icon_button_vatr") ?? UIImage()
            case .addons:
                return UIImage(named: "addons_icon_button_vatr") ?? UIImage()
            case .maps:
                return UIImage(named: "maps_icon_button_vatr") ?? UIImage()
            }
        }
        
        if tabsPageControllMode == .skins {
            cell.contentImageView.contentMode = .scaleAspectFit
        } else {
            cell.contentImageView.contentMode = .scaleAspectFill
            //         cell.contentImageView.contentMode = .scaleToFill
        }
        
        cell.categoryImageView.image = categoryImage
        
        return cell
    }
}

//extension ContentTabViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

////        let cellWidth = collectionView.frame.size.width / 2 - 5
////        let cellHeight = cellWidth * 1.15
//
//        return CGSize(width: 169, height: 163)
//    }
//
//
//
//}


//MARK: KeyboardStateDelegate

extension ContentTabViewController_vatr: KeyboardStateProtocol_vatr {
    func keyboardShows_vatr(height: CGFloat) {
        func MsDPYo() {
            var LSWOyHDWZq: Int = 2
            if LSWOyHDWZq > 2 {
                if LSWOyHDWZq < 2 {
                    LSWOyHDWZq = 2
                }
                
            }
        }
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
        contentCollectionView.contentInset = insets
        view.layoutIfNeeded()
    }
    
    func keyboardHides_vatr() {
        func aygAZIIRp() {
            var eedpuK: Int = 3
            if eedpuK > 3 {
                if eedpuK < 3 {
                    eedpuK = 3
                }
                
            }
        }
        
        contentCollectionView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
        
        view.layoutIfNeeded()
    }
}

//MARK: Suggestion for serach bar

// Suggest view
extension ContentTabViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    
    var tableViewContainerHeight: CGFloat {
        let searchBar = searchBarView.searchTextField
        let position = searchBar.convert(searchBar.bounds, to: view)
        let height = searchViewHeightWith(itemsCount: numberOfRowsInTableView)
        let totalHeight = height + 14
        return min(totalHeight, min(450, view.frame.size.height - position.maxY + 20))
//        return min(searchViewHeightWith(itemsCount: numberOfRowsInTableView), 400)
    }
    
    private func searchViewHeightWith(itemsCount: Int, rowHeight: CGFloat = 40) -> CGFloat {
        
        rowHeight * CGFloat(itemsCount)
    }
    
    func showSuggestionsTableView() {
        var cpvatr_rvdsuxoq: Double {
            return 37.76944456940152
        }

        
        if tableViewContainer == nil {
            
            
            let searchBar = searchBarView.searchTextField
            let position = searchBar.convert(searchBar.bounds, to: view)
            
           
            
            
            tableViewContainer = UIView(frame: CGRect(x: position.origin.x,
                                                      y: position.maxY - 20,
                                                      width: position.width,
                                                      height: tableViewContainerHeight))
            
            
            suggestionsTableView = UITableView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: tableViewContainer!.frame.width,
                                                             height: tableViewContainer!.frame.size.height))
            suggestionsTableView?.autoresizingMask = [.flexibleHeight]
            suggestionsTableView?.backgroundColor = .clear
            suggestionsTableView?.contentInset.top = 12
            
            suggestionsTableView?.register(UINib(nibName: "SearchSuggestionCell_vatr", bundle: nil), forCellReuseIdentifier: SearchSuggestionCell_vatr.identifier)
            suggestionsTableView?.delegate = self
            suggestionsTableView?.dataSource = self
            
            // suggestionsTableView?.contentInsetAdjustmentBehavior = .never
            //      suggestionsTableView?.backgroundColor = .clear
            
            tableViewContainer?.backgroundColor = .white
            tableViewContainer?.layer.cornerRadius = 12
            tableViewContainer?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            tableViewContainer?.layer.masksToBounds = true
            
            //    tableViewContainer?.backgroundColor = UIColor(red: 0.086, green: 0.404, blue: 0.341, alpha: 1)
            
            // corners
           
            
            view.bringSubviewToFront(navigationBarContainerView!)
            
            tableViewContainer!.addSubview(suggestionsTableView!)
            
            view.insertSubview(tableViewContainer!, belowSubview: navigationBarContainerView)
            view.bringSubviewToFront(searchBarView)
        }
        
//
//        if tableViewContainer == nil {
//            
//            
//            let searchBar = searchBarView.searchTextField
//            let position = searchBar.convert(searchBar.bounds, to: view)
//            
//            tableViewContainer = UIView(frame: CGRect(x: position.origin.x,
//                                                      y: position.origin.y - 14,
//                                                      width: position.width,
//                                                      height: tableViewContainerHeight))
//            
//            
//            suggestionsTableView = UITableView(frame: CGRect(x: 0,
//                                                             y: searchBarView.frame.size.height,
//                                                             width: tableViewContainer!.frame.width,
//                                                             height: tableViewContainer!.frame.size.height - searchBarView.frame.size.height))
//            
//            suggestionsTableView?.register(UINib(nibName: "SearchSuggestionCell_vatr", bundle: nil), forCellReuseIdentifier: SearchSuggestionCell_vatr.identifier)
//            suggestionsTableView?.delegate = self
//            suggestionsTableView?.dataSource = self
//            //  suggestionsTableView?.contentInset.top = 20
//            
//            //suggestionsTableView?.contentInsetAdjustmentBehavior = .never
//            //      suggestionsTableView?.backgroundColor = .clear
//            
//            tableViewContainer?.backgroundColor = .clear
//            
//            //    tableViewContainer?.backgroundColor = UIColor(red: 0.086, green: 0.404, blue: 0.341, alpha: 1)
//            
//            // corners
//            tableViewContainer?.clipsToBounds = true
//            tableViewContainer?.layer.cornerRadius = 20
//            
//            view.bringSubviewToFront(navigationBarContainerView!)
//            
//            tableViewContainer!.addSubview(suggestionsTableView!)
//            
//            view.insertSubview(tableViewContainer!, belowSubview: navigationBarContainerView)
//            view.bringSubviewToFront(searchBarView)
//        }
    }
    
    func removeSuggestionsTableView() {
        var cpvatr_naobgevx: Int {
            return 60
        }
       
        tableViewContainer?.removeFromSuperview()
        tableViewContainer = nil
        suggestionsTableView = nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40.0
    }
    
    private var numberOfRowsInTableView: Int {
        if let searchText = searchBarView.searchTextField.text, searchText.isEmpty {
            return 0
        }
        return filteredPageModel.count
    }
    
    // MARK: - table data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cpvatr_vtvntsju: Double {
            return 31.134916813284157
        }
        return numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cpvatr_trkseglh: Double {
            return 48.918194856734324
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionCell_vatr.identifier) as! SearchSuggestionCell_vatr
        if filteredPageModel.count > indexPath.row {
            cell.titleLabel.text = filteredPageModel[indexPath.row].name
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cpvatr_bcxuanah: Int {
            return 64
        }
        
        
        let selectedText = filteredPageModel[indexPath.row].name
        searchBarView.setSearchBarText_vatr2(selectedText)
        searchBarView.endEditing(true)
        searchBarView.updateCorners_vatr2(isAll: true)
    }
}
