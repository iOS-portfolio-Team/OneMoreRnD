//
//  ContentView.swift
//  SwipeButton03
//
//  Created by Derrick on 2021/02/13.
//

import SwiftUI

let screen = UIScreen.main.bounds


struct ContentView: View {
    
    @State var translation = CGSize.zero.width
    @State var success = false
    
    var body: some View {
    HStack {
        ZStack(alignment: .leading){
            Color.gray.opacity(0.7)
                .frame(width:screen.width , height: 80)
                .cornerRadius(60)
            
            SwipeButton(translation: $translation, success: success)
                .animation(.spring())
                .gesture(DragGesture().onChanged({ value in
                    
                    if(value.translation.width < 0)
                    {
                        self.translation = CGSize.zero.width
                        self.success = false
                    }
                    else
                    {
                        
                        if(value.translation.width > 200)
                        {
                            self.translation = screen.width - 100
                            self.success = true
                        }
                        else
                        {
                            self.translation = value.translation.width
                        }
                    }
                })
                
                .onEnded({value in
                    if(value.translation.width < 200){
                        self.translation = CGSize.zero.width
                        self.success = false

                    }
                    else
                    {
                            self.translation = screen.width - 100
                            self.success = true
                    }
                }))
                
               
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SwipeButton: View {
    
    @Binding var translation : CGFloat
    @State var success: Bool
    
    var body: some View {
        ZStack {
            Color.orange.opacity(0.7)
                .frame(width:100 + translation , height: 80)
                .cornerRadius(60)
            
            CommonContent(textContent: "Finish", iconContent: "chevron.right.2" )
                .opacity(self.success ? 0 : 1)
            
            
            CommonContent(textContent: "Done", iconContent: "checkmark.seal.fill" )
                .opacity(self.success ? 1 : 0)
        }
        
    }
}

struct CommonContent: View {
    
    var textContent : String
    var iconContent : String
    
    
    
    var body: some View {
        HStack {
            Text(textContent)
                .foregroundColor(Color.white)
                .font(.headline)
            
            Image(systemName: iconContent)
        }
    }
}
