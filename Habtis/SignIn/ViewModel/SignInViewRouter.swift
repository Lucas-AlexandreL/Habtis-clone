//
//  File.swift
//  Habtis
//
//  Created by Lucas Alexandre Amorim Leoncio on 22/02/22.
//

import Foundation
import SwiftUI

enum SignInViewRouter{
    static func makeHomeView() -> some View{
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
