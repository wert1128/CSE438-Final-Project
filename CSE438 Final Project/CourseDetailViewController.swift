//
//  CourseDetailViewController.swift
//  CSE438 Final Project
//
//  Created by 王梓辰 on 7/23/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import UIKit
import Charts

class CourseDetailViewController: UIViewController, ChartViewDelegate {
    
    var theCourse:Course?
    var scoresChart = PieChartView()
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var instructor: UILabel!
    @IBOutlet weak var attributes: UILabel!
    @IBOutlet weak var schedule: UILabel!
    @IBOutlet weak var credits: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var enrolled: UILabel!
    @IBOutlet weak var waitlist: UILabel!
    @IBOutlet var informationView: UIView!
    
    @IBOutlet var finalGradesView: UIView!
    
    @IBOutlet var scoresView: UIView!
    @IBOutlet var scoresSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courseName.text = theCourse?.name
        instructor.text = theCourse?.instructor
        attributes.text = theCourse?.attributes
        schedule.text = theCourse?.schedule
        credits.text = "\(String(describing: theCourse?.credits))"
        location.text = theCourse?.location
        enrolled.text = "\(String(describing: theCourse?.enrolled))/\(String(describing: theCourse?.maxSeat))"
        waitlist.text = "\(String(describing: theCourse?.waitlist))"
        
        let theDescriptionFrame = CGRect(x: 8, y: 240, width: 304, height: 102)
        let theDescriptionView = UITextView(frame: theDescriptionFrame)
        theDescriptionView.text = theCourse?.description
        informationView.addSubview(theDescriptionView)
        
        let pieChartFrame = CGRect(x: 8, y: 60, width: 368, height: 368)
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
        set.colors = ChartColorTemplates.material()
        
        let data = PieChartData(dataSet: set)
        
        pieChart.data = data
        finalGradesView.addSubview(pieChart)
        
        let pieChartFrame1 = CGRect(x: 8, y: 70, width: 368, height: 368)
        scoresChart.frame = pieChartFrame1
        scoresChart.delegate = self
        var entries1 = [PieChartDataEntry]()
        
        entries1.append(PieChartDataEntry(value: 50, label: "90+"))
        entries1.append(PieChartDataEntry(value: 70, label: "80+"))
        entries1.append(PieChartDataEntry(value: 30, label: "70+"))
        entries1.append(PieChartDataEntry(value: 20, label: "60+"))
        entries1.append(PieChartDataEntry(value: 10, label: "Fail"))
        
        let set1 = PieChartDataSet(entries: entries1)
        set1.colors = ChartColorTemplates.material()
        
        let data1 = PieChartData(dataSet: set1)
        
        scoresChart.data = data1
        
    }
    
    @IBAction func scoresChanged(_ sender: Any) {
        switch scoresSegment.selectedSegmentIndex {
        case 0:
            var entries1 = [PieChartDataEntry]()
            
            entries1.append(PieChartDataEntry(value: 50, label: "90+"))
            entries1.append(PieChartDataEntry(value: 70, label: "80+"))
            entries1.append(PieChartDataEntry(value: 30, label: "70+"))
            entries1.append(PieChartDataEntry(value: 20, label: "60+"))
            entries1.append(PieChartDataEntry(value: 10, label: "Fail"))
            
            let set1 = PieChartDataSet(entries: entries1)
            set1.colors = ChartColorTemplates.material()
            
            let data1 = PieChartData(dataSet: set1)
            
            scoresChart.data = data1
            scoresChart.reloadInputViews()
            break
        case 1:
            var entries1 = [PieChartDataEntry]()
            
            entries1.append(PieChartDataEntry(value: 70, label: "90+"))
            entries1.append(PieChartDataEntry(value: 40, label: "80+"))
            entries1.append(PieChartDataEntry(value: 20, label: "70+"))
            entries1.append(PieChartDataEntry(value: 10, label: "60+"))
            entries1.append(PieChartDataEntry(value: 5, label: "Fail"))
            
            let set1 = PieChartDataSet(entries: entries1)
            set1.colors = ChartColorTemplates.material()
            
            let data1 = PieChartData(dataSet: set1)
            
            scoresChart.data = data1
            scoresChart.reloadInputViews()
            break
        default:
            break
        }
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
