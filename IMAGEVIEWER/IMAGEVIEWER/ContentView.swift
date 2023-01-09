//
//  ContentView.swift
//  IMAGEVIEWER
//
//  Created by prem on 5/1/23.
//

import SwiftUI

extension Image {
    func imageModifer() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifer()
            .frame(maxWidth: 128)
            .foregroundColor(.blue)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private var imageViewURL: String =  "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        //mark1:- Basic
     //   AsyncImage(url: URL(string: imageViewURL), scale: 3.0)
        
    //Mark2:- using place holder
//        AsyncImage(url: URL(string: imageViewURL)) { image in
//            image.imageModifer()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//        }
//        .padding(40)
        
        //mark3:- async image is enum by default
//        AsyncImage(url: URL(string: imageViewURL)) { phase in
//            if let image = phase.image {
//                image.imageModifer()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(40)
        
        //mark :- 4 . Animation
        AsyncImage(url: URL(string: imageViewURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){ phase in
            switch phase {
            case.success(let image):
                image.imageModifer()
                    .transition(.move(edge: .bottom))
            case.failure(_):
                Image(systemName: "ant.circle").iconModifier()
            case.empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
