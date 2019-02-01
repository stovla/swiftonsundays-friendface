//
//  JSONDecoder-Remote.swift
//  Friendface
//
//  Created by Vlastimir Radojevic on 29/1/19.
//  Copyright © 2019 Vlastimir Radojevic. All rights reserved.
//

import Foundation
// extension for decoder using Data(contentsOf:)
extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, fromURL url: String, completion: @escaping (T) -> Void) {
        guard let url = URL(string: url) else {
            fatalError("Invalid URL passed.")
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                let downloadedData = try self.decode(type, from: data)
                
                DispatchQueue.main.async {
                    completion(downloadedData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
