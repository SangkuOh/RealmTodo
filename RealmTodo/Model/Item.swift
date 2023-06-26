//
//  Item.swift
//  RealmTodo
//
//  Created by sangku on 2023/06/26.
//

import RealmSwift

class Item: Object, ObjectKeyIdentifiable {
	@Persisted(primaryKey: true) var _id: ObjectId
	@Persisted var isComplete = false
	@Persisted var content: String
}

