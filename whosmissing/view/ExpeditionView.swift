//
//  ExpeditionView.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-05-04.
//

import SwiftUI

struct ExpeditionView: View {
    @Environment(\.openWindow) var openWindow
    
    var expedition: Expedition?
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                if let ex = expedition {
                    HStack {
                        AsyncImage(url: ex.expeditionPatch) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                        } placeholder: {
                            Color.gray
                                .clipShape(Circle())
                        }
                        .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text("Expedition #\(ex.issExpedition ?? -1)")
                                .font(.headline)
                            if let startDate =  ex.expeditionStartDate {
                                Text("Launched \(startDate.formattedDateString())")
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        Spacer()
                        Menu {
                            Button(action: {
                                NSApplication.shared.activate(ignoringOtherApps: true)
                                openWindow(id: "about-window")
                            } ) {
                                Image(systemName: "info")
                                Text("About")
                            }

                            Button(action: {
                                NSApplication.shared.terminate(nil)
                            }) {
                                Image(systemName: "power")
                                Text("Quit")

                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.secondary)
                        }
                        .menuStyle(.borderlessButton)
                        .frame(width: 20, height: 16)
                        .padding(8)
                        .padding(.trailing, 2)
                        .focusable(false)
                        .menuIndicator(.hidden)
                        .contentShape(Rectangle())
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    
                    if let startDate = ex.expeditionStartDate, let endDate = ex.expeditionEndDate {
                        let currentDate = Date().timeIntervalSince1970
                        let totalDuration = endDate - startDate
                        let elapsedDuration = currentDate - startDate
                        
                        let progress = CGFloat(elapsedDuration / totalDuration)
                        ProgressView(value: progress)
                            .frame(height: 20)
                            .padding(.horizontal)
                    } else {
                        Text("Expedition dates not available")
                            .padding()
                    }
                    
                    Divider()
                        .padding(0)
                }
                
            }
        }
    }
}

#Preview {
    ExpeditionView(expedition: Expedition(
        number: 1,
        issExpedition: 65,
        expeditionPatch: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b4/ISS_Expedition_71_Patch.png")!,
        expeditionURL: "https://example.com/expedition1",
        expeditionImage: URL(string: "https://example.com/expedition1.jpg")!,
        expeditionStartDate: 1630012800,
        expeditionEndDate: 1632619200,
        people: []))
    .frame(width: 400)
}

