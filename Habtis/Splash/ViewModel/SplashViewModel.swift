//
//  SplashViewModel.swift
//  Habtis
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/02/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState:SplashUIState = .loading

    func onAppear() {
        // Faz algo assincrono  muda o estado da uiState
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            // Aqui e chamado depois de dois segundos
            self.uiState = .goToSignInScreen
        }
    }

}


extension SplashViewModel {
    func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
