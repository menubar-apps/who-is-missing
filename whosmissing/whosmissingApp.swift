//
//  whosmissingApp.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-04-29.
//

import SwiftUI

@main
struct whosmissingApp: App {
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some Scene {
        MenuBarExtra("Utility App", image: "bx-rocket") {
            ContentView(viewModel: ViewModel())
                .frame(width: 400, height: 600)
        }
        .menuBarExtraStyle(.window)
        
        Window("About", id: "about-window") {
            AboutView()
                .frame(width: 250, height: 300)
        }
        .windowResizability(.contentSize)
    }
}
