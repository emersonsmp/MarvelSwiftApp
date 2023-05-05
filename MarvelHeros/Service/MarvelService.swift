import Foundation
import Alamofire
import CryptoKit

class MarvelService{
    
    func get(endpoint: String, completion: @escaping (Result<[Character], Error>) -> Void) {
        let baseURL = "https://gateway.marvel.com/v1/public"
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(string: ts + MarvelAPIKeys.privateKey + MarvelAPIKeys.publicKey)
        let params: [String: Any] = [
            "ts": ts,
            "apikey": MarvelAPIKeys.publicKey,
            "hash": hash,
        ]
        
        let url = baseURL + endpoint
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let marvelResponse = try decoder.decode(MarvelResponse.self, from: data)
                        let character = marvelResponse.data.results
                        completion(.success(character))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
    struct MarvelResponse: Codable {
        let data: CharacterDataContainer
    }
    
    struct CharacterDataContainer: Codable {
        let results: [Character]
    }
    
}
