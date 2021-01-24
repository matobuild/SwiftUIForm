//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by kittawat phuangsombat on 2021/1/19.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-in First"]
    
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display order"))
                    {
                        ForEach(0 ..< displayOrders.count, id: (\.self)){
                            Text(self.displayOrders[$0])
                        }
                        
                    }
                    
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInOnly, label: {
                        Text("Show Check-in Only")
                    })
                    Stepper(
                        onIncrement: {
                            self.maxPriceLevel += 1
                            
                            if self.maxPriceLevel > 5 {
                                self.maxPriceLevel = 5
                            }
                        },
                        onDecrement: {
                            self.maxPriceLevel -= 1
                            
                            if self.maxPriceLevel < 1 {
                                self.maxPriceLevel = 1
                            }
                        }) {
                        Text("Show \(String(repeating: "$",count: maxPriceLevel)) or below")
                    }
                }
            }
            
            .navigationBarTitle("Settings")
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Text("Cancel")
                                            .foregroundColor(.black)
                                    })
                                
                                , trailing:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Text("Save")
                                            .foregroundColor(.black)
                                    })
            )
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
