//
//  IntakeViewController.swift
//  PuppyMode
//
//  Created by 김미주 on 24/01/2025.
//

import UIKit

class IntakeViewController: UIViewController {
    private let intakeView = IntakeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = intakeView
        
        setAction()
    }
    
    // MARK: - function
    private func setAction() {
        intakeView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        intakeView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - actions
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func addButtonTapped() {
        print("Add button tapped with value: \(intakeView.currentValue)")

        let completionVC = RecordCompleteViewController()
        navigationController?.pushViewController(completionVC, animated: true)
    }
}

class DialSlider: UISlider {
    private let dialBackground = UIImageView() // Background image that rotates
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDialBackground()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDialBackground()
    }
    
    private func setupDialBackground() {
        // Add the dial background behind the slider
        dialBackground.image = UIImage(named: "dial_background") // Replace with your dial image
        dialBackground.contentMode = .scaleAspectFill
        addSubview(dialBackground)
        sendSubviewToBack(dialBackground)
        
        // Position and size the background
        dialBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dialBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            dialBackground.centerYAnchor.constraint(equalTo: centerYAnchor),
            dialBackground.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.5), // Adjust size as needed
            dialBackground.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 3) // Adjust size as needed
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateDialRotation()
    }
    
    // Update the rotation of the background based on the slider's value
    private func updateDialRotation() {
        let rotationAngle = CGFloat((value - minimumValue) / (maximumValue - minimumValue)) * 360.0
        dialBackground.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi / 180)
    }
    
    // Track changes in slider value and update rotation
    override func setValue(_ value: Float, animated: Bool) {
        super.setValue(value, animated: animated)
        UIView.animate(withDuration: animated ? 0.2 : 0.0) { [weak self] in
            self?.updateDialRotation()
        }
    }
}
