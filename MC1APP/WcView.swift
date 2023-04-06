//
//  WcView.swift
//  MC1APP
//
//  Created by Billy Jefferson on 05/04/23.
//

import SwiftUI

struct WcView: View {
    @State private var isActive = false
    var char = bathroomtext
    var dataArray : String = ""
    @State var counter = 0
    var body: some View {
        if isActive{
            BlackIsekai(dataArray: dataArray)
        } else {
            ZStack{
                Image("Bathroomcry")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    ZStack{
                        VStack{
                            HStack{
                                Button(action:{
                                    countering()
                                },label:{
                                    Text("\(dataArray) : (\(char[counter]))")
                                        .foregroundColor(.black)
                                        .padding(.horizontal,40)
                                        .padding(.top,20)
                                        .frame(width: 400, height: 150)
                                        .background(.gray)
                                        .ignoresSafeArea()
                                })
                            }
                        }
                        
                    }
                }
            }
        }
    }
    func countering (){
        if counter >= 9{
            isActive = true
            counter = 0
            let _ = print(isActive)
        }
        else{
            counter += 1
            let _ = print(counter)
        }
    }
}
struct WcView_Previews: PreviewProvider {
    static var previews: some View {
        WcView()
    }
}
