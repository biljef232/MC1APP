//
//  Class3View.swift
//  MC1APP
//
//  Created by Billy Jefferson on 03/04/23.
//

import SwiftUI

struct Class3View: View {
    @State private var isActive = false
    var char = dialogue2
    var dataArray : String = ""
    @State var counter = 0
    var body: some View {
        if isActive{
            LunchbreakView(dataArray: dataArray)
        } else {
            ZStack{
                Image("Brahm")
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
                                    Text("Brahm: \(char[counter])")
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
        if counter >= 2{
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

struct Class3View_Previews: PreviewProvider {
    static var previews: some View {
        Class3View()
    }
}
