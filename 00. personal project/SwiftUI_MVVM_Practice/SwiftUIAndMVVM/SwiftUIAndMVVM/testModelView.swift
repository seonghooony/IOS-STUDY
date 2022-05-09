//
//  testModelView.swift
//  SwiftUIAndMVVM
//
//  Created by SeongHoon Kim on 2022/05/09.
//

import Foundation

class testModelView: ObservableObject {
    @Published var count:Int = 0
    
    func plus() {
        self.count += 1
    }
}
