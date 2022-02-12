//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by SeongHoon Kim on 2022/02/08.
//

import UIKit
import Photos
 
class ViewController: UIViewController {

    private var userCollections = PHFetchResult<PHAssetCollection>()
    //private var myAlbums = PHFetchResult<PHAssetCollection>()
    
    private var refreshControl = UIRefreshControl()
    
    let imageManager: PHCachingImageManager = PHCachingImageManager()

    @IBOutlet weak var albumCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.albumCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        //self.albumCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.albumCollectionView.delegate = self
        self.albumCollectionView.dataSource = self
        
        self.checkAuthAndLoadData()
        
        albumCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
     
    @objc func refresh() {
        self.albumCollectionView.reloadData()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if(refreshControl.isRefreshing) {
            self.refreshControl.endRefreshing()
            self.checkAuthAndLoadData()
        }
    }
    
    func getPhotosFromIphone() {
        let fetchAlbumOptions = PHFetchOptions()
        fetchAlbumOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        //myAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
        userCollections = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)

    }

    //사진첩 접근 권한 허가
    func checkAuthAndLoadData() {
        let photoLibraryAuthrizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoLibraryAuthrizationStatus {
        case .notDetermined:
            print("아직 허가 결정 내리지 않음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .denied:
                    print("접근이 제한됨")
                case .authorized:
                    self.getPhotosFromIphone()
                    OperationQueue.main.addOperation {
                        self.albumCollectionView.reloadData()
                    }
                default:
                    break
                }
            })
        case .denied:
            print("접근이 제한됨")
        case .authorized:
            self.getPhotosFromIphone()
            OperationQueue.main.addOperation {
                self.albumCollectionView.reloadData()
            }
        default:
            print("알수없는 예외사항")
        }
    }


}

//셀의 개수, 셀의 내용 체우기
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userCollections.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as? AlbumCell else { return UICollectionViewCell() }
        
        let collection = userCollections[indexPath.item]
        let fetchedAssets = PHAsset.fetchAssets(in: collection, options: nil)
        
        cell.albumTitle.text = collection.localizedTitle
        cell.albumCount.text = String(fetchedAssets.count) + " 개"

        if fetchedAssets.count > 0 {
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            let fetchResult = PHAsset.fetchAssets(in: collection, options: fetchOptions)
            let asset: PHAsset = fetchResult.object(at: 0)
            
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 70, height: 70), contentMode: .aspectFill, options: nil) { (image, _) in
                cell.albumImage.image = image
            }
        } else {
            let noImage = UIImage(systemName: "photo.on.rectangle")
            //let noImageGray = noImage.withTintColor(.gray)
            cell.albumImage.image = noImage
            cell.albumImage.tintColor = UIColor.gray
        }
        
        

        return cell

    }

}

//셀의 크기 설정
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.albumCollectionView.frame.width , height: 85)
    }

}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let DetailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        
        let collection = userCollections[indexPath.item]
        DetailVC.headerTitle = collection.localizedTitle
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult = PHAsset.fetchAssets(in: collection, options: fetchOptions)
        
        DetailVC.fetchResult = fetchResult
        
        self.navigationController?.pushViewController(DetailVC, animated: true)
    }
}
