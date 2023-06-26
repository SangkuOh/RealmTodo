//
//  CreateView.swift
//  RealmTodo
//
//  Created by sangku on 2023/06/26.
//

import RealmSwift
import SwiftUI

struct CreateView: View {
	@ObservedResults(Item.self) var items
	
	@Binding var isPresented: Bool
	
	@State var text: String = ""
	
	var body: some View {
		NavigationStack {
			TextField
				.init("type Todo", text: $text)
				.textFieldStyle(.roundedBorder)
				.padding()
				.toolbar {
					ToolbarItem
						.init(
							placement: .navigationBarTrailing,
							content: {
								Button {
									tappedAddButton()
								} label: {
									Text("Add")
								}
								.buttonStyle(.borderedProminent)
							}
						)
				}
				.navigationTitle("New Item")
		}
	}
}

extension CreateView {
	func tappedAddButton() {
		let newItem: Item = .init()
		newItem.content = text
		$items.append(newItem)
		isPresented.toggle()
	}
}
struct CreateView_Previews: PreviewProvider {
	struct PreviewContainer: View {
		@State var isPresented: Bool = false
		
		var body: some View {
			CreateView(isPresented: $isPresented)
		}
	}
	static var previews: some View {
		PreviewContainer()
	}
}
