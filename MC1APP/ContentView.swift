//
//  ContentView.swift
//  MC1APP
//
//  Created by Billy Jefferson on 03/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldText :String = ""
    @State var dataArray : String = ""
    @State private var showSecondView = false
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Insert your name",text: $textFieldText)
                    .padding()
                    .background(Color.black.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
                Button(action:{
                    if textIsAppropriate(){
                        dataArray = ""
                        saveText()
                        self.showSecondView.toggle()
                        let newView = NarrationView()
                        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                    }
                }, label:{
                    Text("Save".uppercased())
                        .padding()
                        .background(textIsAppropriate() ? Color.yellow : Color.gray).cornerRadius(10)
                        .foregroundColor(.black)
                        .font(.headline)
                })
                    .sheet(isPresented: $showSecondView){
                        NarrationView(dataArray: dataArray)
                    }
                    .navigationTitle("Input Your Name")
            }
        }
    }
    func textIsAppropriate()-> Bool{
        if textFieldText.count >= 1{
            return true
        }
        return false
    }
    func saveText(){
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

