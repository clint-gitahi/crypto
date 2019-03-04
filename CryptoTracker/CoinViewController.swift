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

class CoinViewController: UIViewController, CoinDataDelegate {
    
    var chart = Chart()
    var coin : Coin?

    override func viewDidLoad() {
        super.viewDidLoad()

        CoinData.shared.delegate  = self
        
        view.backgroundColor = UIColor.white
        edgesForExtendedLayout = []
        chart.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: chartHeight)
        
        view.addSubview(chart)
        
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
