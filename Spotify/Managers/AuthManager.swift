//
//  AuthManager.swift
//  Spotify
//
//  Created by Saif Mustafa on 24/09/2021.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "905f411dc49c47208b95b480c236159c"
        static let clientSecret = "aff83f273b0f45ffa92d9fe31cc25fbc"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.iosacademy.io"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool) -> Void)) {
        
        // Get Token
        guard let url = URL(string: Constants.tokenAPIURL) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            
            // convert to JSON
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                
                print("SUCCESS: \(json)")
            }
            
            catch {
                print(error.localizedDescription)
                completion(false)
                
            }
            
            
        }
        task.resume()
    }
    
    private func cacheToken() {
        
    }
    
}

