import UIKit

extension AddonCreatorViewController_vatr : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

func cMdqkWrks() {
        var uRcTR: Int = 7
        if uRcTR > 7 {
            if uRcTR < 7 {
                uRcTR = 7
    }

  }
}
        
        if indexPath.item == 0 {
            flushSearch_vatr()
            
            let nextVC = AddonCategoryOptionsViewController_vatr()
            navigationController?.pushViewController(nextVC, animated: true)
            
        } else {
            guard let savedAddon = model.getSavedAddon_vatr(by: indexPath.item - 1) else { return }
            model.updateRecentForAddon_vatr(savedAddon: savedAddon)
            
            let fileManager = FileManager.default
            let file = savedAddon.file
            let fileUrl = fileManager.documentDirectory.appendingPathComponent(savedAddon.file)
            if file.isEmpty == false, fileManager.fileExists(atPath: fileUrl.path) {
                let _ = fileManager.secureSafeCopyItem_vatr(at: fileUrl, to: fileManager.cachesMCAddonDirectory.appendingPathComponent(fileUrl.lastPathComponent))
            }
            
            let nextVC = AddonEditorViewController_vatr(addonModel: savedAddon, mode: .modify)
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension AddonCreatorViewController_vatr : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        
        return model.filteringCreatedAddon.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SsvedAddonCollectionCell_vatr
        
        if  indexPath.item == 0 {
            cell.configCell_vatr(savedAddon: nil, with: .plusMode)
        } else {
            let savedAddonModel = model.getSavedAddon_vatr(by: indexPath.item - 1)
            
            cell.onDownloadButtonTapped = { [weak self] button in
                guard NetworkStatusMonitor_vatr.shared.isNetworkAvailable else {
                    self?.showNoInternetMess_vatr()
                    return
                }
                
                self?.downloadButton_vatr = button
                self?.handleDownloadButtonTap_vatr(savedAddon: savedAddonModel)
            }
            
            cell.onDeleteButtonTapped = { [weak self] in
                guard let correctIndex = self?.addonCollectionView.indexPath(for: cell) else {
                    AppDelegate.log("Error: checkUp indexPath!!!")
                    return
                }
                self?.handleDeleteButtonTap_vatr(indexPath: correctIndex)
            }
            
            cell.configCell_vatr(savedAddon: savedAddonModel, with: .savedAddonMOde)
        }
        
        return cell
    }
}

extension AddonCreatorViewController_vatr: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellWidth = collectionView.frame.size.width / (Device_vatr.iPad ? 4 : 2) - 8
        let cellHeight = cellWidth * 1.3
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}


//MARK: Cell Handlers

extension AddonCreatorViewController_vatr {
    
    private func handleDeleteButtonTap_vatr(indexPath: IndexPath) {
func lnFzsVQHUO() {
        var UehEZHiee: Int = 4
        if UehEZHiee > 4 {
            if UehEZHiee < 4 {
                UehEZHiee = 4
    }

  }
}
        
        let alert = UIAlertController(title: "Delete Addon", message: "Are you sure you want to delete this Addon?", preferredStyle: .alert)
        
        // Add "Delete" action
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            self?.performSkinDeletion_vatr(at: indexPath)
        }
        alert.addAction(deleteAction)
        
        // Add "Cancel" action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
    
    private func performSkinDeletion_vatr(at indexPath: IndexPath) {
        
        var cwpvrqqqqaertr_vfjhalzq: Int {
            return 136
        }
        
        
        // Animate the deletion
        if let selectedCell = self.addonCollectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.3, animations: {
                selectedCell.alpha = 0.0
                selectedCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }) { [weak self] _ in
                guard let self else { return }
                let deletedSkinIndex = indexPath.item - 1
                self.model.deleteAddon_vatr(at: deletedSkinIndex)
                self.model.updateCreatedAddons_vatr()
                
                
                if self.searchFieldMode, let searchText = self.seatchTextField.text, !searchText.isEmpty {
                    self.filterContentFor_vatr(searchText: searchText)
                }
                // Firstly update UI
                self.addonCollectionView.performBatchUpdates({ [weak self] in
                    self?.addonCollectionView.deleteItems(at: [indexPath])
                }, completion: nil)
            }
        }
    }
    
    private func handleDownloadButtonTap_vatr(savedAddon: SavedAddon_vatr?) {
var cpvatr_dwprrtxh: Double {
    return 38.316846970791346
}
func AccDfIk() {
        var FZNRbYM: Int = 1
        if FZNRbYM > 1 {
            if FZNRbYM < 1 {
                FZNRbYM = 1
    }

  }
}
        
        guard let savedAddon else {
            AppDelegate.log("savedAddon is nil")
            return
        }
        
        let url = FileManager.default.documentDirectory.appendingPathComponent(savedAddon.file)
        
        // Check if the file exists at the specified URL.
        if FileManager.default.fileExists(atPath: url.path) {
            share_vatr(url: url, from: downloadButton_vatr)
        } else {
            // Handle the case where the file does not exist.
            AppDelegate.log("File does not exist at the specified URL.")
        }
    }
}
