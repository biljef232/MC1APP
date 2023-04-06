//
//  JohnChoiceView.swift
//  MC1APP
//
//  Created by Billy Jefferson on 05/04/23.
//

import SwiftUI

struct JohnChoiceView: View {
    @State private var isActive = false
    var char = johndialogue
    var dataArray : String = ""
    @State var counter = 0
    var body: some View {
        if isActive{
            BlackSmooth(dataArray: dataArray)
        } else {
            ZStack{
                Image("John")
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
//                                    Text("\(dataArray)")
                                    Text("John: \(char[counter])")
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
        if counter >= 0{
            isActive = true
            let _ = print(isActive)
        }
        else{
            counter += 1
            let _ = print(counter)
        }
    }
}

struct JohnChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        JohnChoiceView()
    }
}
