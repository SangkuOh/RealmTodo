//
//  ContentView.swift
//  RealmTodo
//
//  Created by sangku on 2023/06/26.
//

import RealmSwift
import SwiftUI

struct ContentView: View {
	let app: RealmSwift.App = .init(id: "RealmTodo")

	@ObservedResults(Item.self, sortDescriptor: .init(keyPath: "isComplete", ascending: true)) var items

	@State var isSheet: Bool = false

	var body: some View {
		NavigationStack {
			List {
				ForEach(items, id: \.self) {
					ItemView(item: $0)
				}
				.onDelete(perform: $items.remove(atOffsets:))
			}
			.toolbar {
				ToolbarItem
					.init(
						placement: .navigationBarTrailing,
						content: {
							Button {
								isSheet.toggle()
							} label: {
								Text("Add")
							}
							.buttonStyle(.borderedProminent)
						}
					)
			}
			.navigationTitle("Todo")
			.sheet(
				isPresented: $isSheet,
				content: {
					CreateView(isPresented: $isSheet)
				}
			)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
