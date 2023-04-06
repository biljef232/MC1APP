//
//  Choice1View.swift
//  MC1APP
//
//  Created by Billy Jefferson on 04/04/23.
//

import SwiftUI

struct Choice1View: View {
    @State private var isActive = false
    var dataArray : String = ""
    
    var body: some View {
        if isActive{
            Class2View(dataArray: dataArray)
        } else {
            ZStack{
                Image("John")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            
                        }label:{
                            Text("hola").foregroundColor(.yellow)
                        }
                        .frame(width:200,height:75)
                        .background(.black)
                        
                        Spacer()
                        Button{
                            
                        }label:{
                            Text("hola").foregroundColor(.yellow)
                        }
                        .frame(width:200,height:75)
                        .background(.black)
                        Spacer()
                    }
                    ZStack{
                        VStack{
                            Text("\(dataArray), im here to be come great")
                        }
                        .padding(.horizontal,40)
                        .padding(.top,20)
                        .frame(width: 400, height: 150)
                        .background(.gray)
                    }
                }
            }
        }
    }
}

struct Choice1View_Previews: PreviewProvider {
    static var previews: some View {
        Choice1View()
    }
}
