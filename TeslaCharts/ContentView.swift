//
//  ContentView.swift
//  TeslaCharts
//
//  Created by Meghdad Abbaszadegan on 8/13/20.
//  Copyright © 2020 Meghdad Abbaszadegan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 30, 40], [150, 100, 50, 180, 110], [120, 20, 30, 50, 100]
    ]
    
    var body: some View {
        
        ZStack {
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Driving Efficiency")
                            .font(.system(size: 24))
                            .fontWeight(.heavy)
                            .padding(12)
                .foregroundColor(Color("title"))
                ZStack(alignment: .top) {
                           Color("appBackground").edgesIgnoringSafeArea(.all)
                           
                           VStack(alignment: .leading) {
                                       
                                       Picker(selection: $pickerSelectedItem, label: Text("")) {
                                           Text("D").tag(0)
                                           Text("W").tag(1)
                                           .foregroundColor(Color("title"))
                                           
                                       }.pickerStyle(SegmentedPickerStyle())
                                           .padding(12)
                               
                               HStack (spacing: 16) {
                                   BarChart(value: dataPoints[pickerSelectedItem][0])
                                   BarChart(value: dataPoints[pickerSelectedItem][1])
                                   BarChart(value: dataPoints[pickerSelectedItem][2])
                                   BarChart(value: dataPoints[pickerSelectedItem][3])
                                   BarChart(value: dataPoints[pickerSelectedItem][4])
                                   BarChart(value: dataPoints[pickerSelectedItem][2])
                                   BarChart(value: dataPoints[pickerSelectedItem][3])
                                  
                               
                               }.padding(12)
                                   .animation(.default)
                               
                               
                           }.background(Color("cardBackground"))
                           .padding(12)
                               .cornerRadius(50)
                       }
                
            }.padding(12)
        }
        
        
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BarChart: View {
    
    var value: CGFloat
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8235294118, blue: 0.8235294118, alpha: 1)))
                Capsule().frame(width:30, height: value)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5450980392, blue: 0.5450980392, alpha: 1)))
            }
            Text("Su").padding(.top, 8).foregroundColor(Color.white)
        }
    }
}
