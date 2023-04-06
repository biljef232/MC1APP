//
//  FirstEncounter.swift
//  MC1APP
//
//  Created by Billy Jefferson on 06/04/23.
//

import SwiftUI

struct FirstEncounter: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var timer: Timer?
    var runCount = 0
    var dataArray : String = ""
    var nar = encounter
    @State var time = 0
    
    var body: some View {
        if isActive{
            HomeView()
        } else {
            VStack{
                Text("\(nar[time])")
                    .padding(.horizontal,30)
                    .font(.custom("Futura", size: 25))
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
                increase()
                DispatchQueue.main.asyncAfter(deadline: .now() + 46){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
    func increase(){
        Timer.scheduledTimer(withTimeInterval: 5.5, repeats: true) { timer in
            time += 1
            if time == 7 {
                timer.invalidate()
            }
        }
    }
}

struct FirstEncounter_Previews: PreviewProvider {
    static var previews: some View {
        FirstEncounter()
    }
}
