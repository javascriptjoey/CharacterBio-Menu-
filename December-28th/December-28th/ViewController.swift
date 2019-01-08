//
//  ViewController.swift
//  December-28th
//
//  Created by Joey Essak on 12/28/18.
//  Copyright © 2018 Joey Essak. All rights reserved.
//

import UIKit


extension UIColor {
    static var mainOrange = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
    static var lightOrange = UIColor(red: 255/255, green: 242/255, blue: 179/255, alpha: 1)
}




class ViewController: UIViewController {

    
    
    
    
    // Avoid polluting viewDidLoad
    // {} is refered to as closure, or anon. functions
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Hook_first"))
        //This enables autoLayout for the imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()

        let attributedText = NSMutableAttributedString(string: "Look alive, you swabs! We’ve got him this time, Mr. Smee.", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

        attributedText.append(NSAttributedString(string: "\n\n\nBlast that Peter Pan. If I could only find his hideout, I’d trap him in his lair. ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
    }()
    
// Must always make sure to apply encapsulation principles in your classes
  private  let previousButton: UIButton = {
     let button =  UIButton(type: .system)
    button.setTitle("PREV", for: UIControl.State.normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    return button
    }()
    
    private  let nextButton: UIButton = {
        let button =  UIButton(type: .system)
        button.setTitle("Next Button", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainOrange, for: .normal)
        return button
    }()
    
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainOrange
        pc.pageIndicatorTintColor = .gray
        pc.pageIndicatorTintColor = .lightOrange
        return pc
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // view.addSubview(bearImageView)
      view.addSubview(descriptionTextView)
      setupBottomControls()
      setupLayout()
    }

    
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
    
    
    private func setupLayout(){

        let topImageContainerView = UIView()
 topImageContainerView.backgroundColor = .orange
        view.addSubview(topImageContainerView)
        
        //Enable AutoLayout This property always needs to be set
    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
    topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
 // topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
   // topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
         topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
       
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        
        
        //right anchor must be of negative value in order to display the correct padding
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        

        
        
    }
    
    
    
    
}

