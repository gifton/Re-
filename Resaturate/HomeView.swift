//
//  HomeView.swift
//  Resaturate
//
//  Created by Dev on 11/23/18.
//  Copyright © 2018 Wesaturate. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        buildLeftView()
        addTiles()
    }
    
    let connectionView = UIView()
    let logoutView = UIView()
    let photosView = UIView()
    let linksView = UIView()
    let notesView = UIView()
    let reLabel = UILabelPadding()
    let logoutLabel = UILabel()
    let connectionsLabel = UILabel()
    
    let linksLabel = UILabel()
    
    let noteOval = UIView()
    let noteImage = UIImageView()
    let noteLabel = UILabel()
    
    let photoBar = UIView()
    let photoLabel = UILabel()
    let newPhotoButton = UIButton()
    
    private func buildLeftView() {
        addSubview(connectionView)
        addSubview(logoutView)
        addSubview(reLabel)
        
        logoutView.addSubview(logoutLabel)
        connectionView.addSubview(connectionsLabel)
        styleLeftItems()
        placeLeftItems()
    }
    
    func placeLeftItems() {
        //views
        connectionView.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH * 0.21, height: ScreenSize.SCREEN_HEIGHT * 0.675)
        logoutView.frame = CGRect(x: 0, y: (ScreenSize.SCREEN_HEIGHT * 0.675) + 33.5, width: ScreenSize.SCREEN_WIDTH * 0.21, height: ScreenSize.SCREEN_HEIGHT * 0.15)
        
        //labels
        reLabel.translatesAutoresizingMaskIntoConstraints = false
        logoutLabel.translatesAutoresizingMaskIntoConstraints = false
        connectionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        logoutLabel.setAnchor(top: logoutView.topAnchor, leading: logoutView.leadingAnchor, bottom: logoutView.bottomAnchor, trailing: logoutView.trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
        
        connectionsLabel.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 2))
        NSLayoutConstraint.activate ([
            reLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            reLabel.topAnchor.constraint(equalTo: logoutView.bottomAnchor, constant: 25),
            connectionsLabel.centerXAnchor.constraint(equalTo: connectionView.centerXAnchor, constant: 0),
            connectionsLabel.centerYAnchor.constraint(equalTo: connectionView.centerYAnchor, constant: 100),
        ])
    }
    func styleLeftItems() {
        connectionView.backgroundColor = .white
        logoutView.backgroundColor = UIColor(hex: "F96969")
        reLabel.text = " Re:"
        reLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        reLabel.textColor = .white
        reLabel.layer.borderWidth = 2
        reLabel.padding = UIEdgeInsets(top: 35, left: 15, bottom: 0, right: 5)
        
        reLabel.layer.borderColor = UIColor.white.cgColor
        
        logoutLabel.numberOfLines = 3
        logoutLabel.text = "LO\nGO\nUT"
        logoutLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        logoutLabel.textColor = .black
        logoutLabel.textAlignment = .center
        
        connectionsLabel.text = "C O N N E C T I O N S"
        connectionsLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        connectionsLabel.textColor = .black
    }
    
    func addTiles() {
        let tiles = [photosView, linksView, notesView]
        var yAxis: CGFloat = 0.0
        for tile in tiles {
            addSubview(tile)
            tile.frame = CGRect(x: ScreenSize.SCREEN_WIDTH * 0.315, y: yAxis, width: ScreenSize.SCREEN_WIDTH - (ScreenSize.SCREEN_WIDTH * 0.315), height: ScreenSize.SCREEN_HEIGHT * 0.315)
            
            yAxis += (ScreenSize.SCREEN_HEIGHT * 0.315) + 34
        }
        styleTiles()
        setupLinks()
        setupNotes()
        setupPhotos()
    }
    
    
    fileprivate func styleTiles() {
        photosView.backgroundColor = UIColor(hex: "5066E3")
        linksView.backgroundColor = UIColor(hex: "35B498")
        notesView.backgroundColor = UIColor(hex: "FCA07B")
        
        linksLabel.text = "LINKS"
        linksLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        linksLabel.textColor = .white
        
        noteImage.image = .random()
        noteOval.backgroundColor = .white
        noteLabel.textAlignment = .center
        noteLabel.text = "NOTES"
        noteLabel.font = UIFont(name: "HelveticaNeue-Bold", size: fontSize.xXLarge.rawValue)
        
        photoBar.setHeightWidth(width: 235, height: 33)
        photoBar.backgroundColor = .black
        photoLabel.text = "Photos"
        photoLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 70)
        photoLabel.textColor = .white
        newPhotoButton.setHeightWidth(width: 235, height: 33)
        newPhotoButton.backgroundColor = .white
        newPhotoButton.setTitle("New", for: .normal)
        
    }
    fileprivate func setupNotes() {
        let ovalRadii: CGFloat = 75
        notesView.addSubview(noteOval)
        
        noteOval.makeCircle(size: ovalRadii * 2.0)
        
        noteOval.frame = CGRect(x: (notesView.frame.width / 2) - ovalRadii, y: (photosView.frame.height / 2 - ovalRadii - 25), width: ovalRadii * 2.0, height: ovalRadii * 2.0)
        
        noteOval.addSubview(noteImage)
        noteOval.addSubview(noteLabel)
        noteImage.frame = CGRect(x: 0, y: 0, width: ovalRadii * 2, height: ovalRadii)
        noteImage.layer.masksToBounds = true
        noteLabel.frame = CGRect(x: 0, y: 75, width: ovalRadii * 2.0, height: ovalRadii)
    }
    
    fileprivate func setupLinks() {
        let linkImg = UIImage(named: "airplane")
        let linkViewSize = linksView.frame
        var startingX: CGFloat = 0.0
        var startingY: CGFloat = 150
        let numberOfPlanes: CGFloat = linkViewSize.width / 25
        
        func addPlanes() {
            var counter = 0
            while counter < 2 {
                for _ in stride(from: 0, to: numberOfPlanes + 1, by: 1) {
                    let img: UIImageView = {
                        let img = UIImageView()
                        img.image = linkImg
                        img.contentMode = .scaleToFill
                        
                        return img
                    }()
                    linksView.addSubview(img)
                    img.frame = CGRect(x: startingX, y: startingY, width: 25, height: 20)
                    startingX += 30
                }
                counter += 1
                startingX = 0
                startingY += 45
            }
        }
        addPlanes()
        linksView.addSubview(linksLabel)
        linksLabel.translatesAutoresizingMaskIntoConstraints = false
        linksLabel.centerYAnchor.constraint(equalTo: linksView.centerYAnchor, constant: 0).isActive = true
        linksLabel.centerXAnchor.constraint(equalTo: linksView.centerXAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupPhotos() {
        let views = [photoBar, photoLabel, newPhotoButton]
        var startingY: CGFloat = 50.0
        for view in views {
            photosView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            if view === photoLabel {
                view.centerXAnchor.constraint(equalTo: photoBar.centerXAnchor).isActive = true
                view.topAnchor.constraint(equalTo: photosView.topAnchor, constant: startingY).isActive = true
                continue
            }
            view.centerXAnchor.constraint(equalTo: photosView.centerXAnchor).isActive = true
            view.topAnchor.constraint(equalTo: photosView.topAnchor, constant: startingY).isActive = true
            
            print(view.frame)
            
            startingY += 50
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
