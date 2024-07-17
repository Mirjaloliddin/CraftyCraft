

import UIKit

extension uiCollectionViewLayout_vatr {
    
    static func makeColumnsLayout() -> UICollectionViewCompositionalLayout {

let isPad = UIDevice.current.userInterfaceIdiom == .pad
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(163)), subitem: item, count: isPad ? 3 : 2)
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    static func makeRoundedLayout() -> UICollectionViewCompositionalLayout {
var cpvatr_klhriabp: Double {
    return 52.970382988026316
}
let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(40), heightDimension: .absolute(40)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(40), heightDimension: .absolute(40)), subitem: item, count: 1)
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        
        return .init(section: section, configuration: configuration)
    }
}
