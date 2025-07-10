//
//  ContentView.swift
//  AppSchemeChanger
//
//  Created by Balaji Venkatesh on 22/08/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("AppScheme") private var appScheme: AppScheme = .device
    @SceneStorage("ShowScenePickerView") private var showPickerView: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(1...40, id: \.self) { index in
                    Text("Chat History \(index)")
                }
            }
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showPickerView.toggle()
                    } label: {
                        Image(systemName: appScheme.symbolImage)
                            .foregroundStyle(Color.primary)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: appScheme)
    }
}

#Preview {
    SchemeHostView {
        ContentView()
    }
}
