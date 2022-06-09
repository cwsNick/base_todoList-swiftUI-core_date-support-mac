//
//  LockScreenView.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 9/6/2022.
//

import SwiftUI


struct LockScreenView : View {
    
    @State var password = ""
    // For reset password
    @AppStorage("lock_Password") var key = "5654"
    @Binding var unLocked : Bool
    @State var wrongPassword = false
    let height = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer(minLength: 0)
                
                Menu(content: {
                    
                    Label(
                        title: { Text("Help")},
                        icon: { Image(systemName: "info.circle.fill") }
                    )
                    .onTapGesture(perform: {
                        
                    })
                    
                    Label(
                        title: { Text("Reset Password")},
                        icon: { Image(systemName: "key.fill") }
                    )
                    .onTapGesture(perform: {
                        
                    })
                    
                }) {
                    Image(systemName: "list.triangle")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 19, height: 19)
                        .padding()
                }
            }
            .padding(.leading)
            
            Text("To-do List")
                .font(.title2)
            
            Image(systemName: "list.bullet.rectangle.portrait")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 20)
            
            Text("Enter password to Unlock")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.top, 20)
            
            HStack(spacing: 22){
                // Password Circle View
                ForEach(0..<4, id: \.self) { index in
                    PwdView(index: index, password: $password)
                }
            }
            // for smaller size iphones...
            .padding(.top, height < 750 ? 20 : 30)
                        
            Spacer(minLength: 0)
            
            Text(wrongPassword ? "Incorrect Pin" : "")
                .foregroundColor(.red)
                .fontWeight(.heavy)

            Spacer(minLength: 0)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: height < 750 ? 5 : 15) {
                // Password Button
                ForEach(1...9, id: \.self) { value in
                    PwdButton(value: "\(value)", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                }
                
                DeleteButton(password: $password)
                PwdButton(value: "0", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                AuthButton(unlocked: $unLocked)
            }
            .padding(.bottom)
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}
