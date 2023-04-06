//
//  Class4View.swift
//  MC1APP
//
//  Created by Billy Jefferson on 03/04/23.
//

import SwiftUI

struct Class4View: View {
    @State private var isActive1 = false
    @State private var isActive2 = false
    @State var farid = true
    var char = dialogue3
    var dataArray : String = ""
    @State var counter = 0
    var body: some View {
        if isActive1{
            JohnChoiceView(dataArray: dataArray)
        }
        if isActive2{
            JohnChoice2View(dataArray: dataArray)
        }else {
            ZStack{
                Image("Adolf")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action:{
                            isActive1 = true
                            let newView = JohnChoiceView()
                            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                        },label:{
                            Text("Grab John's Hand").foregroundColor(.yellow)
                        })
                        .frame(width:200,height:75)
                        .background(.black)
                        .disabled(farid)
                        .opacity(farid ? 0 : 1)
                        Spacer()
                        Button{
                            isActive2 = true
                            let newView = JohnChoice2View()
                            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                        }label:{
                            Text("Refuse To Grab John's Hand").foregroundColor(.yellow)
                        }
                        .frame(width:200,height:75)
                        .background(.black)
                        .disabled(farid)
                        .opacity(farid ? 0 : 1)
                        Spacer()
                    }
                    ZStack{
                        VStack{
                            HStack{
                                Button(action:{
                                    countering()
                                },label:{
//                                    Text("\(dataArray)")
                                    Text("Adolf: \(char[counter])")
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
            farid = false
        }
        else{
            counter += 1
            let _ = print(counter)
        }
    }
}

struct Class4View_Previews: PreviewProvider {
    static var previews: some View {
        Class4View()
    }
}
