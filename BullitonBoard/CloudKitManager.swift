//
//  CloudKitManager.swift
//  BullitonBoard
//
//  Created by Erik HARTLEY on 2/5/18.
//  Copyright © 2018 Erik HARTLEY. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitManager {
    
    
    private let publicDB = CKContainer.default().publicCloudDatabase

    //save a message
    func save(message: Message) {
        publicDB.save(message.asCKRecord) { (_, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Successfully saved to CloudKit")
            }
        }
    }
    
    //load all messages
    func load(completion: @escaping (([CKRecord]?, Error?) -> Void)) {
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: CloudKitKeys.type, predicate: predicate)
        let sortByDate = NSSortDescriptor(key: CloudKitKeys.date, ascending: false)
        query.sortDescriptors = [sortByDate]
        
        publicDB.perform(query, inZoneWith: nil, completionHandler: completion)
        
    }
}













