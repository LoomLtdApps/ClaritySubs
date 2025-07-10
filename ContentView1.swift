//
//  ContentView1.swift
//  Skeleton
//
//  Created by Balaji Venkatesh on 13/04/25.
//

import SwiftUI

struct ContentView1: View {
    @State private var card: Card?
    var body: some View {
        VStack {
            CardView(card: card ?? .mock)
                .skeleton(isRedacted: card == nil)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("This uses default redacted modifier.")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Text(".skeleton(isRedacted: true)")
                    .monospaced()
                    .padding(15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background, in: .rect(cornerRadius: 10))
            }
            .padding(.top, 15)
            
            Spacer(minLength: 0)
        }
        .onTapGesture {
            withAnimation(.smooth) {
                card = card == nil ? .mock : nil
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
    }
}

/// Card View
struct CardView: View {
    var card: Card
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Rectangle()
                .foregroundStyle(.clear)
                .overlay {
                    Image(card.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(height: 220)
                .clipped()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(card.title)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                Text(card.subTitle)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .padding(.trailing, 30)
                
                Text(card.description)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .lineLimit(3)
            }
            .padding([.horizontal, .top], 15)
            .padding(.bottom, 25)
        }
        .background(.background)
        .clipShape(.rect(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 10)
    }
}

#Preview {
    ContentView1()
}
