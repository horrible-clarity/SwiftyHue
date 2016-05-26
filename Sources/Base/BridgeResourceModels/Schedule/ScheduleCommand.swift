//
//  ScheduleCommand.swift
//  Pods
//
//  Created by Jerome Schmitz on 05.05.16.
//
//

import Foundation
import Gloss

public class ScheduleCommand: Decodable, Encodable {
    
    public let address: String
    public let method: String
    public let body: NSDictionary
    
    public required init?(json: JSON) {
        
        guard let address: String = "address" <~~ json,
            let method: String = "method" <~~ json,
            let body: JSON = "body" <~~ json
            
            else { Log.error("Can't create ScheduleCommand"); return nil }
        
        self.address = address
        self.method = method
        self.body = body
    }
    
    public func toJSON() -> JSON? {
        
        let json = jsonify([
            "address" ~~> self.address,
            "method" ~~> self.method,
            "body" ~~> self.body
            ])
        
        return json
    }
}

extension ScheduleCommand: Hashable {
    
    public var hashValue: Int {
        
        return 1
    }
}

public func ==(lhs: ScheduleCommand, rhs: ScheduleCommand) -> Bool {
    return lhs.address == rhs.address &&
        lhs.method  == rhs.method &&
        lhs.body  == rhs.body
}