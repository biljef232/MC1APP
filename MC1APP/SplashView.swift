//
//  Splashview.swift
//  MC1APP
//
//  Created by Billy Jefferson on 03/04/23.
//

import SwiftUI

struct Splashview: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            HomeView()
        } else {
            VStack{
                Text("Eria")
                    .font(.custom("Snell Roundhand", size: 60))
                Image("World")
                Text("")
                Text("Welcome to Another World!")
                    .font(.title2)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.2)){
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct Splashview_Previews: PreviewProvider {
    static var previews: some View {
        Splashview()
    }
}
