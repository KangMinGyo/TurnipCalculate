//
//  CalculateViewController.swift
//  TurnipCalculate
//
//  Created by Kang on 2022/02/12.
//

import UIKit
import Charts
import GoogleMobileAds

class CalculateViewController: UIViewController, ChartViewDelegate {
    
    var lineChart = LineChartView()
    
    var days: [String] = []

    var minmaxPattern = [[Int]]()
    var minPattern = [Int]()
    var maxPattern = [Int]()
    
    var sunPrice: String?
    var monAM: String?
    var monPM: String?
    var tueAM: String?
    var tuePM: String?
    var wenAM: String?
    var wenPM: String?
    var thuAM: String?
    var thuPM: String?
    var friAM: String?
    var friPM: String?
    var satAM: String?
    var satPM: String?
    
    lazy var bannerView: GADBannerView = {
        let banner = GADBannerView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        return banner
    }()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        lineChart.delegate = self

        getTurnip()
        getData()
        
        days = ["월AM", "월PM", "화AM", "화PM", "수AM", "수PM", "목AM", "목PM", "금AM", "금PM", "토AM", "토PM"]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        chartData()
    }

    
    func getTurnip() {
        sunPrice = UserDefaults.standard.object(forKey: "sunday") as? String
        monAM = UserDefaults.standard.object(forKey: "monAM") as? String
        monPM = UserDefaults.standard.object(forKey: "monPM") as? String
        tueAM = UserDefaults.standard.object(forKey: "tueAM") as? String
        tuePM = UserDefaults.standard.object(forKey: "tuePM") as? String
        wenAM = UserDefaults.standard.object(forKey: "wenAM") as? String
        wenPM = UserDefaults.standard.object(forKey: "wenPM") as? String
        thuAM = UserDefaults.standard.object(forKey: "thuAM") as? String
        thuPM = UserDefaults.standard.object(forKey: "thuPM") as? String
        friAM = UserDefaults.standard.object(forKey: "friAM") as? String
        friPM = UserDefaults.standard.object(forKey: "friPM") as? String
        satAM = UserDefaults.standard.object(forKey: "satAM") as? String
        satPM = UserDefaults.standard.object(forKey: "satPM") as? String
    }
    
    func getData() {
        TurnipService().getTurnip(sun: sunPrice ?? "0", monAm: monAM ?? "0", monPm: monPM ?? "0", tueAm: tueAM ?? "0", tuePm: tuePM ?? "0", wedAm: wenAM ?? "0", wedPm: wenPM ?? "0", thuAm: thuAM ?? "0", thuPm: thuPM ?? "0", friAm: friAM ?? "0", friPm: friPM ?? "0", satAm: satAM ?? "0", satPm: satPM ?? "0") { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.minmaxPattern.append(contentsOf: response.minMaxPattern)
                    for value in self.minmaxPattern {
                        self.minPattern.append(value[0])
                        self.maxPattern.append(value[1])
                    }
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    func chartData() {
        lineChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height / 3)
        lineChart.center = view.center
        view.addSubview(lineChart)
        var minLineDataEntries = [ChartDataEntry]()
        var maxLineDataEntries = [ChartDataEntry]()

        for i in 0..<days.count {
            let minLineDataEntry = ChartDataEntry(x: Double(i), y: Double(minPattern[i]))
            let maxLineDataEntry = ChartDataEntry(x: Double(i), y: Double(maxPattern[i]))

            minLineDataEntries.append(minLineDataEntry)
            maxLineDataEntries.append(maxLineDataEntry)
        }

        let minset = LineChartDataSet(entries: minLineDataEntries, label: "최소값(min)")
        let maxset = LineChartDataSet(entries: maxLineDataEntries, label: "최대값(max)")
        
        minset.colors = [.red]
        maxset.colors = [.blue]
        
        let data = LineChartData(dataSets: [minset, maxset])
        lineChart.data = data
        
        //x축 레이블
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        lineChart.xAxis.setLabelCount(days.count, force: true)
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.labelFont = UIFont.systemFont(ofSize: 7)
        
        // 오른쪽 레이블 제거
        lineChart.rightAxis.enabled = false
        
        // 선택 안되게
        minset.highlightEnabled = false
        maxset.highlightEnabled = false
            
        // 줌 안되게
        lineChart.doubleTapToZoomEnabled = false
        
        //원 색, 크기
        minset.circleRadius = 3.0
        maxset.circleRadius = 3.0
        minset.circleHoleRadius = 3.0
        maxset.circleHoleRadius = 3.0
        minset.circleColors = [.gray]
        maxset.circleColors = [.gray]
    }
}

