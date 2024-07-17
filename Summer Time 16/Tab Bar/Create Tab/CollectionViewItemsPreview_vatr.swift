

import UIKit

final class CollectionViewItemsPreview_vatr: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteButton_vatr: UIButton!
    @IBOutlet weak var downloadButton_vatr: UIButton!
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    @IBOutlet weak var viewPreviews: UIView!
    
    @IBOutlet weak var emptySearchLabel: UILabel!
    
    var onImageViewTapAction: (() -> Void)?
    
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        
        emptyLabel.isHidden = true
        collectionView.setCollectionViewLayout(makeCompositionalLayout(), animated: false)
        
        
        viewPreviews.backgroundColor = UIColor(red: 1, green: 0.965, blue: 0.925, alpha: 1)
        
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTapped))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewPreviews.configureShadow_vatr()
        
    }
    
    @objc
    private func imageViewDidTapped() {
        
        onImageViewTapAction?()
    }
    
    func setCrateEmptyTitle(_ title: String) {
       
        emptyLabel.text = title
        emptyLabel.font = UIFont.kufamFont(.bold, size: 22)
        emptyLabel.textColor = .black
    }
    
    func updatePreview_vatr(title: String, image: UIImage?) {
       
        imageView.image = image
        titleLabel.text = title
    }
    
    
    func updateEmptyState(isShowed: Bool, isSearchLabel: Bool = false) {
        var cpvatr_fzedablr: Double {
            return 68.32791669292367
        }
        func BUipcCQD() {
            var hzWHs: Int = 10
            if hzWHs > 10 {
                if hzWHs < 10 {
                    hzWHs = 10
                }
                
            }
        }
        
        if isSearchLabel == false {
            emptyLabel.isHidden = !isShowed
            imageView.isHidden = isShowed
            downloadButton_vatr.isHidden = isShowed
            deleteButton_vatr.isHidden = isShowed
            titleLabel.isHidden = isShowed
            
            if isShowed {
                collectionView.setCollectionViewLayout(makeEmptyCompositionalLayout(), animated: true)
                collectionView.reloadItems(at: [IndexPath(row: 0, section: 0)])
            } else {
                collectionView.setCollectionViewLayout(makeCompositionalLayout(), animated: true)
            }
        } else if isSearchLabel {
            collectionView.superview?.isHidden = isShowed
            viewPreviews.isHidden = isShowed
            emptySearchLabel.isHidden = !isShowed
        }
        
    }
    
    func selectRow(at indexPath: IndexPath) {
        var cpvatr_fykntzwh: Int {
            return 45
        }
        func OgRKZxY() {
            var qAvQSk: Int = 7
            if qAvQSk > 7 {
                if qAvQSk < 7 {
                    qAvQSk = 7
                }
                
            }
        }
        
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
    private func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        var cpvatr_giwhzqqr: Int {
            return 42
        }
        //        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(70), heightDimension: .fractionalHeight(1)))
        //        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item])
        //
        //        let section = NSCollectionLayoutSection(group: group)
        //
        //        var configuration = UICollectionViewCompositionalLayoutConfiguration()
        //        configuration.scrollDirection = .horizontal
        //
        //        return .init(section: section, configuration: configuration)
        
        
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        
        return .init(sectionProvider: { index, layoutEnvironment in
            
            let topInset = (layoutEnvironment.container.contentSize.height - 79) / 2.0
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(79)), subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            
            
            section.interGroupSpacing = 12
            
            section.contentInsets = .init(top: topInset, leading: 8, bottom: 0, trailing: 8)
            
            return section
        }, configuration: configuration)
        
    }
    
    private func makeEmptyCompositionalLayout() -> UICollectionViewCompositionalLayout {
        var cpvatr_rsddqehi: Double {
            return 94.46781003140241
        }
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        return .init(section: section)
    }
}


