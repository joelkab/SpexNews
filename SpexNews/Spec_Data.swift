//
//  Spec_Data.swift
//  SpexNews
//
//  Created by Joel Kabura on 8/9/22.
//

import Foundation
// MARK: - Welcome
struct NewsInfo: Decodable, Identifiable {
    let id: Int
    let title: String
    let url: String
    let imageURL: String
    let newsSite, summary, publishedAt, updatedAt: String
    let featured: Bool
    let launches: [Launch]
   

    enum CodingKeys: String, CodingKey {
        case id, title, url
        case imageURL = "imageUrl"
        case newsSite, summary, publishedAt, updatedAt, featured, launches
    }
}

// MARK: - Launch
struct Launch: Codable {
    let id, provider: String
}

class GridViewModel: ObservableObject {
     
    
    @Published var resultss: [NewsInfo] = []
    
    init() {
        // json decoding simulation
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
//            self.items = 0..<15
//        }
            guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=20") else { return }
        
            URLSession.shared.dataTask(with: url) {[weak self] (data, resp, err) in
                // check response status and err
                guard let data = data else { return }
                do {
                    let rss = try JSONDecoder().decode([NewsInfo].self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        self?.resultss = rss
                        
                    }
                    
                } catch {
                    print("Failed to decode: \(error)")
                }
            }.resume()
    }
}
