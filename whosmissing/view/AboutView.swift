//
//  AboutView.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-05-06.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.openURL) var openURL
    
    let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    
    var body: some View {
        VStack {
            Image(nsImage: NSImage(named: "AppIcon")!)
            Text("Who's missing?").font(.title)
            Text("by Pavel Makhov").font(.caption)
            Text("version " + currentVersion).font(.footnote)
            Divider()
            
            Button(action: {
                openURL(URL(string:"https://github.com/menubar-apps/issues/issues/new?assignees=streetturtle&labels=who-is-missing&projects=&template=reature_request.md&title=")!)
            }) {
                HStack {
                    Image(systemName: "star.fill")
                    Text("Request a Feature")
                }
                .frame(width: 150)
            }
            
            Button(action: {
                openURL(URL(string:"https://github.com/menubar-apps/issues/issues/new?assignees=streetturtle&labels=who-is-missing&projects=&template=bug_report.md&title=")!)
            }) {
                HStack {
                    Image(systemName: "ladybug.fill")
                    Text("Report a Bug")
                }
                .frame(width: 150)
            }
            
            Button(action: {
                openURL(URL(string:"https://apps.apple.com/app/id6502242117?action=write-review")!)
            }) {
                HStack {
                    Image(systemName: "pencil.line")
                    Text("Rate this app")
                }
                .frame(width: 150)
            }
        }.padding()
    }
}

#Preview {
    AboutView()
}
