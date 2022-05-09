//
//  ContentView.swift
//  SwiftUIAndMVVM
//
//  Created by SeongHoon Kim on 2022/05/08.
//

import SwiftUI

struct ContentView: View {
    @StateObject var MV = testModelView()
    var body: some View {
        Text("count: \(MV.count)")
        List {
            subView(MV: MV)
            subView(MV: MV)
            subView(MV: MV)
        }
    }
}

struct subView: View {
    @ObservedObject var MV: testModelView
    var body: some View {
        Button(action: {
            MV.plus()
        }, label: {
            Text("플러스")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
