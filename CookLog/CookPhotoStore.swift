//
//  CookPhotoStore.swift
//  CookLog
//
//  Created by  유 주연 on 1/12/26.
//

import Foundation

import UIKit

enum CookPhotoStore {
    static func folderURL() throws -> URL {
        let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let folder = base.appendingPathComponent("CookPhotos", isDirectory: true)
        if !FileManager.default.fileExists(atPath: folder.path) {
            try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        }
        return folder
    }

    /// 이미지를 JPEG로 저장하고 "파일명"을 반환
    static func save(image: UIImage, quality: CGFloat = 0.85) throws -> String {
        let filename = "\(UUID().uuidString).jpg"
        let url = try folderURL().appendingPathComponent(filename)

        guard let data = image.jpegData(compressionQuality: quality) else {
            throw NSError(domain: "CookPhotoStore", code: 1)
        }
        try data.write(to: url, options: [.atomic])
        return filename
    }

    static func load(filename: String) -> UIImage? {
        do {
            let url = try folderURL().appendingPathComponent(filename)
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        } catch {
            return nil
        }
    }

    static func delete(filename: String) {
        do {
            let url = try folderURL().appendingPathComponent(filename)
            try FileManager.default.removeItem(at: url)
        } catch {
            // 무시 or 로깅
        }
    }
}
