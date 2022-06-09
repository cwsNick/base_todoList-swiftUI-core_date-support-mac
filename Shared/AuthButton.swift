//
//  AuthButton.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 9/6/2022.
//

import SwiftUI
import LocalAuthentication

struct AuthButton : View {
    @Binding var unlocked : Bool

    var body: some View {
        Button(action: authenticate, label: {
            Image(systemName: "touchid")
                .font(.system(size: 24))
        })
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    unlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}
