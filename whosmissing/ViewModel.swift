//
//  ViewModel.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-04-29.
//

import Foundation


class ViewModel: ObservableObject {
    
    private var client = IssApiClient()

    @Published var spacecrafts: [String: [Astronaut]] = [:]
    @Published var expedition: Expedition?
    
    init(client: IssApiClient = IssApiClient()) {
        self.client = client
        refresh()
        startDailyTimer()
        
    }
    
    @objc func refresh() {
        NSLog("Refreshing")
        client.getExpedition() { expedition in
            switch(expedition) {
            case .success(let ex):
                self.expedition = ex
                self.spacecrafts.removeAll()
                for astronaut in ex.people {
                    if var astronautsInSpacecraft = self.spacecrafts[astronaut.spacecraft] {
                        astronautsInSpacecraft.append(astronaut)
                        self.spacecrafts[astronaut.spacecraft] = astronautsInSpacecraft
                    } else {
                        self.spacecrafts[astronaut.spacecraft] = [astronaut]
                    }
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    private func startDailyTimer() {
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let timer = Timer(fireAt: tomorrow, interval: 5, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }
}

