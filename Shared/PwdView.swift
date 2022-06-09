//
//  PwdView.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 9/6/2022.
//

import SwiftUI

struct PwdView: View {
    var index: Int
    @Binding var password : String
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 30, height: 30)
            
            // checking whether it is typed..
            if password.count > index {
                Circle()
                    .fill(Color.black)
                    .frame(width: 30, height: 30)
            }
        }
    }
}
