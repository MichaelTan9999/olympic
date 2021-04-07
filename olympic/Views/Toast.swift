//
//  Toast.swift
//  olympic
//
//  Created by Michael Tan on 2021/4/6.
//

import SwiftUI

struct Toast: View {
    
    struct ToastDataModel {
        var title: String
        var image: String
        var iconColor: Color
    }
    let dataModel: ToastDataModel
    @Binding var show: Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: dataModel.image).foregroundColor(.yellow)
                Text(dataModel.title)
            }.font(.headline)
            .foregroundColor(.primary)
                .padding([.top,.bottom], 20)
                .padding([.leading,.trailing], 20)
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(Capsule())
        }
        .animation(.none)
        .frame(width: UIScreen.main.bounds.width / 1.25)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.show = false
                
            }
        })
    }
}

struct OverlayDemo: View {
    @State private var showToastOverlay = false
    var body: some View {
        VStack {
            Text("Show Toast!")
                .onTapGesture {
                    withAnimation {
                        showToastOverlay = true
                    }
                }
        }
        .overlay(overlayView: Toast.init(dataModel: Toast.ToastDataModel.init(title: "toast message", image: "checkmark", iconColor: Color.yellow), show: $showToastOverlay)
        , show: $showToastOverlay)
        
    }
}

struct Overlay<T: View>: ViewModifier {
    
    @Binding var show: Bool
    let overlayView: T
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                overlayView
            }
        }
    }
}

extension View {
    func overlay<T: View>( overlayView: T, show: Binding<Bool>) -> some View {
        self.modifier(Overlay.init(show: show, overlayView: overlayView))
    }
}

struct OverlayDemo_Previews: PreviewProvider {
    static var previews: some View {
        OverlayDemo()
    }
}
