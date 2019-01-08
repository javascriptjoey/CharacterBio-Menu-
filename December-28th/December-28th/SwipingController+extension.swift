//
//  SwipingController+extension.swift
//  December-28th
//
//  Created by Joey Essak on 1/7/19.
//  Copyright © 2019 Joey Essak. All rights reserved.
//

import UIKit

extension SwipingController{
    
    
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }else{
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0 )
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
            
            
        }) { (_) in
            
        }
        
    }

}
