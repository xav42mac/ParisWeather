//
//  HomeViewController+UIScrollView.swift
//  ParisWeather
//
//  Created by Xav Mac on 13/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - HomeViewController -> UIScrollView
extension HomeViewController : UIScrollViewDelegate {
    
    //MARK:- For Display the page number in page control of collection view cell
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.dayForecastCollectionView.contentOffset, size: self.dayForecastCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.dayForecastCollectionView.indexPathForItem(at: visiblePoint) {
            self.dayPageControl.currentPage = visibleIndexPath.row
        }
    }
}
