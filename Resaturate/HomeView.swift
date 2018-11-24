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
    
    private func buildLeftView() {
        addSubview(connectionView)
        addSubview(logoutView)
        addSubview(reLabel)
        
        logoutView.addSubview(logoutLabel)
        connectionView.addSubview(connectionsLabel)
        styleItems()
        placeItems()
    }
    
    func placeItems() {
        connectionView.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH * 0.21, height: ScreenSize.SCREEN_HEIGHT * 0.675)
        logoutView.frame = CGRect(x: 0, y: (ScreenSize.SCREEN_HEIGHT * 0.675) + 33, width: ScreenSize.SCREEN_WIDTH * 0.21, height: ScreenSize.SCREEN_HEIGHT * 0.15)
        
        reLabel.translatesAutoresizingMaskIntoConstraints = false
        reLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        reLabel.topAnchor.constraint(equalTo: logoutView.bottomAnchor, constant: 25).isActive = true
        
        logoutLabel.translatesAutoresizingMaskIntoConstraints = false
        logoutLabel.leadingAnchor.constraint(equalTo: logoutView.leadingAnchor, constant: 2).isActive = true
        logoutLabel.topAnchor.constraint(equalTo: logoutView.topAnchor, constant: 2).isActive = true
        print (logoutView.center)
    }
    func styleItems() {
        connectionView.backgroundColor = .white
        logoutView.backgroundColor = UIColor(hex: "F96969")
        reLabel.text = "Re:"
        reLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        reLabel.textColor = .white
        reLabel.layer.borderWidth = 2
        reLabel.padding = UIEdgeInsets(top: 35, left: 15, bottom: 0, right: 5)
        
        reLabel.layer.borderColor = UIColor.white.cgColor
        
        logoutLabel.numberOfLines = 3
        logoutLabel.text = "LO\nGO\nUT"
        logoutLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
        logoutLabel.textColor = .black
    }
    
    func addTiles() {
        let tiles = [photosView, linksView, notesView]
        var yAxis: CGFloat = 0.0
        for tile in tiles {
            addSubview(tile)
            tile.frame = CGRect(x: ScreenSize.SCREEN_WIDTH * 0.315, y: yAxis, width: ScreenSize.SCREEN_WIDTH - (ScreenSize.SCREEN_WIDTH * 0.315), height: ScreenSize.SCREEN_HEIGHT * 0.315)
            
            yAxis += (ScreenSize.SCREEN_HEIGHT * 0.315) + 33
        }
        addContextToTiles()
    }
    
    
    func addContextToTiles() {
        photosView.backgroundColor = UIColor(hex: "5066E3")
        linksView.backgroundColor = UIColor(hex: "35B498")
        notesView.backgroundColor = UIColor(hex: "FCA07B")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
