//
//  Bundle+Decoding.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 16/12/25.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Falha ao localizar \(file) no bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Falha ao carregar \(file) do bundle.")
        }

        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Faltou a chave '\(key.stringValue)' em \(file) – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Tipo errado em \(file) – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Valor nulo não esperado para o tipo \(type) em \(file) – \(context.debugDescription)")
        } catch {
            fatalError("Falha ao decodificar \(file): \(error.localizedDescription)")
        }
    }
}
