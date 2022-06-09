//
//  PwdButton.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 9/6/2022.
//

import SwiftUI

struct PwdButton: View {
    var value : String
    @Binding var password : String
    @Binding var key : String
    @Binding var unlocked : Bool
    @Binding var wrongPass : Bool
    
    var body: some View {
        Button(action: setPassword, label: {
            VStack {
                Text(value)
                    .font(.title)
            }
            .padding()
        })
    }
    
    func setPassword() {
        // checking if backspace pressed...
        withAnimation {
            
            if password.count != 4 {
                password.append(value)
                
                // Delary Animation....
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    withAnimation {
                        if password.count == 4 {
                            if password == key {
                                unlocked = true
                            } else {
                                wrongPass = true
                                password.removeAll()
                            }
                        }
                    }
                }
            }
            
        }
    }
}
