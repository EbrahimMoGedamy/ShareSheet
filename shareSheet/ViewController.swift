//
//  ViewController.swift
//  shareSheet
//
//  Created by Ebrahim  Mo Gedamy on 10/13/20.
//

import UIKit

class ViewController: UIViewController {

    private let button : UIButton = {
        let button = UIButton()
        button.setTitle("Pop up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(didBuTapped(_:)), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
        view.addSubview(button)
        
    }
    
    @objc func didBuTapped (_ sender :  UIButton){
        
        guard let image = UIImage(systemName: "bell") , let url = URL(string: "https://www.google.com") else { return }
        let shareSheetVC = UIActivityViewController(activityItems: [image,url], applicationActivities: nil)
        
        /// to share in iPad
        shareSheetVC.popoverPresentationController?.sourceView = sender
        shareSheetVC.popoverPresentationController?.sourceRect = sender.frame
        
        present(shareSheetVC, animated: true)
    }

}

