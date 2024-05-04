//
//  DTO.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-04-29.
//

import Foundation

import Foundation

struct Expedition: Codable {
    let number: Int
    let issExpedition: Int?
    let expeditionPatch: URL
    let expeditionURL: String?
    let expeditionImage: URL
    let expeditionStartDate: TimeInterval?
    let expeditionEndDate: TimeInterval?
    let people: [Astronaut]
    
    private enum CodingKeys: String, CodingKey {
        case number,
             issExpedition = "iss_expedition",
             expeditionPatch = "expedition_patch",
             expeditionURL = "expedition_url",
             expeditionImage = "expedition_image",
             expeditionStartDate = "expedition_start_date",
             expeditionEndDate = "expedition_end_date", 
             people
    }
}

struct Astronaut: Codable {
    let id: Int
    let name: String
    let country: String
    let flagCode: String?
    let agency: String
    let position: String
    let spacecraft: String
    let launched: TimeInterval
    let iss: Bool
    let daysInSpace: Int?
    let url: String
    let image: URL
    let instagram: String
    let twitter: String
    let facebook: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, country, flagCode, agency, position, spacecraft, launched, iss, daysInSpace, url, image, instagram, twitter, facebook
    }
}



