//
//  RegisterScreen.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 04/11/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu Email"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua Senha"
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        configSuperView()
        
        //constraints - forma nativa
        setUpConstraints()
        
        //constraint - SnapKit
        configImageAddUserConstraint()
        configBackButtonConstraint()
        configEmailTextFieldConstraint()
        configPasswordTextFieldConstraint()
        configRegisterButtonConstraint()
        
        configButtonEnable(false)
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView() {
        self.addSubview(backButton)
        self.addSubview(imageAddUser)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validateTextFields() {
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            configButtonEnable(true)
        }else {
            configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool) {
        if enable {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        }else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints de forma nativa
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            imageAddUser.heightAnchor.constraint(equalToConstant: 150),

            backButton.topAnchor.constraint(equalTo: imageAddUser.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            emailTextField.topAnchor.constraint(equalTo: imageAddUser.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        
        ])
    }
    
    //MARK: - Constraints com SnapKit
    
    func configImageAddUserConstraint() {
//        imageAddUser.snp.makeConstraints { make in
//            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
//            make.centerX.equalToSuperview()
//            make.height.width.equalTo(150)
//        }
    }
    
    func configBackButtonConstraint() {
//        backButton.snp.makeConstraints { make in
//            make.top.equalTo(imageAddUser.snp.top)
//            make.leading.equalToSuperview().offset(20)
//        }
    }
    
    func configEmailTextFieldConstraint() {
//        emailTextField.snp.makeConstraints { make in
//            make.top.equalTo(imageAddUser.snp.bottom).offset(10)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().inset(20)
//            make.height.equalTo(40)
//        }
    }
    
    func configPasswordTextFieldConstraint() {
//        passwordTextField.snp.makeConstraints { make in
//            make.top.equalTo(emailTextField.snp.bottom).offset(15)
//            make.leading.equalTo(emailTextField.snp.leading)
//            make.trailing.equalTo(emailTextField.snp.trailing)
//            make.height.equalTo(emailTextField.snp.height)
//        }
    }
    
    func configRegisterButtonConstraint() {
//        registerButton.snp.makeConstraints { make in
//            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
//            make.leading.equalTo(emailTextField.snp.leading)
//            make.trailing.equalTo(emailTextField.snp.trailing)
//            make.height.equalTo(emailTextField.snp.height)
//        }
    }
    
    
 

}
