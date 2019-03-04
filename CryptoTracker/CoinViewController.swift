//
//  CoinViewController.swift
//  CryptoTracker
//
//  Created by clinton gitahi on 01/03/2019.
//  Copyright © 2019 clinton gitahi. All rights reserved.
//

import UIKit
import SwiftChart

private let chartHeight : CGFloat = 300.0
private let imageSize : CGFloat = 100.0

class CoinViewController: UIViewController, CoinDataDelegate {
    
    var chart = Chart()
    var coin : Coin?

    override func viewDidLoad() {
        super.viewDidLoad()

        CoinData.shared.delegate  = self
        
        view.backgroundColor = UIColor.white
        edgesForExtendedLayout = []
        chart.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: chartHeight)
        chart.yLabelsFormatter = { CoinData.shared.doubleToMoneyString(double: $1)}
        chart.xLabels = [0, 5, 10, 15, 20, 25, 30]
        chart.xLabelsFormatter = {String(Int(round(30-$1))) + "d"}
        
        view.addSubview(chart)
        
        let imageView = UIImageView(frame: CGRect(x: view.frame.size.width / 2 - imageSize / 2, y: chartHeight, width: imageSize, height: imageSize))
        imageView.image = coin?.image
        
        view.addSubview(imageView)
        
        coin?.getHistoricalData()
    }
    
    func newHistory() {
        if let coin = coin {
          let series = ChartSeries(coin.historicalData)
            series.area = true
            chart.add(series)
        }
    }

}
