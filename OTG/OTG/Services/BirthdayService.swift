//
//  BirthdayService.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import Foundation

struct BirthdayService {
    
    func fetchJSON(completion: @escaping([String: Any]) -> Void) {
        
        guard let filePath = Bundle.main.path(forResource: "birthdays", ofType: "json") else { return }
        let url = URL(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: url, options: .uncached)
            
            do {
                if let jsonDict = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    completion(jsonDict)
                    print("jsonDict is \(jsonDict)")
                }
            } catch let error {
                print("JSONSerialization error: \(error.localizedDescription)")
            }
        } catch let error {
            print("Data error: \(error.localizedDescription)")
        }
    }
}
