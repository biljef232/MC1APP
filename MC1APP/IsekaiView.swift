//
//  IsekaiView.swift
//  MC1APP
//
//  Created by Billy Jefferson on 05/04/23.
//

import SwiftUI
import AVKit
import AVFoundation
import UIKit

class SoundMaster {
    static let instance = SoundMaster()
    
    var player : AVAudioPlayer?
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "Birdchirp", withExtension: ".mp4")
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
struct IsekaiView: View {
    let avPlayer = AVPlayer(url:  Bundle.main.url(forResource: "Grassisekai", withExtension: "mov")!)
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State var time = 0
    
    var timer: Timer?
    var runCount = 0
    var dataArray : String = ""
    var body: some View {
        if isActive{
            FirstEncounter()
        } else {
            Button {
                avPlayer.play()
            } label: {
                VideoPlayer(player: avPlayer)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        avPlayer.play() // Autoplay the video when it appears
                        UIViewController.attemptRotationToDeviceOrientation()
                    }
            }
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)){
                    self.size = 1
                    self.opacity = 1.0
                    SoundMaster.instance.playSound()
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
            .onDisappear {
                avPlayer.isMuted = false
            }
            
        }
    }
}

struct IsekaiView_Previews: PreviewProvider {
    static var previews: some View {
        IsekaiView()
    }
}
