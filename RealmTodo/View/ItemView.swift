//
//  ItemView.swift
//  RealmTodo
//
//  Created by sangku on 2023/06/26.
//

import RealmSwift
import SwiftUI

struct ItemView: View {
	@ObservedRealmObject var item: Item

	var body: some View {
		Toggle
			.init(
				isOn: $item.isComplete,
				label: {
					Text(item.content)
				}
			)
	}
}

struct ItemView_Previews: PreviewProvider {
	struct PreviewContainer: View {
		@State var item: Item = .init()

		var body: some View {
			NavigationStack {
				ItemView(item: item)
					.onAppear {
						item.content = "Content"
					}
			}
		}
	}

	static var previews: some View {
		PreviewContainer()
	}
}
