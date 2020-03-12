//
//  Meta.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

/** Meta data  */
public struct Meta: Codable {
    
    public init(key: String,
                value: CustomValue) {
        self.id = nil
        self.key = key
        self.value = value
    }
    
    /** Meta ID.*/
    public let id: Int?
    
    /** Meta key.*/
    public let key: String
    
    /** Meta value.*/
    public let value: CustomValue
    
}

public enum CustomValue: Codable {
    case string(String)
    case array([String])
    case dico([String : String])
    case arrayDico([[String : String]])
    
    var stringValue : String? {
        guard case let .string(value) = self else { return nil }
        return value
    }
    
    var arrayValue : [String]? {
        guard case let .array(value) = self else { return nil }
        return value
    }
    
    var dicoValue : [String : String]? {
        guard case let .dico(value) = self else { return nil }
        return value
    }
    
    var arrayDicoValue : [[String : String]]? {
        guard case let .arrayDico(value) = self else { return nil }
        return value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            
            return
        }
        if let x = try? container.decode([String].self) {
            self = .array(x)
            return
        }
        if let x = try? container.decode([String : String].self) {
            self = .dico(x)
            return
        }
        if let x = try? container.decode([[String : String]].self) {
            self = .arrayDico(x)
            return
        }
        throw DecodingError.typeMismatch(CustomValue.self,
                                         DecodingError.Context(codingPath: decoder.codingPath,
                                                               debugDescription: "Wrong type for CustomValue"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .array(let x):
            try container.encode(x)
        case .dico(let x):
            try container.encode(x)
        case .arrayDico(let x):
            try container.encode(x)
        }
    }
}
