//
//  Repository.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 22/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

enum Category: String {
    case pet
    case activity
    case vaccine
}

// MARK: - Repository
protocol Repository {
    associatedtype Item: RepositoryItem
    var category: String { get }
}

extension Repository {
// MARK: - Repository Default Implementation
    func createNewItem() -> Item? {

        let newItem = Item()
        FileHelper().createDirectory(with: category)
        //persist file
        if let data = try? JSONEncoder().encode(newItem) {
            FileHelper().createFile(with: data, name: newItem.identifier, path: category)
            return newItem
        }

        return nil
    }

    func readAllItems() -> [Item] {

        //read the content of the documents path
        let fileNames: [String] = FileHelper().contentsForDirectory(atPath: category)
        var items: [Item] = []
        //retrieve items from fileNames and updating items array
        items = fileNames.compactMap { fileName in
            let path = category + "/" + fileName
            if let data = FileHelper().retrieveFile(at: path) {
                //decode from Data type to Item type
                let item = try? JSONDecoder().decode(Item.self, from: data)
                return item
            }
            return nil
        }

        return items
    }

    func readItem(identifier: String) -> Item? {

        let path = category + "/" + identifier

        if let data = FileHelper().retrieveFile(at: path) {
            //decode from Data type to Item type
            let item = try? JSONDecoder().decode(Item.self, from: data)
            return item
        }
        return nil
    }

    func update(item: Item) {
        let path = category + "/" + item.identifier
        //encode to Data format
        if let data = try? JSONEncoder().encode(item) {
            //overrite persisted file
            FileHelper().updateFile(at: path, data: data)
        }
    }

    func delete(identifier: String) {
        //remove file
        let path = category + "/" + identifier
        FileHelper().removeFile(at: path)
    }
}
