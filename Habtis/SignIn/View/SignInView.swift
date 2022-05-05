//
//  SignInView.swift
//  Habtis
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/02/22.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    
    @State var navigationHidden = true
    
    @State var action: Int? = 0
    
    
    var body: some View{
        
        ZStack{
            if case SignInUIState.goTohomeScreen = viewModel.uiState {
                viewModel.homeView()
                } else{
                    
                NavigationView{
                    
                    ScrollView( showsIndicators: false){
                        
                        VStack(alignment: .center, spacing: 20){
                            
                            Spacer(minLength: 36)
                            
                            VStack(alignment: .center, spacing: 8){
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 40)
                                Text("Login")
                                    .foregroundColor(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)
                                numberField
                                passwordField
                                enterButton
                                registerLink
                                
                                Text("Copyright @Lucas")
                                    .foregroundColor(Color.gray)
                                    .font(Font.system(size: 16).bold())
                                    .padding(.top,16)
                            }
                        }
                        
                        if case SignInUIState.error(let value) = viewModel.uiState{
                            Text("")
                                .alert(isPresented: .constant(true)){
                                    Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")){
                                        //Fazer algo qnd fechar alerta
                                    })
                                }
                        }
                        
                    }.frame(maxWidth: .infinity,maxHeight: .infinity)
                        .padding(.horizontal,32)
                        .background(Color.white)
                        .navigationBarTitle("Login",displayMode: .inline)
                        .navigationBarHidden(navigationHidden)
                }
                .onAppear{
                    self.navigationHidden = true
                }
                .onDisappear{
                    self.navigationHidden = false
                }
            }
        }
    }
}

extension SignInView{
    var numberField: some View {
        TextField("", text: $email)
            .border(Color.black)
    }
    var passwordField: some View {
        SecureField("", text: $password)
            .border(Color.black)
    }
}

extension SignInView {
    var enterButton: some View{
        Button("Entrar"){
            viewModel.login(email: email, password: password)
        }
    }
}

extension SignInView{
    var registerLink: some View{
        VStack{
            Text("Ainda nao possui um login?")
                .foregroundColor(.gray)
                .padding(.top, 48)
            ZStack{
                NavigationLink(
                    destination: Text("Tela de Cadastro"),
                    tag: 1,
                    selection: $action,
                    label: {EmptyView()}
                )
                Button("Realize seu cadastro"){
                    self.action = 1
                }
            }
        }
    }
}

struct SignInViewPreviews: PreviewProvider {
    static var previews: some View {
       // SplashView(state: .loading)
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}

