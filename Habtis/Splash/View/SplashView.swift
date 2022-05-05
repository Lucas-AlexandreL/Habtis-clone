//
//  SplashView.swift
//  Habtis
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/02/22.
//

import SwiftUI

struct SplashView: View{
    //Armazenar o estado atual da tela
    @ObservedObject var viewModel: SplashViewModel
    
    
    var body: some View{
        Group{
            //Switch de navegacao de telas
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignInScreen:
                viewModel.signInView()
            case .goToHomeScreen:
                Text("Main")
            case .error(let msg):
                loadingView(error: msg)
            }
        }.onAppear(perform: viewModel.onAppear)
    }
}

//MARK: Alternativas de criar uma view

//MARK: Struct
//Compartilhar Ojetos
//Usada quando for preciso chamar em outro lugar no codigo
struct LoadingView: View{
    var body: some View{
        ZStack{
            Image("logo")
                .resizable()//Estica baseado no tamanho da tela
                .scaledToFit()// Manter a proporcao
                .frame( maxWidth: .infinity, maxHeight: .infinity)// tamanho do frame
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
}

//MARK: Extension

//Criar variavel em extensao
//Fica visivel apenas em uma classe
extension SplashView{
    var loading: some View{
        ZStack{
            Image("logo")
                .resizable()//Estica baseado no tamanho da tela
                .scaledToFit()// Manter a proporcao
                .frame( maxWidth: .infinity, maxHeight: .infinity)// tamanho do frame
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
}

//Criar uma funcao
extension SplashView{
    func loadingView(error: String? = nil) -> some View{
        ZStack{
            Image("logo")
                .resizable()//Estica baseado no tamanho da tela
                .scaledToFit()// Manter a proporcao
                .frame( maxWidth: .infinity, maxHeight: .infinity)// tamanho do frame
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)){
                        Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("Ok")){
                            //Fazer algo qnd fechar alerta
                        })
                    }
            }
        }
    }
}

struct SplashViewPreviews: PreviewProvider {
    static var previews: some View {
       // SplashView(state: .loading)
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
