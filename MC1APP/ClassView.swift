//
//  ClassView.swift
//  MC1APP
//
//  Created by Billy Jefferson on 03/04/23.
//

import SwiftUI

struct ClassView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var dataArray : String = ""
    var body: some View {
        if isActive{
            MorningView(dataArray: dataArray)
        } else {
            ZStack{
                Image("Backclassroom")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    VStack{
                        Text("ClassRoom")
                    }
                    .padding(.horizontal,40)
                    .padding(.top,20)
                    .frame(width: 400, height: 150)
                    .background(.gray)
                }
                .padding(.top)
            }
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.2)){
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
    }
}
