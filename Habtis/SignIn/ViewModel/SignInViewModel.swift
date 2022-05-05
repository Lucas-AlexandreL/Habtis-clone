//
//  SignInViewModel.swift
//  Habtis
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/02/22.
//

import SwiftUI

class SignInViewModel: ObservableObject{
    
    @Published var uiState:SignInUIState = .none
    
    func login(email:String, password:String){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.uiState = .goTohomeScreen
        }
    }
    
}

extension SignInViewModel{
    func homeView() -> some View{
        return SignInViewRouter.makeHomeView()
    }
}
