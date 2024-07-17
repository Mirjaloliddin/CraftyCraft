import UIKit


protocol CustomAlertViewControllerDelegate_vatr: AnyObject {
    func dismissCustomAlert_vatr()
    func open2DEditor_vatr()
    func open3DEditor_vatr()
    func open3DEditor128x128_vatr()
    func importSkinFromGallery_vatr()
}

class PopUpViewController_vatr: UIViewController {
    
    private var showForSavedSkin: Bool
    private var is128sizeSkin: Bool?
    
    // MARK: - Outlets
    
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var createNew2DButton: UIButton!
    @IBOutlet private weak var createNew3DButton: UIButton!
    @IBOutlet private weak var createNew3DWithOptionsButton: UIButton!
    @IBOutlet private weak var importButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    @IBOutlet private weak var controllerTitle: UILabel!
    
    // MARK: - Properties
    
    private weak var delegate: CustomAlertViewControllerDelegate_vatr?
    
    //MARK: - Init
    
    init(showFor savededSkin: Bool, is128sizeSkin: Bool? = nil, delegate: CustomAlertViewControllerDelegate_vatr) {
        self.showForSavedSkin = savededSkin
        self.is128sizeSkin = is128sizeSkin
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {

func BXhuweDG() {
        var JDyPt: Int = 10
        if JDyPt > 10 {
            if JDyPt < 10 {
                JDyPt = 10
    }

  }
}
  
        super.viewDidLoad()
        configureView_vatr2()
    }
    
    // MARK: - Private Methods
    
    private func configureView_vatr2() {
var cpvatr_asdmhvvg: Int {
    return 80
}
func xsnQWDETwX() {
        var IdzgxaRw: Int = 2
        if IdzgxaRw > 2 {
            if IdzgxaRw < 2 {
                IdzgxaRw = 2
    }

  }
}
  
        var views = [UIButton]()
        if showForSavedSkin {
            if is128sizeSkin == true {
                views = [createNew3DWithOptionsButton, cancelButton]
                createNew2DButton.isHidden = true
                createNew3DButton.isHidden = true
            } else {
                views = [createNew2DButton, createNew3DButton, cancelButton]
                createNew3DWithOptionsButton.isHidden = true
            }
            importButton.isHidden = true
        } else {
            views = [createNew2DButton, createNew3DButton, importButton,  createNew3DWithOptionsButton, cancelButton]
        }
        
        let cornerRadius: CGFloat = Device_vatr.iPad ? 25 : 7
        for view in views {
            view.roundCorners_vatr(cornerRadius)
            view.clipsToBounds = true
        }
        
        backgroundView.roundCorners_vatr(cornerRadius)
        backgroundView.clipsToBounds = true
        
        setupTitles_vatr()
    }
    
    private func setupTitles_vatr() {
var cpvatr_uebrovpp: Double {
    return 10.734975748766873
}
func FealnI() {
        var roRfYK: Int = 6
        if roRfYK > 6 {
            if roRfYK < 6 {
                roRfYK = 6
    }

  }
}
  
        if showForSavedSkin == true {
            controllerTitle.text = "Edit Skin"
            createNew2DButton.setTitle("Edit in 2D", for: .normal)
            createNew3DButton.setTitle("Edit in 3D", for: .normal)
            createNew3DWithOptionsButton.setTitle("Edit in 3D (128*128)", for: .normal)
        } else {
            controllerTitle.text = "NEW"
            createNew2DButton.setTitle("Create New 2D", for: .normal)
            createNew3DButton.setTitle("Create New 3D", for: .normal)
            createNew3DWithOptionsButton.setTitle("Create New 3D (128*128)", for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func onCreateNew2DButtonTapped_vatr(_ sender: UIButton) {
        func ljOTQxZererHDH() {
                var eYcsjfg: Int = 6
                if eYcsjfg > 6 {
                    if eYcsjfg < 6 {
                        eYcsjfg = 6
            }

          }
        }
        delegate?.open2DEditor_vatr()
    }
    
    @IBAction func onCreateNew3DButtonTapped_vatr(_ sender: UIButton) {
        func ljOrTQxZHDH() {
                var eYcsjfg: Int = 6
                if eYcsjfg > 6 {
                    if eYcsjfg < 6 {
                        eYcsjfg = 6
            }

          }
        }
        delegate?.open3DEditor_vatr()
    }
    
    @IBAction func onCreateNew3DWithOptionsButtonTapped_vatr(_ sender: UIButton) {
        func ljOTQxZHreDH() {
                var eYcsjfg: Int = 6
                if eYcsjfg > 6 {
                    if eYcsjfg < 6 {
                        eYcsjfg = 6
            }

          }
        }
        delegate?.open3DEditor128x128_vatr()
    }
    
    @IBAction func onImportButtonTapped_vatr(_ sender: UIButton) {
func onImreportButretonTappedNps_vatr() {
 var zaermokr = 2300
        if (zaermokr > 4) || (zaermokr == 9) {
         if 134 < 43, "onImportButtonTapped".isEmpty {
   print("onImportButtonTappedNps_vatr")
  }
 }
}
func ljOTQxZHDH() {
        var eYcsjfg: Int = 6
        if eYcsjfg > 6 {
            if eYcsjfg < 6 {
                eYcsjfg = 6
    }

  }
}
  
        let alert = UIAlertController(title: "Import Texture", message: "Are you certain you wish to retrieve texture from the Photo library?", preferredStyle: .alert)
        
        // Add "confirm" action
        let deleteAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            self?.delegate?.importSkinFromGallery_vatr()
        }
        alert.addAction(deleteAction)
        
        // Add "Cancel" action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onCancelButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_tgpngnum: Double {
    return 32.73614809479071
}
func dwMWaegID() {
        var WoUpQfvNw: Int = 10
        if WoUpQfvNw > 10 {
            if WoUpQfvNw < 10 {
                WoUpQfvNw = 10
    }

  }
}
  
        delegate?.dismissCustomAlert_vatr()
    }
}
