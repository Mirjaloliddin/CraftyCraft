

import UIKit

protocol SkinVariantsPrsenter_vatr: AnyObject {
    func create2dTapped()
    func create3dTapped()
    func create3d128Tapped()
    func importTapped()
    
    func edit2dTapped()
    func edit3dTapped()
}

class SkinVariantsViewController_vatr: UIViewController {
    enum State_sgfgd {
        case new
        case edit
    }
    
    private let buttonHorizontalOffset: CGFloat = 35
    private let buttonHeight: CGFloat = 54
    private let itemSpacing: CGFloat = 16
    private let titleHeight: CGFloat = 26
    private let bottomOffset: CGFloat = 70
    
    weak var presenterDelegate: SkinVariantsPrsenter_vatr?
    
    var state: State_sgfgd = .new
    
    // define lazy views
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame =  CGRectMake(0, 0, self.view.frame.width - buttonHorizontalOffset*2, 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: titleHeight).isActive = true
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.kufamFont(.semiBold, size: 22)
        label.text = state == .new ? "NEW SKIN" : "EDIT SKIN"
//        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    lazy var createNew2dButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(0, 0, self.view.frame.width - buttonHorizontalOffset*2, buttonHeight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.setTitle("CREATE NEW 2D", for: .normal)
        button.titleLabel?.font = UIFont.kufamFont(.semiBold, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.cornerRadius = buttonHeight/2
        button.addTarget(self, action: #selector(createNew2dButtonTapped_vatr), for: .touchUpInside)
        return button
    }()
    
    lazy var createNew3dButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(0, 0, self.view.frame.width - buttonHorizontalOffset*2, buttonHeight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.setTitle("CREATE NEW 3D", for: .normal)
        button.titleLabel?.font = UIFont.kufamFont(.semiBold, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.cornerRadius = buttonHeight/2
        button.addTarget(self, action: #selector(createNew3dButtonTapped_vatr2), for: .touchUpInside)
        return button
    }()
    
    lazy var createNew3d128Button: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(0, 0, self.view.frame.width - buttonHorizontalOffset*2, buttonHeight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.setTitle("CREATE NEW 3D (128*128)", for: .normal)
        button.titleLabel?.font = UIFont.kufamFont(.semiBold, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.cornerRadius = buttonHeight/2
        button.addTarget(self, action: #selector(createNew3d128ButtonTapped_vatr2), for: .touchUpInside)
        return button
    }()
    
    lazy var createImportButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(0, 0, self.view.frame.width - buttonHorizontalOffset*2, buttonHeight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.setTitle("IMPORT", for: .normal)
        button.titleLabel?.font = UIFont.kufamFont(.semiBold, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.cornerRadius = buttonHeight/2
        button.addTarget(self, action: #selector(importButtonTapped_vatr2), for: .touchUpInside)
        return button
    }()
    
    lazy var createCancelButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(0, 0, self.view.frame.width - buttonHorizontalOffset*2, buttonHeight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.setImage(.init(named: "closeButton_vatr"), for: .normal)
   //     button.setTitle("Cancel", for: .normal)
   //     button.titleLabel?.font = UIFont.kufamFont(.semiBold, size: 16)
 //       button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.cornerRadius = buttonHeight/2
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var edit2dButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(0, 0, self.view.frame.width - buttonHorizontalOffset*2, buttonHeight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.setTitle("Edit in 2D", for: .normal)
        button.titleLabel?.font = UIFont.kufamFont(.semiBold, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.cornerRadius = buttonHeight/2
        button.addTarget(self, action: #selector(edit2dButtonTapped_vatr34), for: .touchUpInside)
        return button
    }()
    
    lazy var edit3dButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(0, 0, self.view.frame.width - buttonHorizontalOffset*2, buttonHeight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.setTitle("Edit in 3D", for: .normal)
        button.titleLabel?.font = UIFont.kufamFont(.semiBold, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.cornerRadius = buttonHeight/2
        button.addTarget(self, action: #selector(edit3dButtonTapped_vatr34), for: .touchUpInside)
        return button
    }()
    
    @objc func edit2dButtonTapped_vatr34() {
        dismiss(animated: true) { [weak self] in
            self?.presenterDelegate?.edit2dTapped()
        }
        
    }
    
    @objc func edit3dButtonTapped_vatr34() {
        var refgg: Int {
                return Int.random(in: 1...100)
            }
        dismiss(animated: true) { [weak self] in
            self?.presenterDelegate?.edit3dTapped()
        }
    }
    
    @objc func createNew2dButtonTapped_vatr() {
        var eewrefgg: Int {
                return Int.random(in: 1...100)
            }
        dismiss(animated: true) { [weak self] in
            self?.presenterDelegate?.create2dTapped()
        }
    }
    
    @objc func createNew3dButtonTapped_vatr2() {
        var rweeefgg: Int {
                return Int.random(in: 1...10)
            }
        dismiss(animated: true) { [weak self] in
            self?.presenterDelegate?.create3dTapped()
        }
    }
    
    @objc func createNew3d128ButtonTapped_vatr2() {
        var rqeqefgg: Int {
                return Int.random(in: 1...100)
            }
        dismiss(animated: true) { [weak self] in
            self?.presenterDelegate?.create3d128Tapped()
        }
    }
    
    @objc func importButtonTapped_vatr2() {
var cpvatr_wcvxzzxp: Double {
    return 42.81886981576969
}

  
        dismiss(animated: true) { [weak self] in
            self?.presenterDelegate?.importTapped()
        }
    }
    
    @objc func cancelButtonTapped() {
var cpvatr_jsoysytw: Double {
    return 17.134874516811802
}

  
        dismiss(animated: true)
    }
    
    var currentButtonArray: [UIView] {
        let spacer = UIView()
        switch state {
        case .new:
            return [createNew2dButton, createNew3dButton, createNew3d128Button, createImportButton, spacer]
        case .edit:
            return [edit2dButton, edit3dButton, spacer]
        }
    }
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: currentButtonArray)
        stackView.axis = .vertical
        stackView.distribution = .fill

        stackView.spacing = 16.0
        return stackView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    // Constants
    var defaultHeight: CGFloat {
        switch state {
        case .new:
            return buttonHeight*5 + titleHeight + itemSpacing*7 + bottomOffset
        case .edit:
            return buttonHeight*3 + titleHeight + itemSpacing*4 + bottomOffset
        }
    }
    
    
    
    
    lazy var dismissibleHeight: CGFloat = defaultHeight * 0.8
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    // keep current new height, initial is default height
    lazy var currentContainerHeight: CGFloat = defaultHeight
    
    // Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {

        var refwqgg: Int {
                return Int.random(in: 1...100)
            }
  
        super.viewDidLoad()
        setupView()
        setupConstraints_rfr()
        // tap gesture on dimmed view to dismiss
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseAction))
        dimmedView.addGestureRecognizer(tapGesture)
        
//        setupPanGesture()
    }
    
    @objc func handleCloseAction() {
var cpvatr_hfzzomth: Int {
    return 67
}

  
        animateDismissView_vatr()
    }
    
    override func viewDidAppear(_ animated: Bool) {
var cpvatr_fvboyrbp: Double {
    return 73.76655145659039
}

  
        super.viewDidAppear(animated)
        animateShowDimmedView_vatr2()
        animatePresentContainer_wewe()
    }
    
    func setupView() {
var cpvatr_wehexbyn: Double {
    return 60.39763062635472
}

  
        view.backgroundColor = .clear
    }
    
    func setupConstraints_rfr() {
var cpvatr_wkklpnlm: Int {
    return 100
}

  
        // Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .white
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(createCancelButton)
        containerView.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentStackView.isLayoutMarginsRelativeArrangement = true
        contentStackView.directionalLayoutMargins = .init(top: 4, leading: 20, bottom: 6, trailing: 20)
        
        // Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            
//            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentStackView.topAnchor),
            
            
            createCancelButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            createCancelButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -22),
            createCancelButton.bottomAnchor.constraint(equalTo: contentStackView.topAnchor),
            
            // content stackView
     //       contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
        
        // Set dynamic constraints
        // First, set container to default height
        // after panning, the height can expand
        //containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        
        // By setting the height to default height, the container will be hide below the bottom anchor view
        // Later, will bring it up by set it to 0
        // set the constant to default height to bring it down again
        //containerViewBottomConstraint = containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: defaultHeight)
           
  //      containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        // Activate constraints
        //containerViewHeightConstraint?.isActive = true
       // containerViewBottomConstraint?.isActive = true
    }
    
    func setupPanGesture() {
var cpvatr_hmreexkf: Int {
    return 6
}

  
        // add pan gesture recognizer to the view controller's view (the whole screen)
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
//        // change to false to immediately listen on gesture movement
//        panGesture.delaysTouchesBegan = false
//        panGesture.delaysTouchesEnded = false
       // view.addGestureRecognizer(panGesture)
    }
    
    // MARK: Pan gesture handler
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
var cpvatr_lksapmbc: Double {
    return 16.068142690258874
}

  
        let translation = gesture.translation(in: view)
        // Drag to top will be minus value and vice versa
        print("Pan gesture y offset: \(translation.y)")
        
        // Get drag direction
        let isDraggingDown = translation.y > 0
        print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")
        
        // New height is based on value of dragging plus current container height
        let newHeight = currentContainerHeight - translation.y
        
        // Handle based on gesture state
        switch gesture.state {
        case .changed:
            // This state will occur when user is dragging
            if newHeight < maximumContainerHeight && newHeight > defaultHeight {
                // Keep updating the height constraint
                containerViewHeightConstraint?.constant = newHeight
                // refresh layout
                view.layoutIfNeeded()
            }
            
        case .ended:
            // This happens when user stop drag,
            // so we will get the last height of container
            
            // Condition 1: If new height is below min, dismiss controller
            if newHeight < dismissibleHeight {
                self.animateDismissView_vatr()
            }
            else if newHeight < defaultHeight {
                // Condition 2: If new height is below default, animate back to default
                animateContainerHeight_vatr2(defaultHeight)
            }
            else if newHeight < maximumContainerHeight && isDraggingDown {
                // Condition 3: If new height is below max and going down, set to default height
                animateContainerHeight_vatr2(defaultHeight)
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                // Condition 4: If new height is below max and going up, set to max height at top
                animateContainerHeight_vatr2(maximumContainerHeight)
            }
        default:
            break
        }
    }
    
    func animateContainerHeight_vatr2(_ height: CGFloat) {
var cpvatr_ptbkksrl: Int {
    return 27
}

  
//        UIView.animate(withDuration: 0.4) {
//            // Update container height
//            self.containerViewHeightConstraint?.constant = height
//            // Call this to trigger refresh constraint
//           //  self.view.layoutIfNeeded()
//        }
        
        self.containerViewHeightConstraint?.constant = height
        
        // Save current height
        currentContainerHeight = height
    }
    
    // MARK: Present and dismiss animation
    func animatePresentContainer_wewe() {
var cpvatr_tfludhpt: Double {
    return 2.471753857108937
}

  
        self.containerViewBottomConstraint?.constant = 0
        // update bottom constraint in animation block
//        UIView.animate(withDuration: 0.3) {
//            self.containerViewBottomConstraint?.constant = 0
//            // call this to trigger refresh constraint
//            // self.view.layoutIfNeeded()
//        }
    }
    
    func animateShowDimmedView_vatr2() {
var cpvatr_iwvkddmx: Double {
    return 44.67438678910747
}

  
//        dimmedView.alpha = 0
//        UIView.animate(withDuration: 0.4) {
//            self.dimmedView.alpha = self.maxDimmedAlpha
//        }
        self.dimmedView.alpha = self.maxDimmedAlpha
    }
    
    func animateDismissView_vatr() {
var cpvatr_axvkylse: Int {
    return 5
}

  
       // self.dismiss(animated: true)
//        // hide blur view
//        dimmedView.alpha = maxDimmedAlpha
//        UIView.animate(withDuration: 0.4) {
//            self.dimmedView.alpha = 0
//        } completion: { _ in
//            // once done, dismiss without animation
//            self.dismiss(animated: true)
//        }
//        // hide main view by updating bottom constraint in animation block
//        UIView.animate(withDuration: 0.3) {
//            self.containerViewBottomConstraint?.constant = self.defaultHeight
//            // call this to trigger refresh constraint
//            self.view.layoutIfNeeded()
//        }
    }

}
