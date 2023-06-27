//
//  CWButton.swift
//  Playing Card Programmatically
//
//  Created by Orhan Pojskic on 26.06.2023..
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame) // nasljedjivanje svih konfiguracija koje je Apple ugradio za UIButton
        
    }
    
    required init?(coder: NSCoder) { // funkcija koja pokriva slucaj ako dugme inicijaliuzujemo preko sotryboarda
        fatalError("init(coder:) has not been implemented")
    }
    
    init(color: UIColor, title: String, systemImageName: String){
        super.init(frame: .zero) // .zero -> 0 za height width i ostale velicine
        // kada god radimo init moramo postaviti super.init
        configuration = .tinted()
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
        configuration?.title = title
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 4
        //titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false // koristi auto layout
    }
    
    
    
    
    }
