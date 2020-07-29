//
//  StatsViewController.swift
//  CSE438 Final Project
//
//  Created by 王梓辰 on 7/28/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Charts

class StatsViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var numberA: UILabel!
    @IBOutlet weak var numberB: UILabel!
    @IBOutlet weak var numberC: UILabel!
    @IBOutlet weak var numberD: UILabel!
    @IBOutlet weak var numberPass: UILabel!
    @IBOutlet weak var numberFail: UILabel!
    @IBOutlet weak var avgGPA: UILabel!
    
    var departmentId:String?
    var courseId:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let pieChartFrame = CGRect(x: 0, y: 165, width: self.view.frame.width, height: self.view.frame.width)
        let pieChart = PieChartView(frame: pieChartFrame)
        pieChart.delegate = self
        var entries = [PieChartDataEntry]()
        
        entries.append(PieChartDataEntry(value: 50, label: "A"))
        entries.append(PieChartDataEntry(value: 70, label: "B"))
        entries.append(PieChartDataEntry(value: 30, label: "C"))
        entries.append(PieChartDataEntry(value: 20, label: "D"))
        entries.append(PieChartDataEntry(value: 10, label: "Pass"))
        entries.append(PieChartDataEntry(value: 5, label: "Fail"))
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        
        let data = PieChartData(dataSet: set)
        
        pieChart.data = data
        
        self.view.addSubview(pieChart)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
