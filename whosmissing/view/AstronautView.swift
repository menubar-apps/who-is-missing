//
//  Astronaut.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-04-29.
//

import SwiftUI

struct AstronautView: View {
    var astonaut: Astronaut
    @Environment(\.openURL) var openURL

    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: astonaut.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            } placeholder: {
                Color.gray
                    .clipShape(Circle())
            }
            .frame(width: 100, height: 100)
            
                Text(astonaut.name)
                    .font(.headline)
            HStack {
                if !astonaut.url.isEmpty {
                    Button{
                        openURL(URL(string: astonaut.url)!)
                    } label: {
                        Image("bxl-wikipedia")
                    }
                    .buttonStyle(.borderless)
                }
                
                if !astonaut.instagram.isEmpty {
                    Button{
                        openURL(URL(string: astonaut.instagram)!)
                    } label: {
                        Image("bxl-instagram")
                    }
                    .buttonStyle(.borderless)
                }
                if !astonaut.twitter.isEmpty {
                    Button{
                        openURL(URL(string: astonaut.twitter)!)
                    } label: {
                        Image("bxl-twitter")
                    }
                    .buttonStyle(.borderless)

                }
            }
        }
        .frame(width: 120)
        
    }
}

#Preview {
    AstronautView(astonaut:
                    Astronaut(
                        id: 2,
                        name: "Andreas Mogensen",
                        country: "Denmark",
                        flagCode: "dk",
                        agency: "ESA",
                        position: "Commander",
                        spacecraft: "Crew-7 Dragon",
                        launched: 1693027620,
                        iss: true,
                        daysInSpace: 10,
                        url: "https://en.wikipedia.org/wiki/Andreas_Mogensen",
                        image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/f0/Andreas_Mogensen_official_portrait.jpg")!,
                        instagram: "https://www.instagram.com/astro_andreas/",
                        twitter: "https://twitter.com/Astro_Andreas",
                        facebook: "https://www.facebook.com/ESAAndreasMogensen/"
                    ))
    .padding()
}
