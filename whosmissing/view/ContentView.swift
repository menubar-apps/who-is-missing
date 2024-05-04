//
//  ContentView.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-04-29.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ExpeditionView(expedition: viewModel.expedition)
        ScrollView {
            ForEach(viewModel.spacecrafts.sorted(by: { $0.key < $1.key }), id: \.key) { spacecraft, astronauts in
                LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                    Section{
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(astronauts, id: \.id) { astronaut in
                                AstronautView(astonaut: astronaut)
                            }
                        }
                    }
                header: {
                    HStack{
                        Image("bx-rocket")
                            .padding(.leading, 8)
                        Text(spacecraft)
                            .padding(.vertical, 8)
                        Spacer()
                    }
                    .background(.background)
                }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
        .frame(width: 400)
}
