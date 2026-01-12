//
//  TopicViewModel.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import Foundation

class TopicsViewModel: ObservableObject {
    @Published var topics: [Topic] = []

    func loadTopics() {
        guard let url = Bundle.main.url(forResource: "topics", withExtension: "json") else {
            print("JSON file not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(TopicsResponse.self, from: data)
            DispatchQueue.main.async {
                self.topics = decodedData.topics
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    
    
}

