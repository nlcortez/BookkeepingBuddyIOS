//
//  MaterialOverviewVC.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Firebase
import Foundation
import Charts

class MaterialOverviewVC : UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Overview"
        pieChartUpdate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pieChartUpdate () {
        let data1 = PieChartDataEntry(value: Double(5), label: "1")
        let data2 = PieChartDataEntry(value: Double(10), label: "2")
        let data3 = PieChartDataEntry(value: Double(15), label: "3")
        let dataSet = PieChartDataSet(values: [data1, data2, data3], label: "Label")
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = "This will have actual data later."
    
        pieChart.notifyDataSetChanged()
    }
    
    @IBAction func renderCharts() {
        pieChartUpdate()
    }
    
    
}

