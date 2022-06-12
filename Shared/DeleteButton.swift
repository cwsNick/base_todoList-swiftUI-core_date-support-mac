//
//  DeleteButton.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 9/6/2022.
//

import SwiftUI

struct DeleteButton : View {
    @Binding var password : String
    
    var body: some View {
        Button(action: deletePassword, label: {
            Image(systemName: "delete.left")
                .font(.system(size: 24))
        })
    }
    
    func deletePassword() {
        // checking if backspace pressed...
        withAnimation {
            if password.count != 0 {
                password.removeLast()
            }
        }
    }
}
