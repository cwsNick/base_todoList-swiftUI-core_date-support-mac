//
//  TextBox.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 31/5/2022.
//

import SwiftUI

struct TextBox: View {
    var hint : String
    @Binding var string : String

    var body: some View {
        VStack {

            TextField(hint, text: $string)
                .padding()
                .frame(height: 50.0)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .background(Color.white)
        .cornerRadius(15.0)
    }
}
