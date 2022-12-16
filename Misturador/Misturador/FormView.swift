//
//  FormView.swift
//  Misturador
//
//  Created by ifpb on 16/12/22.
//

import SwiftUI

struct FormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State var nome : String = ""
    @State var red : Double = 0.0
    @State var green : Double = 0.0
    @State var blue : Double = 0.0
    var body: some View {
        VStack{
            Spacer()
            TextField("Nome", text: self.$nome).padding()
            Spacer()
            Slider(value: self.$red, in: 0...1, step:0.1)
                .colorMultiply(.red)
                .padding()
            
            Slider(value: self.$green, in: 0...1, step:0.1)
                .colorMultiply(.green)
                .padding()
            
            Slider(value: self.$blue, in: 0...1, step:0.1)
                .colorMultiply(.blue)
                .padding()
            Spacer()
            Rectangle().frame(height: 150.0)
                .foregroundColor(Color(red:self.red, green:self.green,blue:self.blue)).padding()
        }.navigationTitle("Cor")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Salvar"){
                self.addItem()
                self.presentationMode.wrappedValue.dismiss()
                        }
        }
    }
    public func addItem() {
        withAnimation {
            let novaCor = Cor(context: viewContext)
            novaCor.nome = self.nome
            novaCor.red = self.red
            novaCor.green = self.green
            novaCor.blue = self.blue

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
