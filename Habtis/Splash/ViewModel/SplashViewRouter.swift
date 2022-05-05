//
//  SplashViewRouter.swift
//  Habtis
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/02/22.
//

import SwiftUI

enum SplashViewRouter{
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
