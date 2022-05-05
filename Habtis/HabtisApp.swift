//
//  HabtisApp.swift
//  Habtis
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/02/22.
//

import SwiftUI

@main
struct HabtisApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView (viewModel: SplashViewModel())
        }
    }
}
