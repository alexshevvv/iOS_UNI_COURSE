//
//  ViewController.swift
//  my_first_app
//
//  Created by Алексей  Шевченко on 09.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    let images: [String] = ["img1.jpg", "img2.jpg", "img3.jpg"]  // Замените на реальные имена изображений
    var currentImageIndex: Int = 0
    
    // MARK: - Subviews
    
    private var customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Переключение картинок"
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        button.setImage(UIImage(systemName: "chevron.right", withConfiguration: config), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: config), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var imageNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Введите текст"
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        updateImage()
    }
    
    // MARK: - Methods
    
    @objc
    private func nextButtonTapped() {
        if currentImageIndex < images.count - 1 {
            currentImageIndex += 1
        } else {
            currentImageIndex = 0
        }
        updateImage()
    }
    
    @objc
    private func previousButtonTapped() {
        if currentImageIndex > 0 {
            currentImageIndex -= 1
        } else {
            currentImageIndex = images.count - 1
        }
        updateImage()
    }
    
    private func updateImage() {
        let imageName = images[currentImageIndex]
        imageView.image = UIImage(named: imageName)
        imageNameLabel.text = imageName
    }
    
    private func configureUI() {
        view.backgroundColor = .brown
        
        view.addSubview(customView)
        view.addSubview(label)
        view.addSubview(imageView)
        view.addSubview(imageNameLabel)
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        view.addSubview(textField)
        
        // Setup layout constraints
        NSLayoutConstraint.activate([
            customView.widthAnchor.constraint(equalToConstant: 100),
            customView.heightAnchor.constraint(equalToConstant: 100),
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            // Стрелки и текст названия изображения по бокам
            previousButton.centerYAnchor.constraint(equalTo: imageNameLabel.centerYAnchor),
            previousButton.trailingAnchor.constraint(equalTo: imageNameLabel.leadingAnchor, constant: -100),
            
            imageNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            imageNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.centerYAnchor.constraint(equalTo: imageNameLabel.centerYAnchor),
            nextButton.leadingAnchor.constraint(equalTo: imageNameLabel.trailingAnchor, constant: 100),
            
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 100)
        ])
    }
}

extension MainViewController: UITextFieldDelegate { }



