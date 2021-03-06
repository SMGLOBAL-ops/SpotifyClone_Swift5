//
//  AuthResponse.swift
//  Spotify
//
//  Created by Saif Mustafa on 28/09/2021.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String
    let scope: String
    let token_type: String
}
