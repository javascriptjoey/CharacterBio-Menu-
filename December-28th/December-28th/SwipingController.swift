//
//  SwipingController.swift
//  December-28th
//
//  Created by Joey Essak on 1/1/19.
//  Copyright © 2019 Joey Essak. All rights reserved.
//

import UIKit

//struct Page {
//
//    let imageName: String
//    let  headerText: String
//
//
//}
class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {    
 
   let pages = [
    Page(imageName: "Hook_first" , headerText: "Look alive, you swabs! We’ve got him this time, Mr. Smee.", bodyText: "Blast that Peter Pan. If I could only find his hideout, I’d trap him in his lair."),
    Page(imageName: "Witch_second", headerText: "One bite and your dreams will come true", bodyText: "One taste of the Poisoned Apple and the victim’s eyes will close forever in the Sleeping Death."),
    Page(imageName:"puppet_third", headerText :"Now, you see, the world is full of temptations.", bodyText: "Sometimes the wrong things may be right at he wrong time.")
    ]

    
    
    private  let previousButton: UIButton = {
        let button =  UIButton(type: .system)
        button.setTitle("PREV", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
          button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func handlePrevious(){
        
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    private  let nextButton: UIButton = {
        let button =  UIButton(type: .system)
        button.setTitle("Next Button", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainOrange, for: .normal)
           button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    
    
    
    
     lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages =  pages.count
        pc.currentPageIndicatorTintColor = .mainOrange
        pc.pageIndicatorTintColor = .gray
        pc.pageIndicatorTintColor = .lightOrange
        return pc
    }()
    
    

    
    private func setupBottomControls(){
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>){
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
     
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
}
