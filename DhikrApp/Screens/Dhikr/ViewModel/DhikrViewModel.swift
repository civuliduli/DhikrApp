//
//  DhikrViewModel.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 17.11.24.
//

import Foundation
import Combine

class DhikrViewModel: ObservableObject {
    
    @Published private(set) var dhikrData: [Dhikr]?
    
    func loadDhikrData() {
        guard let url = Bundle.main.url(forResource: "dhikrData", withExtension: "json") else {
            print("JSON file not found")
            return
        }
        print(url)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            dhikrData = try decoder.decode([Dhikr].self, from: data)
                .compactMap({ dhikr in
                    Dhikr(title: dhikr.title, time: dhikr.time, dhikr: dhikr.dhikr)
                })
        } catch {
            print("Failed to load JSON file: \(error)")
        }
    }
}
