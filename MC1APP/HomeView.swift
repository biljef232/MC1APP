//
//  Homeview.swift
//  MC1APP
//
//  Created by Billy Jefferson on 03/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination:ContentView())
            {
                VStack{
                    ZStack{
                        Image("Homescreen")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        VStack{
                            Spacer()
                            Text("Touch to play")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
