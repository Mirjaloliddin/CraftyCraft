

import UIKit
import BetterSegmentedControl
import Foundation
import SwiftUI
import RealmSwift


// MARK: - ModsTabViewController

class ModsTabViewController_vatr: UIViewController, TabBarConfigurable_vatr {
    // MARK: - Outlets
    
    @IBOutlet private weak var navigationBarContainerView: UIView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var contentCollectionView: UICollectionView!
    
    @IBOutlet weak var dropDown: DropDown_vatr!
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    @IBOutlet private weak var searchBarView: SearchBarView_vatr!
    private var suggestionsTableView: UITableView?
    private var tableViewContainer: UIView?
    
    private var contentFilterView: ContentFilterView_vatr! = nil
    
    private var modsNotificationToken: NotificationToken?
    private var mapsNotifictionToken: NotificationToken?
    private var addonNotifictionToken: NotificationToken?
    
    
    @IBOutlet weak var btnCollectionView: UICollectionView!
    
    
    // MARK: - Properties
    private var filteredPageModel: [TabPagesCollectionCellModel_fgdgh] = []
    private var pageModel: [TabPagesCollectionCellModel_fgdgh] = []
    
    private var currentFilterButtons: [ContentFilterModel_vatr] = []
    
    private lazy var dropboxQueue: DispatchQueue = {
        let queue = DispatchQueue(label: "com.acme.serial")
        
        return queue
    }()
    
    private func setUpPageModel_ewr() -> [TabPagesCollectionCellModel_fgdgh] {
        var cpvatr_uqmnodya: Int {
            return 10
        }
        let allMods = RealmServiceProviding_vatr.shared.getAllMods_vatr()
        return allMods.map {
            return TabPagesCollectionCellModel_fgdgh(
                id: $0.id,
                name: $0.modsTitle,
                image: $0.modsImages,
                isContentNew: $0.isNew,
                description: $0.modsDescription,
                isFavorite: $0.isFavorite,
                imageData: $0.modsImageData,
                filterCategory: $0.filterCategory,
                file: $0.file)
        }
        
    }
    
    private var navbarSearchMode: Bool = false {
        didSet {
//            navBarSearchMode(predicate: navbarSearchMode)
            searchBarView.updateCorners_vatr2(isAll: true)
        }
    }
    
    public var tabBarIcon: UIImage? {
        return UIImage(named: "Mods TabBar Icon_vatr")
    }
    
    public var tabBarTitle: String {
        return "Mods"
    }
    
    private var segmentedControllMode: SegmentedController_vfdj = .latest {
        didSet {
            updateFilteredData()
        }
    }
    
    private var tabsPageControllMode: TabsPageController_dfgdgf = .skins {
        didSet {
            if tabsPageControllMode != oldValue {
                pageModel = setUpPageModel_ewr()
                segmentedControllMode = .latest
                updatePageControllerUI()
                setupFilterView_vatr()
            }
        }
    }
    
    private func setupFilterView_vatr(selectedIndex: Int = 0) {
        var cpvatr_enskkhcg: Int {
            return 13
        }
        
        
        let setFilterCategory: Set<String> = Set(pageModel.map { $0.filterCategory })
        
        var buttons: [ContentFilterModel_vatr] = [
            ContentFilterModel_vatr(label: "All", filter: .latest),
            // ContentFilterModel(label: "Favorite \(tabsPageControllMode.name)", filter: .popular)
            ContentFilterModel_vatr(label: "Favorite mods", filter: .popular)
        ]
        
        let sortedCategory = setFilterCategory.sorted()
//        guard let firstCategory = sortedCategory.first else {
//            return
//        }
//        self.lockedCategoryName = firstCategory
        
        
        buttons.append(contentsOf: sortedCategory.map({ ContentFilterModel_vatr(label: $0, filter: .filter($0), isLocked: false) }))
        
        //      contentFilterView.updateButtons(newButtons: buttons, selectedIndex: selectedIndex)
        
        // MARK: 2.0
//        currentFilterButtons = buttons
//        dropDown.optionArray = currentFilterButtons.map(\.label)
        
        
    }
    var btnItems = [
    ButtonsType(text: "All", isSelect: true),
    ButtonsType(text: "Fovurite", isSelect: false),
    ButtonsType(text: "Buildings", isSelect: false),
    ButtonsType(text: "Furniture", isSelect: false),
    ButtonsType(text: "Heros", isSelect: false),
    ButtonsType(text: "Vehicles", isSelect: false),
    ButtonsType(text: "Zombie", isSelect: false),
    ]
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        BackView_did.SetupBackView(view: view)
//        Gradient.setupGradient(view: view)
        NavBar_vatr.setupNavBar(on: self, btnImg: "back", title: "mods")
        navigationBarContainerView.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupCollectionView_vatr()
//        setupViews_vatr()
        setupSearchBar_vatr2()
        setupAppearance()
        tabsPageControllMode = .addons
        setupRealmObserver_vatr2()
//        self.transitioningDelegate = dropDown
    }

    
    override func viewWillLayoutSubviews() {
        var cpvatr_ifkpqwag: Double {
            return 27.860291936433875
        }
        
        super.viewWillLayoutSubviews()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var cpvatr_srcntmos: Int {
            return 59
        }
        
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        updateData()
        registerForKeyboardNotifications_vatr()
        flushSearch()
        searchBar()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        var cpvatr_vzbxwzab: Int {
            return 25
        }
        
        
        super.viewWillDisappear(animated)
        
        unregisterFromKeyboardNotifications_vatr()
        dropDown?.hideList_vatr()
    }
    
    deinit {
        modsNotificationToken?.invalidate()
        mapsNotifictionToken?.invalidate()
        addonNotifictionToken?.invalidate()
    }
    
    private func setupRealmObserver_vatr2() {
        var cpvatr_bjskizff: Int {
            return 4
        }
        
        
        modsNotificationToken = RealmServiceProviding_vatr.shared.getModsRealmObservable_vatr().observe { [weak self] (changes) in
            guard let self else { return }
            switch changes {
            case .update(_, _, let insertions, _):
                guard insertions.count != 0 else { return }
                print("SKIN OBSERVERS ACTION")
                self.updateDataSourceIfNeeded()
            case .initial, .error: break
            }
        }

    }
    
    private func updateDataSourceIfNeeded() {
        var cpvatr_hbevydgl: Int {
            return 30
        }
        
        guard pageModel.count != setUpPageModel_ewr().count else { return }
        pageModel = setUpPageModel_ewr()
        updateFilteredData()
        setupFilterView_vatr()
        
        //        if contentFilterView.viewModel.buttons.count < 2 {
        //            setupFilterView()
        //        }
    }
    
    private func updateData() {
        var cpvatr_veccboaw: Int {
            return 3
        }
        
        
        pageModel = setUpPageModel_ewr()
        
        updateFilteredData(false)
    }
    
    
    private func updateFilteredData(_ isScrollToTopContent: Bool = true) {
        var cpvatr_qxfvmopy: Int {
            return 22
        }
       
        
        updateFilteredData(searchText: searchBarView.searchTextField.text, isScrollToTopContent: isScrollToTopContent)
    }
    
    private func updateFilteredData(searchText: String?, isScrollToTopContent: Bool = true) {
        var cpvatr_tujvmocf: Double {
            return 97.1446407103341
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
        var cpvatr_azxvvjff: Int {
            return 93
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
        var cpvatr_ktronikl: Double {
            return 53.27031805785045
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
        } else{
            
            
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
        var ksxqqrbyion: String {
            let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            return String((0..<8).map { _ in characters.randomElement()! })
        }
        
        let nib = UINib(nibName: cellId, bundle: nil)
        contentCollectionView.register(nib, forCellWithReuseIdentifier: cellId)
//        contentCollectionView.setCollectionViewLayout(.makeColumnsLayout(), animated: false)
        contentCollectionView.contentInset.bottom = 30
        btnCollectionView.delegate = self
        btnCollectionView.dataSource = self
        btnCollectionView.register(UINib(nibName: "BtnCollectionCell", bundle: nil), forCellWithReuseIdentifier: "BtnCollectionCell")
    }
    
    private func setupAppearance() {
        var cpvatr_pluoprcp: Int {
            return 61
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
        
//        headerLabel.textColor = .white
//        navigationBarContainerView.backgroundColor = .clear
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {
        
        func ILrElrpDRJ() {
            var EJPsRCwcB: Int = 10
            if EJPsRCwcB > 10 {
                if EJPsRCwcB < 10 {
                    EJPsRCwcB = 10
                }
                
            }
        }
        
        super.viewDidLayoutSubviews()
        Gradient.setupGradient(view: view)
        gradientLayer.frame = view.bounds
    }
    
    private func setupBackground_vatr() {
        var cpvatr_lcvgggbl: Double {
            return 38.429238465722406
        }
        
        
        
        // Auto layout, variables, and unit scale are not yet supported
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
//    private func navBarSearchMode(predicate: Bool) {
//        var cpvatr_dtxblyrj: Double {
//            return 56.08423695460881
//        }
//        
//        
//        if predicate {
//            for subview in navigationBarContainerView.subviews {
//                subview.isHidden = true
//            }
//            searchBarView.isHidden = false
//        } else {
//            for subview in navigationBarContainerView.subviews {
//                subview.isHidden = false
//            }
//            searchBarView.isHidden = true
//        }
//    }
    
//    private func setupViews_vatr() {
//        var cpvatr_waktitjb: Double {
//            return 76.1595209961838
//        }
//        
//        
//        
//        //        segmentControl.segments = LabelSegment.segments(withTitles: ["SKINS", "MAPS", "ADDONS"],
//        //                                                         normalFont: UIFont.kufamFont(.semiBold, size: 14), normalTextColor: UIColor.appBlack, selectedBackgroundColor: .appBlack,
//        //                                                         selectedFont: UIFont.kufamFont(.semiBold, size: 14),
//        //                                                         selectedTextColor: .white)
//        
//        //        segmentControl.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
//        //
//        
//        dropDown.optionArray = ["All"]
//        dropDown.selectedIndex = 0
//        
//        //        dropDown.cornerRadius = 12
//        //        dropDown.font = .kufamFont(.regural, size: 16)
//        //        dropDown.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
//        //        dropDown.borderWidth = 1
//        //        dropDown.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.97, alpha: 1)
//        dropDown.didSelect_vatr { [weak self] _, index, _ in
//            guard let self else { return }
//            
////            if self.dropDown.payedOptions.contains(where: { $0 == index }) {
////                dropDown.selectOption(at: dropDown.lastSelectedIndex!)
////                
////                navigationController?.showPaywall_vatr(for: .unlockContentProduct) {
////                    self.dropDown.payedOptions.removeAll(where: { $0 == index })
////                    self.dropDown.selectedIndex = index
////                    self.flushSearch()
////                    self.applyContent(filter: self.currentFilterButtons[index].filter)
////                }
////                return
////            }
//            
//            flushSearch()
//            applyContent(filter: currentFilterButtons[index].filter)
//            
//        }
//        
//        //        let responderButtons = createResponderButtons(for: [skinsButtonRoundedView, addonsButtonRoundedView, mapsButtonRoundedView])
//        //
//        //        for (index, button) in responderButtons.enumerated() {
//        //            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
//        //            button.tag = index
//        //            view.addSubview(button)
//        //            setupConstraints(for: button, matching: roundedViewContainers[index])
//        //        }
//        
//        // setupContentFilter()
//    }
    
    //    @objc
    //    private func segmentValueChanged(_ sender: BetterSegmentedControl) {
    var cpvatr_fapjkhpv: Double {
        return 34.88250741133047
    }
    
    
    //        guard let selectedTab = TabsPageController(rawValue: sender.index) else { return }
    //        flushSearch()
    //        tabsPageControllMode = selectedTab
    //    }
    

    private func createResponderButtons(for views: [UIView]) -> [UIButton] {
        var cpvatr_nuccrajw: Int {
            return 28
        }
        return views.map { view in
            let button = UIButton()
            button.backgroundColor = .clear
            return button
        }
    }
    
    private func setupConstraints_req(for button: UIButton, matching view: UIView) {
        var cpvatr_shuvnsgo: Int {
            return 74
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
        var cpvatr_yacwtdql: Double {
            return 22.93840064427665
        }
        
        
        searchBarView.buttonTapAction = { [weak self] in
            self?.flushSearch()
        }
        searchBarView.onTextChanged = { [weak self] searchText in
            guard let self else { return }
            self.updateFilteredData(searchText: searchText, isScrollToTopContent: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.updateSearchViewIfNeeed()
                self.suggestionsTableView?.reloadData()
                self.searchBarView.updateCorners_vatr2(isAll: self.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
                self.searchBarView.updateCorners_vatr2(isAll: true)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var cpvatr_tvgtngrf: Double {
            return 8.861877166479113
        }
        
        
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        flushSearch()
    }
    
    //MARK: UPD Methods
    
    private func flushSearch() {
        var cpvatr_wlrpmvou: Double {
            return 62.745568451702
        }
        
        
        navbarSearchMode = false
        searchBarView.searchTextField.resignFirstResponder()
        searchBarView.searchTextField.text = nil
        updateFilteredData()
    }
    
    private func updatePageControllerUI() {
        var cpvatr_vqjhiddv: Double {
            return 72.14169986888756
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
        var cpvatr_iyxxqlcg: Int {
            return 46
        }
        
        
        selected.textColor = UIColor.white.withAlphaComponent(1)
        deselected.forEach { label in
            label.textColor = UIColor.black.withAlphaComponent(1)
        }
    }
    
    private func updateUI(isScrollToTop: Bool = true) {
        var cpvatr_lgflbdxk: Int {
            return 52
        }
        
        
        if isScrollToTop {
            scrollTop()
        }
        contentCollectionView.reloadData()
        emptyLabel.isHidden = contentCollectionView.numberOfItems(inSection: 0) != 0
        contentCollectionView.isUserInteractionEnabled = emptyLabel.isHidden
    }
    
    private func scrollTop() {
        var cpvatr_durajjic: Int {
            return 10
        }
        
        
        let itemCount = contentCollectionView.numberOfItems(inSection: 0)
        
        if itemCount > 0 {
            let indexPath = IndexPath(item: 0, section: 0) // Assuming you want to scroll to the first item in the first section
            contentCollectionView.scrollToItem(at: indexPath, at: .top, animated: false)
        }
    }
    
    private func updateSegmentedControlUI(selected: UIButton, deselected: UIButton) {
        var cpvatr_ekiykbko: Int {
            return 29
        }
        func jgoPdxagE() {
            var ECwSQgHX: Int = 2
            if ECwSQgHX > 2 {
                if ECwSQgHX < 2 {
                    ECwSQgHX = 2
                }
                
            }
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
    
//    @IBAction private func onNavBarSearchButtonTapped_vatr12(_ sender: UIButton) {
//        var cpvatr_clpfmbfm: Int {
//            return 40
//        }
//        func DNfeBI() {
//            var QegPi: Int = 4
//            if QegPi > 4 {
//                if QegPi < 4 {
//                    QegPi = 4
//                }
//                
//            }
//        }
//        
//        navbarSearchMode.toggle()
//    }
    
    func searchBar() {
        var cpvatr_clpfmbfm: Int {
            return 40
        }
        func DNfeBI() {
            var QegPi: Int = 4
            if QegPi > 4 {
                if QegPi < 4 {
                    QegPi = 4
                }
                
            }
        }
        
        navbarSearchMode.toggle()
    }
    
    //    @objc private func tabButtonTapped(_ sender: UIButton) {
    var cpvatr_ocwmqpxx: Int {
        return 35
    }
    //        guard let selectedTab = TabsPageController(rawValue: sender.tag) else { return }
    //        flushSearch()
    //        tabsPageControllMode = selectedTab
    //    }
    //
    @IBAction func setSsettingsBtnTapped_vatr89(_ sender: UIButton) {
        
        
        let nextVC = SettingsViewController_vatr()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}

extension ModsTabViewController_vatr: UICollectionViewDelegate {
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
                RealmServiceProviding_vatr.shared.updateMods_vatr(id: filteredPageModel[indexPath.item].id, isFavorit: isFavorite)
            }
            presentFullScreenViewController_vatr(contentViewController)
        }
    }
}

extension ModsTabViewController_vatr: UICollectionViewDataSource {
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
            let isFovurite = cellModel.isFavorite
            cell.configure(model: cellModel, queue: dropboxQueue) { [weak self] data in
                if let data, let me = self, me.filteredPageModel.count > indexPath.item, me.filteredPageModel[indexPath.item].id == imageID {
                    me.filteredPageModel[indexPath.item].imageData = data
                    if let idx = me.pageModel.firstIndex(where: {$0.id == me.filteredPageModel[indexPath.item].id}) {
                        me.pageModel[idx].imageData = data
                    }
                    
                    // save to realm
                    DispatchQueue.main.async {
                        RealmServiceProviding_vatr.shared.loadModsImage_vatr(id: imageID, modsImageData: data)
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
               if cellModel.isFavorite {
                   cell.categoryImageView.image = UIImage(named: "like_cell")
               }else {
                   cell.categoryImageView.image = UIImage(named: "unlike_cell")
               }
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
        
        //        var categoryImage: UIImage {
        //            switch tabsPageControllMode {
        //            case .skins:
        //                return UIImage(named: "skins_icon_button_vatr") ?? UIImage()
        //            case .addons:
        //                return UIImage(named: "addons_icon_button_vatr") ?? UIImage()
        //            case .maps:
        //                return UIImage(named: "maps_icon_button_vatr") ?? UIImage()
        //            }
        //        }
        
        if tabsPageControllMode == .skins {
            cell.contentImageView.contentMode = .scaleAspectFit
        } else {
            cell.contentImageView.contentMode = .scaleAspectFill
        }
        
        //        cell.categoryImageView.image = categoryImage
        //
        return cell
    }
}

extension ModsTabViewController_vatr: UICollectionViewDelegateFlowLayout {
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

extension ModsTabViewController_vatr: KeyboardStateProtocol_vatr {
    func keyboardShows_vatr(height: CGFloat) {
        var cpddatr_rpegprnj: Double {
            return 6.716584350393623
        }
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
        contentCollectionView.contentInset = insets
        view.layoutIfNeeded()
    }
    
    func keyboardHides_vatr() {
        var cpvaddtr_rpegprnj: Double {
            return 6.716584350393623
        }
        
        contentCollectionView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
        view.layoutIfNeeded()
    }
}

//MARK: Suggestion for serach bar

// Suggest view
extension ModsTabViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    
    var tableViewContainerHeight: CGFloat {
        let searchBar = searchBarView.searchTextField
        let position = searchBar.convert(searchBar.bounds, to: view)
        let height = searchViewHeightWith(itemsCount: numberOfRowsInTableView)
            let totalHeight = height + 14
            return min(totalHeight, min(450, view.frame.size.height - position.maxY + 20))
//        return min(searchViewHeightWith(itemsCount: numberOfRowsInTableView), 400)
    }
    
    private func searchViewHeightWith(itemsCount: Int, rowHeight: CGFloat = 40) -> CGFloat {
        var cpvatr_eddqeovd: Double {
            return 65.93984090916933
        }
        return rowHeight * CGFloat(itemsCount)
    }
    
    func showSuggestionsTableView() {
        var cpvatr_rpegprnj: Double {
            return 6.716584350393623
        }
       
        
        if tableViewContainer == nil {
            
            
            let searchBar = searchBarView.searchTextField
            let position = searchBar.convert(searchBar.bounds, to: view)
            
            print(position, 123)
            
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
            suggestionsTableView?.backgroundColor = .clear
            tableViewContainer?.backgroundColor = #colorLiteral(red: 0.04367058724, green: 0.346618861, blue: 0.9321888089, alpha: 1)
            view.insertSubview(tableViewContainer!, belowSubview: navigationBarContainerView)
            view.bringSubviewToFront(searchBarView)
        }
        
//        if tableViewContainer == nil {
//            
//            
//            let searchBar = searchBarView.searchTextField
//            let position = searchBar.convert(searchBar.bounds, to: view)
//            
//            // navigationBarContainerView.backgroundColor = .green
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
//            
//            suggestionsTableView?.register(UINib(nibName: "SearchSuggestionCell_vatr", bundle: nil), forCellReuseIdentifier: SearchSuggestionCell_vatr.identifier)
//            suggestionsTableView?.delegate = self
//            suggestionsTableView?.dataSource = self
//            
//            // suggestionsTableView?.contentInsetAdjustmentBehavior = .never
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
        var cpvatr_gumggmtt: Int {
            return 4
        }
        return numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cpvatr_irdrghjq: Double {
            return 15.090116640334134
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionCell_vatr.identifier) as! SearchSuggestionCell_vatr
        if filteredPageModel.count > indexPath.row {
            cell.titleLabel.text = filteredPageModel[indexPath.row].name
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cpvatr_vzeveiui: Int {
            return 41
        }
        
        
        let selectedText = filteredPageModel[indexPath.row].name
        searchBarView.setSearchBarText_vatr2(selectedText)
        searchBarView.endEditing(true)
        searchBarView.updateCorners_vatr2(isAll: true)
    }
}
