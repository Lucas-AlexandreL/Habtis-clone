//
//  SplashUIState.swift
//  Habtis
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/02/22.
//

import Foundation


//MARK: Enum

//Validar o estado atual da tela
enum SplashUIState{
    case loading
    case goToSignInScreen
    case goToHomeScreen
    case error(String)
}
