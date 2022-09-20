//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Artyom Prima on 14.09.2022.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    public lazy var profileHeader: ProfileHeaderView = {
        let view = ProfileHeaderView()
//        self.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705254436, alpha: 1)
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addConstraintsView()
        
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(
            width: UIView.noIntrinsicMetric,
            height: 220
        )
    }
    
    private func addConstraintsView(){
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.profileHeader)
        profileHeader.setNeedsLayout()
        profileHeader.layoutIfNeeded()
        profileHeader.frame.size = profileHeader.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        NSLayoutConstraint.activate([
            // uiview
            profileHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileHeader.widthAnchor.constraint(equalTo: widthAnchor),
            profileHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            profileHeader.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

        ])
        
    }
    
    @objc private func handleTap() {
        self.endEditing(true)
    }
}
extension ProfileViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}


