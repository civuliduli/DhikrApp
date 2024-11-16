//
//  Dhikr.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 13.11.24.
//


import Foundation

struct Dhikr: Codable {
    let title: String
    let time: String
    let dhikr: [DhikrItems]
}

struct DhikrItems: Codable {
    let arabicText: String
    let transliteration: String
    let dhikrData: DhikrData
    let dhikrInfo: DhikrInfo
    let count: Int
}

struct DhikrData: Codable {
    let dhikr_Sq: String
}

struct DhikrInfo: Codable {
    let hadithInfo_Sq: String
}
