//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var shouldShowPlutoSwitch: UISwitch!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        setUpSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func setUpSubViews() {
        // Create Button & it's contraints
        
        let doneButton = UIButton(type: .system) //Set button to blue
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        view.addSubview(doneButton)
        
        let doneButtonTopConstraint = NSLayoutConstraint(item: doneButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 20)
        
        let doneButtonTrailingConsrtraint =  NSLayoutConstraint(item: doneButton,
                                                                attribute: .trailing,
                                                                relatedBy: .equal,
                                                                toItem: view.safeAreaLayoutGuide,
                                                                attribute: .trailing,
                                                                multiplier: 1,
                                                                constant: -20)
        
        NSLayoutConstraint.activate([doneButtonTopConstraint,
                                        doneButtonTrailingConsrtraint])
        
        
        //Label
        
        //Switch
        
        let shouldShowPlutoSwitch = UISwitch()
        shouldShowPlutoSwitch.translatesAutoresizingMaskIntoConstraints = false // Always Set
        shouldShowPlutoSwitch.addTarget(self, action: #selector(changeShouldShowPluto), for: .valueChanged)
        
        view.addSubview(shouldShowPlutoSwitch) //Add to Screen
        
        let switchTopConstraint = shouldShowPlutoSwitch.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 60)
       
        let switchTrailingConstraint = shouldShowPlutoSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        let label = UILabel()
        switchTopConstraint.isActive = true
        switchTrailingConstraint.isActive = true
        
        self.shouldShowPlutoSwitch = shouldShowPlutoSwitch
        label.text = "Is pluto a planet"
        view.addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: shouldShowPlutoSwitch.leadingAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: shouldShowPlutoSwitch.centerYAnchor).isActive = true
        
    }
    
    
    // MARK: - Action Handlers
    
   @objc func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
}
