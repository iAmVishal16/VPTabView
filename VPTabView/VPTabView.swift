//
//  VPTabView.swift
//  VPTabView
//
//  Created by Vishal Paliwal on 30/07/21.
//

import SwiftUI

public struct VPTabView<Content> : View where Content : View {
    
    enum FABStyle {
        case end
        case center
        case none
    }
    
    enum TabBackground {
        case color
        case glossy
    }
    
    private var fabStyle: FABStyle = .end
    var backgroundType: TabBackground = .glossy
    
    private let views: [AnyView]
    private var icons: [String]
    @GestureState private var translation: CGFloat = 0
    @State var index: Int = 0
    
    
    public init<T>(icons: [String], @ViewBuilder content: @escaping () -> TupleView<T>) {
        self.icons = icons
        self.views = content().children
    }
    
    public var body: some View {
        
        let background = backgroundType == .color ? Color.white.shadow(radius: 1) as? Blur : Blur(style: .systemChromeMaterialDark)
        
        
        GeometryReader { gReader in
            VStack {
                ZStack {
                    self.views[self.index]
                }
                .frame(width: gReader.size.width, height: gReader.size.height, alignment: .leading)
                .gesture(
                    DragGesture()
                        .updating(self.$translation) { gestureValue, gestureState, _ in
                            gestureState = gestureValue.translation.width
                        }
                        .onEnded { value in
                            let offset = value.translation.width / gReader.size.width
                            let newIndex = (CGFloat(self.index) - offset).rounded()
                            self.index = min(max(Int(newIndex), 0), self.icons.count - 1)
                        }
                )
                HStack {
                    
                    Spacer()
                    
                    ForEach(0..<self.icons.count) { index in
                        VPTabItem(index: self.$index, tag: index, imageName: self.icons[index])
                    }
                    
                    if fabStyle == .end {
                        Spacer()
                        
                        VPFloatingActionButton()
                    }
                    
                    Spacer()
                    
                }
                .frame(height: 56)
                .background(background)
                
                
            }
        }
    }
    
}

extension TupleView {
    var children: [AnyView] {
        makeArray(from: value)
    }
    
    private struct GenericView {
        let body: Any
        
        var view: AnyView? {
            AnyView(_fromValue: body)
        }
    }
    
    private func makeArray<Tuple>(from tuple: Tuple) -> [AnyView] {
        func convert(child: Mirror.Child) -> AnyView? {
            withUnsafeBytes(of: child.value) { ptr -> AnyView? in
                let binded = ptr.bindMemory(to: GenericView.self)
                return binded.first?.view
            }
        }
        
        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.compactMap(convert)
    }
}

extension String {
    var fill: String {
        return self.appending(".fill")
    }
}

struct VPTabItem: View {
    
    @Binding var index: Int
    var tag: Int
    
    var imageName:String
    
    var body: some View {
        
        let itemColor = self.index == tag ? Color.accentColor : .gray
        let itemImage = self.index == tag ? imageName.fill : imageName
        
        VStack {
            Image(systemName: itemImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
        .onTapGesture {
            self.index = tag
        }
        .padding(.horizontal, -8)
        .padding(.trailing, 42)
        .foregroundColor(itemColor)
    }
}

struct VPFloatingActionButton: View {
    
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.accentColor)
                .frame(width: 56, height: 56)
                .shadow(radius: 4)
            Image(systemName: "plus")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 18 , height: 18)
                .foregroundColor(Color.white)
        }
        .offset(y: -56/2)
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
