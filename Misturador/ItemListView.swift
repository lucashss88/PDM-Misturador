//
//  ItemListView.swift
//  Misturador
//
//  Created by ifpb on 16/12/22.
//

import SwiftUI

struct ItemListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var cor: Cor
    var body: some View {
        HStack{
            Circle()
                .frame(width: 30,height: 30)
                .foregroundColor(Color(red: cor.red, green: cor.green, blue: cor.blue))
            Text(cor.nome ?? "")
            Spacer()
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(cor: Cor())
    }
}
