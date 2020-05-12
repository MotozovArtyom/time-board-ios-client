//
//  ProfileViewController.swift
//  time-board
//
//  Created by Tianid on 01.05.2020.
//  Copyright © 2020 Tianid. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Propertiec
    private lazy  var presenter: ProfilePresenterProtocol! = {
        return ProfilePresenter()
    }()
    
    private var profileView: ProfileView! {
        guard isViewLoaded else { return nil }
        return (self.view as! ProfileView)
    }
    private let animationDuration = 0.25
    
    //MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter.profileViewController = self
        // Do any additional setup after loading the view.
    }
    
    private func configure() {
        title = "Profile"
        profileView.settingsButtonAction =  { [weak self] in
            self?.presenter.tapButton()
            self?.showToast(message: "Settings button pressed",
                            font: UIFont.systemFont(ofSize: 14, weight: .semibold),
                            toastYmultiplayer: 4,
                            animationDuration: 2,
                            delay: 0.2)
        }
        
    }
    
    override func loadView() {
        self.view = ProfileView(frame: UIScreen.main.bounds)
    }
    
}

extension ProfileViewController: ProfileViewControllerProtocol {
    func setProfileData(email: String, firstName: String, secondName: String) {
        
        UIView.transition(with: profileView.emailLabel,
                          duration: animationDuration,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            self?.profileView.emailLabel.text = email
            }, completion: nil)
        
        UIView.transition(with: profileView.firstNameLabel,
                          duration: animationDuration,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            self?.profileView.firstNameLabel.text = firstName },
                          completion: nil)
        
        UIView.transition(with: profileView.secondNameLabel,
                          duration: animationDuration,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            self?.profileView.secondNameLabel.text = secondName },
                          completion: nil)
        
    }
    
    func changeAvatarViewType() {
        if !(profileView.profileAvatar is UIImageView) {
            
            profileView.profileAvatar.removeFromSuperview()
            profileView.profileAvatar = profileView.chooseAvatarInstanse(imageView: true)
            profileView.addSubview(profileView.profileAvatar)
            
            profileView.configureConstraint()
            
        } else {
            print(false)
        }
    }
}
