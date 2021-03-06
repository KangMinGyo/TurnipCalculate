//
//  CalculateViewController.swift
//  TurnipCalculate
//
//  Created by Kang on 2022/02/12.
//

import UIKit
import Charts

class CalculateViewController: UIViewController {

    @IBOutlet var lineChartView: LineChartView!
    
    var days: [String] = []
    //입력값
    var value: [Int] = []
    var turnipValue: [Double] = []
    
    //결과값
    var turnip: [[Int]] = [[]]
    var minLine: [Double] = []
    var maxLine: [Double] = []
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "이번주 무값"

        lineChartView.noDataText = "로딩중.."
        

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
        
//        sunPrice = TurnipInfomation.shared.sunPrice
//        monAM = TurnipInfomation.shared.monAM
//        monPM = TurnipInfomation.shared.monPM
//        tueAM = TurnipInfomation.shared.tueAM
//        tuePM = TurnipInfomation.shared.tuePM
//        wenAM = TurnipInfomation.shared.wenAM
//        wenPM = TurnipInfomation.shared.wenPM
//        thuAM = TurnipInfomation.shared.thuAM
//        tuePM = TurnipInfomation.shared.tuePM
//        friAM = TurnipInfomation.shared.friAM
//        friPM = TurnipInfomation.shared.friPM
//        satAM = TurnipInfomation.shared.satAM
//        satPM = TurnipInfomation.shared.satPM
        
        days = ["월AM", "월PM", "화AM", "화PM", "수AM", "수PM", "목AM", "목PM", "금AM", "금PM", "토AM", "토PM"]
        

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        guard let url: URL = URL(string: "https://api.ac-turnip.com/data/?f=\(sunPrice ?? "0")-\(monAM ?? "0")-\(monPM ?? "0")-\(tueAM ?? "0")-\(tuePM ?? "0")-\(wenAM ?? "0")-\(wenPM ?? "0")-\(thuAM ?? "0")-\(thuPM ?? "0")-\(friAM ?? "0")-\(friPM ?? "0")-\(satAM ?? "0")-\(satPM ?? "0")") else {
            return
        }
        
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let apiResponse: Turnip = try JSONDecoder().decode(Turnip.self, from: data)
                
                self.value = apiResponse.filters
                for i in self.value {
                    self.turnipValue.append(Double(i))
                }
                self.turnipValue.remove(at: 0)
                
                
                self.turnip = apiResponse.minMaxPattern
                for i in 0..<self.turnip.count {
                    self.minLine.append(Double(self.turnip[i][0]))
                    self.maxLine.append(Double(self.turnip[i][1]))
                }
                
                print(self.minLine)
                print(self.maxLine)
            
                DispatchQueue.main.async {
                    self.setChart(dataPoints: self.days, minLines: self.minLine, maxLines: self.maxLine)

                }
        
            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    func setChart(dataPoints: [String], minLines: [Double], maxLines: [Double]) {
        //데이터 생성
        var minLineDataEntries: [ChartDataEntry] = []
        var maxLineDataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let minLineDataEntry = ChartDataEntry(x: Double(i), y: minLines[i])
            let maxLineDataEntry = ChartDataEntry(x: Double(i), y: maxLines[i])
            
            minLineDataEntries.append(minLineDataEntry)
            maxLineDataEntries.append(maxLineDataEntry)
            
        }
            
        //데이터셋 생성
        let minLineChartDataSet = LineChartDataSet(entries: minLineDataEntries, label: "최소값")
        let maxLineChartDataSet = LineChartDataSet(entries: maxLineDataEntries, label: "최대값")
            
        //색상 변경
        minLineChartDataSet.colors = [.red]
        maxLineChartDataSet.colors = [.blue]
            
        //데이터 생성
        let data: LineChartData = LineChartData()
        data.addDataSet(minLineChartDataSet)
        data.addDataSet(maxLineChartDataSet)
            
        lineChartView.data = data
            
        //x축 레이블
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        lineChartView.xAxis.setLabelCount(dataPoints.count, force: true)
        lineChartView.xAxis.labelPosition = .bottom

        // 오른쪽 레이블 제거
        lineChartView.rightAxis.enabled = false
            
        // 선택 안되게
        minLineChartDataSet.highlightEnabled = false
        maxLineChartDataSet.highlightEnabled = false
            
        // 줌 안되게
        lineChartView.doubleTapToZoomEnabled = false
        
        //원 색, 크기
        minLineChartDataSet.circleRadius = 3.0
        maxLineChartDataSet.circleRadius = 3.0
        minLineChartDataSet.circleHoleRadius = 3.0
        maxLineChartDataSet.circleHoleRadius = 3.0
        
        minLineChartDataSet.circleColors = [.gray]
        maxLineChartDataSet.circleColors = [.gray]

    }

}
