//
//  TextButton.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 31/5/2022.
//

import SwiftUI

struct TextButton: View {
    
    var sysImage : String
    
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: sysImage)
                Spacer()
                
                Text(title)
                #if os(iOS)
                    .offset(x: -10)
                #endif
                
                Spacer()
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(15.0)
            #if os(iOS)
            .frame(height: 35)
            #endif
            #if os(OSX)
            .frame(width: 90)
            #endif
            .shadow(radius: 3)
        }
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(sysImage: "plus.circle.fill", title: "Add")
    }
}
