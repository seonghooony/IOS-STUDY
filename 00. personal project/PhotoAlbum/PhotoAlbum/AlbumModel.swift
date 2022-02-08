//
//  AlbumModel.swift
//  PhotoAlbum
//
//  Created by SeongHoon Kim on 2022/02/08.
//

import Foundation
import Photos
import UIKit

class AlbumModel {
    let title: String
    let count: Int
    let collection: PHCollection
    
    init(title: String, count: Int, collection: PHCollection) {
        self.title = title
        self.count = count
        self.collection = collection
        
    }
}
