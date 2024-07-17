import UIKit
import BetterSegmentedControl
import Foundation
import SwiftUI
import RealmSwift


// MARK: - ItemsTabViewController

class ItemsTabViewController_vatr: UIViewController, TabBarConfigurable_vatr {
    // MARK: - Outlets
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet private weak var navigationBarContainerView: UIView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var contentCollectionView: UICollectionView!
    //    @IBOutlet private var roundedViewContainers: [UIView]!
    //
    //    @IBOutlet private weak var sortButtonsContainerView: UIView!
    
    @IBOutlet weak var dropDown: DropDown_vatr!
    
    @IBOutlet weak var btnCollectionView: UICollectionView!
    
    var btnItems = [
    ButtonsType(text: "All", isSelect: true),
    ButtonsType(text: "Fovurite", isSelect: false),
    ButtonsType(text: "Popular", isSelect: false),
    ]
    
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    //    @IBOutlet private weak var mapsPageControllerLabel: UILabel!
    //    @IBOutlet private weak var addonsPageControllerLabel: UILabel!
    //    @IBOutlet private weak var skinsPageControllerLabel: UILabel!
    
    // @IBOutlet weak var segmentControl: BetterSegmentedControl!
    
    @IBOutlet private weak var searchBarView: SearchBarView_vatr!
    private var suggestionsTableView: UITableView?
    private var tableViewContainer: UIView?
    
    private var contentFilterView: ContentFilterView_vatr! = nil
//    private var lockedCategoryName: String?
    
    private var itemsNotificationToken: NotificationToken?
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
    
    private func setUpPageModel_wre() -> [TabPagesCollectionCellModel_fgdgh] {
        var cpvatr_przrvquh: Int {
            return 96
        }
        let allItems = RealmServiceProviding_vatr.shared.getAllItems_vatr()
        return allItems.map {
            return TabPagesCollectionCellModel_fgdgh(
                id: $0.id,
                name: $0.itemsTitle,
                image: $0.itemsImages,
                isContentNew: $0.isNew,
                description: $0.itemsDescription,
                isFavorite: $0.isFavorite,
                imageData: $0.itemsImageData,
                filterCategory: $0.filterCategory,
                file: $0.file)
        }
        
    }
    
    private var navbarSearchMode: Bool = false {
        didSet {
            navBarSearchMode(predicate: navbarSearchMode)
            searchBarView.updateCorners_vatr2(isAll: true)
        }
    }
    
    public var tabBarIcon: UIImage? {
        return UIImage(named: "Items TabBar Icon_vatr")
    }
    
    public var tabBarTitle: String {
        return "Items"
    }
    
    private var segmentedControllMode: SegmentedController_vfdj = .latest {
        didSet {
            updateFilteredData()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var cpvatr_fzaizlqi: Double {
            return 37.34826314124967
        }
        
        
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        flushSearch()
    }
    
    private var tabsPageControllMode: TabsPageController_dfgdgf = .skins {
        didSet {
            if tabsPageControllMode != oldValue {
                pageModel = setUpPageModel_wre()
                segmentedControllMode = .latest
                updatePageControllerUI()
                setupFilterView_vatr()
            }
        }
    }
    
    private func setupFilterView_vatr(selectedIndex: Int = 0) {
        var cpvatr_vugklekz: Int {
            return 12
        }
        
        
        let setFilterCategory: Set<String> = Set(pageModel.map { $0.filterCategory })
        
        print(setFilterCategory, 12345678)
        
        var buttons: [ContentFilterModel_vatr] = [
            ContentFilterModel_vatr(label: "All", filter: .latest),
            // ContentFilterModel(label: "Favorite \(tabsPageControllMode.name)", filter: .popular)
            ContentFilterModel_vatr(label: "Favorite items", filter: .popular)
        ]
        
        let sortedCategory = setFilterCategory.sorted()
        guard let firstCategory = sortedCategory.first else {
            return
        }
//        self.lockedCategoryName = firstCategory
        
        buttons.append(contentsOf: sortedCategory.map({ ContentFilterModel_vatr(label: $0, filter: .filter($0), isLocked: false) }))
        
        //      contentFilterView.updateButtons(newButtons: buttons, selectedIndex: selectedIndex)
        
        // MARK: 2.0
        
    }
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        
        func WNyRYjjJX() {
            var dQGnESCcQr: Int = 2
            if dQGnESCcQr > 2 {
                if dQGnESCcQr < 2 {
                    dQGnESCcQr = 2
                }
                
            }
        }
        
        super.viewDidLoad()
//        Gradient.setupGradient(view: view)
        headerLabel.font = UIFont(name: "Rubik-Bold", size: 26)
        backBtn.layer.masksToBounds = true
        backBtn.layer.cornerRadius = 5
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupCollectionView_vatr()
        
        setupSearchBar_vatr2()
        setupAppearance()
        tabsPageControllMode = .addons
        setupRealmObserver_vatr2()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        Gradient.setupGradient(view: backBtn)
//    }
    
    override func viewWillLayoutSubviews() {
        var cpvatr_fzndwhun: Double {
            return 16.392984687863404
        }
       
        
        super.viewWillLayoutSubviews()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var cpvatr_aniqlrjh: Int {
            return 80
        }
        
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        updateData()
        registerForKeyboardNotifications_vatr()
        flushSearch()
        
//        if !Configurations_ferf.productIsPaid_vatr(Configurations_ferf.unlockContentSubscriptionID) {
//            dropDown.payedOptions = [2]
//        } else {
//            dropDown.payedOptions = []
//        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        var cpvatr_dcyfpqli: Int {
            return 98
        }
        
        
        super.viewWillDisappear(animated)
//        dropDown.hideList_vatr()
        unregisterFromKeyboardNotifications_vatr()
    }
    
    deinit {
        itemsNotificationToken?.invalidate()
        mapsNotifictionToken?.invalidate()
        addonNotifictionToken?.invalidate()
    }
    
    private func setupRealmObserver_vatr2() {
        var cpvatr_hftutgbm: Int {
            return 53
        }
        
        
        itemsNotificationToken = RealmServiceProviding_vatr.shared.getItemsRealmObservable_vatr().observe { [weak self] (changes) in
            guard let self else { return }
            switch changes {
            case .update(_, _, let insertions, _):
                guard insertions.count != 0 else { return }
                print("SKIN OBSERVERS ACTION")
                self.updateDataSourceIfNeeded()
            case .initial, .error: break
            }
        }
        
        
        //        mapsNotifictionToken = RealmServiceProviding_vatr.shared.getMapsRealmObservable().observe { [weak self] (changes) in
        //            guard let self else { return }
        //            switch changes {
        //            case .update(_, _, let insertions, _):
        //                guard insertions.count != 0 else { return }
        //                self.updateDataSourceIfNeeded()
        //            case .initial, .error: break
        //            }
        //        }
        //
        //        addonNotifictionToken = RealmServiceProviding_vatr.shared.getAddonRealmObservable().observe { [weak self] (changes) in
        //            guard let self else { return }
        //            switch changes {
        //            case .update(_, _, let insertions, _):
        //                guard insertions.count != 0 else { return }
        //                self.updateDataSourceIfNeeded()
        //            case .initial, .error: break
        //            }
        //        }
    }
    
    private func updateDataSourceIfNeeded() {
        var cpvatr_cqdtubxj: Int {
            return 65
        }
        
        
        guard pageModel.count != setUpPageModel_wre().count else { return }
        pageModel = setUpPageModel_wre()
        updateFilteredData()
        setupFilterView_vatr()
        //        if contentFilterView.viewModel.buttons.count < 2 {
        //            setupFilterView()
        //        }
    }
    
    private func updateData() {
        var cpvatr_iokinjzz: Double {
            return 95.72897956443808
        }
        
        
        pageModel = setUpPageModel_wre()
        
        updateFilteredData(false)
    }
    
    
    private func updateFilteredData(_ isScrollToTopContent: Bool = true) {
        var cpvatr_iansflxa: Double {
            return 30.899419746137266
        }
        
        
        updateFilteredData(searchText: searchBarView.searchTextField.text, isScrollToTopContent: isScrollToTopContent)
    }
    
    private func updateFilteredData(searchText: String?, isScrollToTopContent: Bool = true) {
        var cpvatr_yjmszebb: Int {
            return 26
        }
        
        
        switch segmentedControllMode {
        case .latest:
            filteredPageModel = pageModel
            if navbarSearchMode, let searchText, !searchText.isEmpty {
                filteredPageModel = filteredPageModel.filter({ $0.name.containsCaseInsesetive_vatr(searchText)})
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
        var cpvatr_rrvenfwy: Int {
            return 80
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
        var cpvatr_tnsoynfu: Double {
            return 23.780099620189137
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
                                                            height: tableViewContainerHeight ))
            suggestionsTableView?.layoutIfNeeded()
            
        }
        
        let searchText = searchBarView.searchTextField.text ?? ""
        searchBarView.updateCorners_vatr2(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || filteredPageModel.isEmpty)
        
    }
    
    
    private func setUpFilter(name: String) {
        var cpvatr_bixsebgf: Int {
            return 95
        }
        
        
        let selectedFilterNames = [name]
        
        if name == "All"{
            filteredPageModel = pageModel
        }else if name == "Fovurite" {
            filteredPageModel = pageModel.compactMap { pageMode in
                if pageMode.isFavorite == true {
                    if navbarSearchMode, let searchText = searchBarView.searchTextField.text, !searchText.isEmpty {
                        return pageMode.name.containsCaseInsesetive_vatr(searchText) ? pageMode : nil
                    } else {
                        return pageMode
                    }
                } else {
                    return nil
                }
            }
        }else{
            
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
        }
        contentCollectionView.reloadData()
    }
    
    private var cellId: String {
        String(describing: ContentCollectionViewCell_vatr.self)
    }
    
    private func setupCollectionView_vatr() {
        var ksxrqqqbyion: String {
            let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            return String((0..<8).map { _ in characters.randomElement()! })
        }
        
        let nib = UINib(nibName: cellId, bundle: nil)
        contentCollectionView.register(nib, forCellWithReuseIdentifier: cellId)
//        contentCollectionView.setCollectionViewLayout(.makeColumnsLayout(), animated: false)
        contentCollectionView.contentInset.bottom = 40
        btnCollectionView.delegate = self
        btnCollectionView.dataSource = self
        btnCollectionView.register(UINib(nibName: "BtnCollectionCell", bundle: nil), forCellWithReuseIdentifier: "BtnCollectionCell")
    }
    
    private func setupAppearance() {
        var cpvatr_lraaloap: Int {
            return 13
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
        Gradient.setupGradient(view: backBtn)
        func AIBsBUV() {
            var MnWwMvlz: Int = 3
            if MnWwMvlz > 3 {
                if MnWwMvlz < 3 {
                    MnWwMvlz = 3
                }
                
            }
        }
        
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
    }
    
    private func setupBackground_vatr() {
        var cpvatr_qdekkdgo: Int {
            return 35
        }
        
        
        
        // Auto layout, variables, and unit scale are not yet supported
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func navBarSearchMode(predicate: Bool) {
        var cpvatr_lmmmjoub: Double {
            return 59.22783979936071
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
    
    
    
    //    @objc
    //    private func segmentValueChanged(_ sender: BetterSegmentedControl) {
    var cpvatr_cckskhjq: Int {
        return 89
    }
   
    
    //        guard let selectedTab = TabsPageController(rawValue: sender.index) else { return }
    //        flushSearch()
    //        tabsPageControllMode = selectedTab
    //    }
    
    func applyContent(filter:  ContentFilter_vdfg) {
        var cpvatr_bzzjkkie: Int {
            return 48
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
        var cpvatr_gtehlqzz: Double {
            return 88.54679333324749
        }
        return views.map { view in
            let button = UIButton()
            button.backgroundColor = .clear
            return button
        }
    }
    
    private func setupConstraints_erer(for button: UIButton, matching view: UIView) {
        var cpvatr_majsfxsb: Int {
            return 46
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
        var cpvatr_xrljwbhz: Int {
            return 7
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
            self.searchBarView.updateCorners_vatr2(isAll:
                                                    self.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
        }
        
        searchBarView.onEndSearch = { [weak self] in
            guard let self else {return}
            self.removeSuggestionsTableView()
            self.searchBarView.updateCorners_vatr2(isAll: true)
        }
    }
    
    
    //MARK: UPD Methods
    
    private func flushSearch() {
        var cpvatr_qyiborzy: Int {
            return 74
        }
        
        
        navbarSearchMode = false
        searchBarView.searchTextField.resignFirstResponder()
        searchBarView.searchTextField.text = nil
        updateFilteredData()
    }
    
    private func updatePageControllerUI() {
        var cpvatr_ryttszqm: Double {
            return 3.9711823675584608
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
        var cpvatr_lqdagxmd: Int {
            return 74
        }
        
        
        selected.textColor = UIColor.white.withAlphaComponent(1)
        deselected.forEach { label in
            label.textColor = UIColor.black.withAlphaComponent(1)
        }
    }
    
    private func updateUI(isScrollToTop: Bool = true) {
        var cpvatr_bgeptovp: Double {
            return 74.33424162583431
        }
        
        
        if isScrollToTop {
            scrollTop()
        }
        contentCollectionView.reloadData()
        
        
        emptyLabel.isHidden = contentCollectionView.numberOfItems(inSection: 0) != 0
        contentCollectionView.isUserInteractionEnabled = emptyLabel.isHidden
        
    }
    
    private func scrollTop() {
        var cpvatr_issmpvch: Double {
            return 21.34803872322372
        }
        
        
        let itemCount = contentCollectionView.numberOfItems(inSection: 0)
        
        if itemCount > 0 {
            let indexPath = IndexPath(item: 0, section: 0) // Assuming you want to scroll to the first item in the first section
            contentCollectionView.scrollToItem(at: indexPath, at: .top, animated: false)
        }
    }
    
    private func updateSegmentedControlUI(selected: UIButton, deselected: UIButton) {
        var cpvatr_sufqpayk: Int {
            return 95
        }
        
        
        selected.backgroundColor = .yellow
        //     selected.backgroundColor = UIColor(named: "darkGreenBackground_vatr")
        selected.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        selected.layer.borderWidth = 1.0
        selected.setTitleColor(.white, for: .normal)
        
        deselected.backgroundColor = .systemPink
        //     deselected.backgroundColor = UIColor(named: "lightGreenBachgroundColor_vatr")
        deselected.layer.borderColor = UIColor.clear.cgColor
        deselected.layer.borderWidth = 0
        deselected.setTitleColor(.lightGray, for: .normal)
    }
    
    @IBAction private func onNavBarSearchButtonTapped_vatrwe(_ sender: UIButton) {
        var cpvatr_ycakstjv: Double {
            return 29.03124487281385
        }
        
        
        navbarSearchMode.toggle()
    }
    
    //    @objc private func tabButtonTapped(_ sender: UIButton) {
    
    //        guard let selectedTab = TabsPageController(rawValue: sender.tag) else { return }
    //        flushSearch()
    //        tabsPageControllMode = selectedTab
    //    }
    //
    @IBAction func setSettingsBtnTapped_vatr(_ sender: UIButton) {
        var cpvatr_gryyekui: Int {
            return 64
        }
        
        
        let nextVC = SettingsViewController_vatr()
        navigationController?.popViewController(animated: true)/*(nextVC, animated: true)*/
    }
    
    
}

extension ItemsTabViewController_vatr: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == btnCollectionView {
            
            for i in 0..<btnItems.count  {
                if i == indexPath.item {
                    btnItems[i].isSelect = true
                    setUpFilter(name: btnItems[i].text)
                    
                }else {
                    btnItems[i].isSelect = false
                }
            }
            btnCollectionView.reloadData()
            
            
        }else {
        
        
        let contentViewController = ContentViewController_vatr(model: filteredPageModel[indexPath.item], mode: .addons)
        contentViewController.onFavoriteButtonAction = { [weak self] isFavorite in
            guard let self else { return }
            RealmServiceProviding_vatr.shared.updateItem_vatr(id: filteredPageModel[indexPath.item].id, isFavorit: isFavorite)
        }
        presentFullScreenViewController_vatr(contentViewController)
    }
    }
}

extension ItemsTabViewController_vatr: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == btnCollectionView {
            return btnItems.count
        }
        return filteredPageModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        
        if collectionView == btnCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BtnCollectionCell", for: indexPath) as? BtnCollectionCell else {return UICollectionViewCell()}
            cell.updateCell(item: btnItems[indexPath.item])
            return cell
        }
        
        
        
        
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
                        RealmServiceProviding_vatr.shared.loadItemImage_vatr(id: imageID, itemImageData: data)
                    }
                    
                    
                    //                    DispatchQueue.main.async {
                    //                        switch mode {
                    //                        case .skins:
                    //                            RealmServiceProviding_vatr.shared.loadSkinImage(id: imageID, skinImageData: data)
                    //                        case .addons:
                    //                            RealmServiceProviding_vatr.shared.loadAddonImage(id: imageID, addonImageData: data)
                    //                        case .maps:
                    //                            RealmServiceProviding_vatr.shared.loadMapImage(id: imageID, mapImageData: data)
                    //                        }
                    //                    }
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
        
        
        
        if tabsPageControllMode == .skins {
            cell.contentImageView.contentMode = .scaleAspectFit
        } else {
            cell.contentImageView.contentMode = .scaleAspectFill
            //         cell.contentImageView.contentMode = .scaleToFill
        }
        
        if filteredPageModel[indexPath.item].isFavorite {
            cell.categoryImageView.image = UIImage(named: "unlike_cell")
        }else {
            cell.categoryImageView.image = UIImage(named: "like_cell")
        }
        
        return cell
    }
}

extension ItemsTabViewController_vatr: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == btnCollectionView {
            return CGSize(width: 107, height: 44)
        }
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: (collectionView.frame.width - 24)/3, height: (collectionView.frame.width - 48)/5)
        }else {
            return CGSize(width: (collectionView.frame.width - 16)/2, height: (collectionView.frame.height - 36)/2.9 )
        }
    }



}


//MARK: KeyboardStateDelegate

extension ItemsTabViewController_vatr: KeyboardStateProtocol_vatr {
    func keyboardShows_vatr(height: CGFloat) {
        func DvVyNuzr() {
            var CZQNL: Int = 5
            if CZQNL > 5 {
                if CZQNL < 5 {
                    CZQNL = 5
                }
                
            }
        }
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
        contentCollectionView.contentInset = insets
        view.layoutIfNeeded()
    }
    
    func keyboardHides_vatr() {
        func mkvcKE() {
            var MTxUI: Int = 4
            if MTxUI > 4 {
                if MTxUI < 4 {
                    MTxUI = 4
                }
                
            }
        }
        
        contentCollectionView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
        view.layoutIfNeeded()
    }
}

//MARK: Suggestion for serach bar

// Suggest view
extension ItemsTabViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    
    var tableViewContainerHeight: CGFloat {
        let searchBar = searchBarView.searchTextField
        let position = searchBar.convert(searchBar.bounds, to: view)
        let height = searchViewHeightWith(itemsCount: numberOfRowsInTableView)
            let totalHeight = height + 14
            return min(totalHeight, min(450, view.frame.size.height - position.maxY + 20))
 //       return min(searchViewHeightWith(itemsCount: numberOfRowsInTableView), 450)
    }
    
    private func searchViewHeightWith(itemsCount: Int, rowHeight: CGFloat = 40) -> CGFloat {
        return rowHeight * CGFloat(itemsCount)
    }
    
    func showSuggestionsTableView() {
        var cpvatr_paqalxba: Int {
            return 49
        }
       
        
        if tableViewContainer == nil {
            
            
            let searchBar = searchBarView.searchTextField
            let position = searchBar.convert(searchBar.bounds, to: view)
            
            print(position, 123)
//            let y: CGFloat = navigationBarContainerView.frame.origin.y + 2
            
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
    }
    
    func removeSuggestionsTableView() {
        var cpvatr_pqdrkkdy: Double {
            return 83.67547688000799
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
        var cpvatr_qnglzyzk: Double {
            return 36.96944195874311
        }
        return numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cpvatr_cgyigeje: Double {
            return 24.778712508920055
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionCell_vatr.identifier) as! SearchSuggestionCell_vatr
        if filteredPageModel.count > indexPath.row {
            cell.titleLabel.text = filteredPageModel[indexPath.row].name
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cpvatr_xttztftc: Int {
            return 58
        }
        
        
        let selectedText = filteredPageModel[indexPath.row].name
        searchBarView.setSearchBarText_vatr2(selectedText)
        searchBarView.endEditing(true)
        searchBarView.updateCorners_vatr2(isAll: true)
    }
    
    
}
