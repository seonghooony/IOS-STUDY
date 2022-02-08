//
//  DetailViewController.swift
//  PhotoAlbum
//
//  Created by SeongHoon Kim on 2022/02/08.
//

import UIKit
import Photos

class DetailViewController: UIViewController {
    
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    var fetchResult: PHFetchResult<PHAsset>?
    var headerTitle: String?
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = headerTitle
        self.detailCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.detailCollectionView.contentInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 16
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 2
        self.detailCollectionView.collectionViewLayout = layout
        
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self
    }
    
    
    
}

//셀의 개수, 셀의 내용 체우기
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailCell else { return UICollectionViewCell() }
        
        if let fetchResult = fetchResult {
            if fetchResult.count > 0 {
                let asset: PHAsset = fetchResult.object(at: indexPath.item)
                imageManager.requestImage(for: asset, targetSize: CGSize(width: 70, height: 70), contentMode: .aspectFill, options: nil) { (image, _) in
                    cell.detailImageView.image = image
                }
                
            }
        }
        
        
        

        return cell

    }

}

//셀의 크기 설정
//extension DetailViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width: CGFloat = collectionView.bounds.width
//
//        return CGSize(width: (collectionView.bounds.width-itemSpacing) / 3 , height: width)
//    }
//
//}


extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let asset = self.fetchResult?.object(at: indexPath.row) {
            var byte = ""
            let resources = PHAssetResource.assetResources(for: asset)
            let filename = resources.first?.originalFilename
            
            var sizeOnDisk: Int64 = 0
            if let resource = resources.first {
                let unsignedInt64 = resource.value(forKey: "fileSize") as? CLong
                sizeOnDisk = Int64(bitPattern: UInt64(unsignedInt64!))
                byte = String(format: "%.2f", Double(sizeOnDisk) / (1024.0*1024.0)) + " MB"
            }
            
            let alert = UIAlertController(
                title: "사진정보",
                message: """
                파일명 : \(filename!)
                파일크기 : \(byte)
                """,
                preferredStyle: .alert
            )
            let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(confirm)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
}
