//
//  AutenticationViewModel.swift
//  FirebaseBasic
//
//  Created by Jungman Bae on 4/29/24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

@Observable
final class AutenticationViewModel {
    enum State {
        case busy
        case signedIn
        case segnedOut
    }
    
    var state: State = .busy
    private var authResult: AuthDataResult? = nil
    var username: String { authResult?.user.displayName ?? "" }
    var email: String { authResult?.user.email ?? "" }
    var photoURL: URL? { authResult?.user.photoURL }
    
    func logout() {
        
    }
    
    func restorePreviousSignIn() {
        
    }
    
    func login() {
        
    }
    
    private func signIn(user: GIDGoogleUser?) async {
        
    }
    
}
