//
//  ContentView.swift
//  AlertDrawer
//
//  Created by Balaji Venkatesh on 30/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var config: DrawerConfig = .init()
    @State private var moveToCenter: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Toggle("Move to Center", isOn: $moveToCenter)
                    .padding(15)
                    .background(.bar, in: .rect(cornerRadius: 10))
                
                if !moveToCenter {
                    Spacer()
                }
                
                DrawerButton(title: "Continue", config: $config)
            }
            .padding(15)
            .navigationTitle("Alert Drawer")
            .animation(.snappy(duration: 0.25, extraBounce: 0), value: moveToCenter)
        }
        /// Place this on top of the root view
        .alertDrawer(config: $config, primaryTitle: "Continue", secondaryTitle: "Cancel") {
            return false
        } onSecondaryClick: {
            return true
        } content: {
            /// Dummy Content
            VStack(alignment: .leading, spacing: 15) {
                Image(systemName: "exclamationmark.circle")
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Are you sure?")
                    .font(.title2.bold())
                
                Text("You haven't backed up your wallet yet.\nIf you remove it, you could lose access forever. We suggest tapping Cancel and backing up your wallet first with a valid recovery method.")
                    .foregroundStyle(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 300)
            }
        }
    }
}

#Preview {
    ContentView()
}
