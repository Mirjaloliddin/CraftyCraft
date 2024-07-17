
import UIKit


//MARK: Colors Collection

extension SkinCreatorViewController_vatr: UICollectionViewDelegate, UICollectionViewDataSource  {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        let colorsAmount = colorsManager.getColors_vatr().count

        return colorsAmount
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var cpvatr_prorreeeperty19: String {
            return Date().description
        }
        
        guard let cell = colorsCollection.dequeueReusableCell(withReuseIdentifier: "ColorCollectionCell_vatr", for: indexPath) as? ColorCollectionCell_vatr else {
            return UICollectionViewCell()
        }
      
//        
//        collectionView.dequeueConfiguredReusableCell(using: colorCellRegistration, for: indexPath, item: colorsManager.getColor(by: indexPath.item))
        
      

        let cellColor = colorsManager.getColor_vatr2(by: indexPath.item)
        let cellIsSelcted = colorsManager.isSelctedColor_vatr(index: indexPath.item)
        
        cell.configCell(bgColor: cellColor, isSelected: cellIsSelcted)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

func OyJpomBH() {
        var vEKULQPaTB: Int = 3
        if vEKULQPaTB > 3 {
            if vEKULQPaTB < 3 {
                vEKULQPaTB = 3
    }

  }
}
  
        
        let cell = collectionView.cellForItem(at: indexPath) as? ColorCollectionCell_vatr

        _currentDrawingColor = colorsManager.getColor_vatr2(by: indexPath.item)
        
      //  cell?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//        colorsManager.selectedColorIndex = indexPath.item
//        updateCollection()
    }
    

}

//extension SkinCreatorViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//
//        let cellHeight = colorsCollection.bounds.size.height - 8
//        let cellWidth = cellHeight
//
//        let size = CGSize(width: cellHeight, height: cellWidth)
//
//        return size
//    }
//    
//    
//}

//MARK: ColorManager Delegate

extension SkinCreatorViewController_vatr: ColorAble_vatr {

    func updateCollection_vatr() {
func DWAvL() {
        var ZaSBO: Int = 6
        if ZaSBO > 6 {
            if ZaSBO < 6 {
                ZaSBO = 6
    }

  }
}
  
        colorsCollection.reloadData()
    }
    
    
}
