//
//  ContentView.swift
//  UITextDemo
//
//  A Demo for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub


import SwiftUI
import UIKit

struct ContentView: View {
    @State var comments:String = " "
    var body: some View {
        VStack{
            Text("Pizza Order Comments")
                .font(.largeTitle)
            HStack{
                Text("Your comments displayed")
                Spacer()
            }
                .font(.headline)
            Text(comments)
            HStack{
                Text("Comments in TextField")
                Spacer()
            }.font(.headline)
            TextField("Comments in TextField", text:$comments)
                .font(.title)
                .background(Color.white)
            HStack{
                Text("Type comments below")
                Spacer()
            }.font(.headline)
            TextView(text: $comments)
            Spacer()
        }
    .padding()
    .background(Color("M3"))
    .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextView:UIViewRepresentable{
    @Binding var text:String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context:Context)->UITextView{
        let textView = UITextView(frame:.zero)
        textView.font = UIFont.preferredFont(forTextStyle: .title1)
        textView.delegate = context.coordinator
        return textView
    }
    
    func updateUIView(_ view:UITextView, context:Context){
        view.text = text
    }
    
    class Coordinator:NSObject,UITextViewDelegate{
        var parent:TextView
        init(_ textView:TextView){
            parent = textView
        }
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
    
}
