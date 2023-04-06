//
//  BlackSmooth.swift
//  MC1APP
//
//  Created by Billy Jefferson on 03/04/23.
//

import SwiftUI

struct BlackSmooth: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var dataArray : String = ""
    var body: some View {
        if isActive{
            BathroomView(dataArray: dataArray)
        } else {
            VStack{
                Text("YourName Got Beaten and run to Bathroom").font(.custom("Party LET", size: 30))
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

struct BlackSmooth_Previews: PreviewProvider {
    static var previews: some View {
        BlackSmooth()
    }
}
