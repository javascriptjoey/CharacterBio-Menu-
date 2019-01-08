//
//  PageCell.swift
//  December-28th
//
//  Created by Joey Essak on 1/2/19.
//  Copyright © 2019 Joey Essak. All rights reserved.
//

import UIKit
class PageCell: UICollectionViewCell {
    
    var Page: Page? {
        didSet{
         //   print(Page?.imageName)
            
            guard let unwrappedPage = Page else {return}
            
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            
            
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText) ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
            
        }
    }
    
private    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Hook_first"))
     
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
  private   let descriptionTextView: UITextView = {
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

    
    
    
    
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        setupLayout()
    }
    
    
    private func setupLayout(){
        
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = .orange
        addSubview(topImageContainerView)
        
        //Enable AutoLayout This property always needs to be set
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        // topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        // topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo:leftAnchor, constant: 24).isActive = true


        //right anchor must be of negative value in order to display the correct padding
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
        
        
        
    }
    
    
    
    
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}
