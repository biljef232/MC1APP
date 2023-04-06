//
//  LunchbreakView.swift
//  MC1APP
//
//  Created by Billy Jefferson on 05/04/23.
//

import SwiftUI

struct LunchbreakView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var dataArray : String = ""
    
    var body: some View {
        if isActive{
            RooftopView(dataArray: dataArray)
        } else {
            VStack{
                Text("Lunch Break").font(.custom("Party LET", size: 40))
                    .frame(maxWidth:.infinity,maxHeight:.infinity)
                    .foregroundColor(.white)
                    .background(.black)
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

struct LunchbreakView_Previews: PreviewProvider {
    static var previews: some View {
        LunchbreakView()
    }
}
