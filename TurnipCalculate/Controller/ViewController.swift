//
//  ViewController.swift
//  TurnipCalculate
//
//  Created by Kang on 2022/02/12.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet var lineChartView: LineChartView!
    
    var days: [String] = []
    var turnip: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "무 값 계산기"

        days = ["월", "화", "수", "목", "금", "토"]
        turnip = [90.0, 85.0, 70.0, 65.0, 55.0, 45.0]
        
        setChart(dataPoins: days, values: turnip)
        
    }
    
    func setChart(dataPoins: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<turnip.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: turnip[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "무 값")
        
        // 차트 컬러
        chartDataSet.colors = [.systemRed]

        // 데이터 삽입
        let chartData = LineChartData(dataSet: chartDataSet)
        lineChartView.data = chartData
        
    
        chartDataSet.highlightEnabled = false //선택 x
        lineChartView.doubleTapToZoomEnabled = false //터치시 줌 x
        
        //x축 위치, 포맷
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        lineChartView.xAxis.setLabelCount(dataPoins.count, force: false)
        
        //오른쪽 제거
        lineChartView.rightAxis.enabled = false
        

    }


}

