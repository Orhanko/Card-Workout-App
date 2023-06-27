//
//  ViewController.swift
//  Playing Card Programmatically
//
//  Created by Orhan Pojskic on 26.06.2023..
//

import UIKit

class ViewController: UIViewController {
    
    let cardImageView = UIImageView()
    let stopButton = CWButton(color: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let resetButton = CWButton(color: .systemGreen, title: "Reset", systemImageName: "arrow.clockwise.circle")
    let rulesButton = CWButton(color: .systemBlue, title: "Rules", systemImageName: "list.bullet")
    let nizKarti = Deck.cards
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureUI()
        startTimer()
//        stopButton.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
//        resetButton.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
//        rulesButton.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(randomKarta), userInfo: nil, repeats: true)
    }
    
    
    @objc func randomKarta(){
        cardImageView.image = nizKarti.randomElement()
    }

    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView) // draggind UIImageView na VC u storyboardu
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        stopButton.addTarget(self, action: #selector(stopTapped), for: .touchUpInside)
        view.addSubview(stopButton)
        //stopButton.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.centerYAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 70)
        ])
    }
    
    @objc func stopTapped(){
        timer.invalidate()
        
    }
    
    @objc func resetTapped(){
        timer.invalidate()
        startTimer()
    }
    
    
    
    func configureResetButton(){
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        resetButton.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        view.addSubview(resetButton)
        //resetButton.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.centerYAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 50)
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        //rulesButton.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        rulesButton.addTarget(self, action: #selector(prezentujRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.centerYAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 50)
        ])
        
        
    }
    @objc func prezentujRulesVC(){
        present(RulesViewController(), animated: true)
    }
}

