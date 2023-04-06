//
//  BlackIsekai.swift
//  MC1APP
//
//  Created by Billy Jefferson on 05/04/23.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player : AVAudioPlayer?
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "SchoolBell", withExtension: ".mp3")
        else {
            return
        }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        catch let error {
            print("Error playing Sound!. \(error.localizedDescription)")
        }
    }
}

struct BlackIsekai: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State var farid = true
    @State var time = 0
    
    var timer: Timer?
    var runCount = 0
    var dataArray : String = ""
    var nar = blacktext
    
    var body: some View {
        if isActive{
            IsekaiView(dataArray: dataArray)
        } else {
            VStack{
                ZStack{
                    Text("\(nar[time])")
                        .padding(.horizontal,30)
                        .font(.custom("Futura", size: 25))
                        .frame(maxWidth:.infinity,maxHeight:.infinity)
                        .foregroundColor(.white)
                        .background(.black)
                    Button(action:{
                        increase()
                        self.isActive = true
                        let newView = IsekaiView()
                        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                    },label:{
                        Text("Please click me!")
                            .foregroundColor(.white)
                            .padding(.top,350)
                            .disabled(farid)
                            .opacity(farid ? 0 : 1)
                    })
                }
            }
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.2)){
                    self.size = 0.9
                    self.opacity = 1.0
                    SoundManager.instance.playSound()
                }
            }
            .onAppear{
                increase()
                DispatchQueue.main.asyncAfter(deadline: .now() + 24){
                    withAnimation{
                    }
                }
            }
        }
    }
    func increase(){
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            time += 1
            if time == 8 {
                timer.invalidate()
                farid = false
            }
        }
    }
}

struct BlackIsekai_Previews: PreviewProvider {
    static var previews: some View {
        BlackIsekai()
    }
}
