//
//  LoginScreen.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 04/11/22.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
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
        tf.placeholder = "Digite seu Email:"
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
        tf.placeholder = "Digite sua Senha:"
        tf.isSecureTextEntry = true
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        configSuperView()
        
        //constraints - forma nativa
        setUpConstraints()
        
        //constraints - SnapKit
        configLoginLabelConstraint()
        configLogoAppImageViewConstraint()
        configEmailTextFieldConstraint()
        configPasswordTextFieldConstraint()
        configLoginButtonConstraint()
        configRegisterButtonConstraint()
        
        configButtonEnable(false)
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView() {
        self.addSubview(loginLabel)
        self.addSubview(logoAppImageView)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
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
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
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
    //equalTo: basear em determinado elemento
    //constant: me afastar/aproximar do elemento referente(equalTo)
    //equalToConstant: setando um valor fixo para um determinado elemento
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
                        loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
                        loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
                        logoAppImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
                        logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
                        logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
                        logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
            
                        emailTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 20),
                        emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                        emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                        emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
                        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
                        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
                        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
                        passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
                        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
                        loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
                        loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
                        loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
                        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
                        registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
                        registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
                        registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            //
        ])
    }
    
    //MARK: - Constraints com SnapKit (framework que ajuda na parte de constraints)
    //offset = valor positivo
    //inset = valor negativo
    
    func configLoginLabelConstraint() {
//        loginLabel.snp.makeConstraints { make in
//            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
//            make.centerX.equalToSuperview()
//        }
    }
    
    func configLogoAppImageViewConstraint() {
//        logoAppImageView.snp.makeConstraints { make in
//            make.top.equalTo(loginLabel.snp.bottom).offset(20)
//            make.leading.equalToSuperview().offset(60)
//            make.trailing.equalToSuperview().inset(60)
//            make.height.equalTo(200)
//        }
    }
    
    func configEmailTextFieldConstraint() {
//        emailTextField.snp.makeConstraints { make in
//            make.top.equalTo(logoAppImageView.snp.bottom).offset(20)
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
    
    func configLoginButtonConstraint() {
//        loginButton.snp.makeConstraints { make in
//            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
//            make.leading.equalTo(emailTextField.snp.leading)
//            make.trailing.equalTo(emailTextField.snp.trailing)
//            make.height.equalTo(emailTextField.snp.height)
//        }
    }
    
    func configRegisterButtonConstraint() {
//        registerButton.snp.makeConstraints { make in
//            make.top.equalTo(loginButton.snp.bottom).offset(15)
//            make.leading.equalTo(emailTextField.snp.leading)
//            make.trailing.equalTo(emailTextField.snp.trailing)
//            make.height.equalTo(emailTextField.snp.height)
//        }
    }
    
}
