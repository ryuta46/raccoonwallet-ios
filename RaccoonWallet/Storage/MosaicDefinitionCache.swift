//
//  Created by Taizo Kusuda on 2018/09/29.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class MosaicDefinitionCache {
    struct CachedData: Codable {
        var definitions: [String: MosaicDefinition]
    }
    
    static let shared = MosaicDefinitionCache()
    
    private static let KEY_MOSAIC_DEFINITION_CACHE = "key_mosaic_definition_cache"
    
    private let userDefaults: UserDefaults
    private var cachedData: CachedData = CachedData(definitions: [:])
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
        
        loadCachedData()
    }
    
    func getCached(with fullName: String) -> MosaicDefinition? {
        //Logger.shared.debug("Searching mosaic definition \(fullName)")
        let cached = cachedData.definitions[fullName]
        /*
        if cached == nil {
            Logger.shared.debug("Not Found mosaic definition \(fullName)")
        } else {
            Logger.shared.debug("Found mosaic definition \(fullName)")
        }
         */
        return cached
    }
    
    func cache(definition: MosaicDefinition) {
        Logger.shared.debug("New cache \(definition.id.description)")
        cachedData.definitions[definition.id.description] = definition
        
        // save
        saveCachedData()
    }
    
    private func loadCachedData() {
        // Load saved data
        if userDefaults.object(forKey: MosaicDefinitionCache.KEY_MOSAIC_DEFINITION_CACHE) != nil {
            let decoder = JSONDecoder()
            if let savedString = userDefaults.string(forKey: MosaicDefinitionCache.KEY_MOSAIC_DEFINITION_CACHE),
                let savedData = savedString.data(using: .utf8),
                let decodedData = try? decoder.decode(CachedData.self, from: savedData) {
                cachedData = decodedData
            }
        }
    }
    private func saveCachedData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cachedData),
            let encodedString = String(data: encoded, encoding: .utf8) {
            userDefaults.setValue(encodedString, forKey: MosaicDefinitionCache.KEY_MOSAIC_DEFINITION_CACHE)
        }
    }
    
}

extension MosaicId: Encodable {
    enum MosaicIdKeys: String, CodingKey {
        case namespaceId
        case name
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MosaicIdKeys.self)
        try container.encode(namespaceId, forKey: .namespaceId)
        try container.encode(name, forKey: .name)
    }
}

extension MosaicProperty: Encodable {
    enum MosaicPropertyKeys: String, CodingKey {
        case name
        case value
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MosaicPropertyKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(value, forKey: .value)
    }
}

extension MosaicLevy: Encodable {
    enum MosaicLevyKeys: String, CodingKey {
        case type
        case recipient
        case mosaicId
        case fee
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MosaicLevyKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(recipient, forKey: .recipient)
        try container.encode(mosaicId, forKey: .mosaicId)
        try container.encode(fee, forKey: .fee)
    }
}

extension MosaicDefinition: Encodable {
    enum MosaicDefinitionKeys: String, CodingKey {
        case creator
        case id
        case description
        case properties
        case levy
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MosaicDefinitionKeys.self)
        try container.encode(creator, forKey: .creator)
        try container.encode(id, forKey: .id)
        try container.encode(description, forKey: .description)
        try container.encode(properties, forKey: .properties)
        try container.encode(levy, forKey: .levy)
    }
}
