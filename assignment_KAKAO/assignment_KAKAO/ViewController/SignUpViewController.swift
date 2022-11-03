//
//  signUpViewController.swift
//  assignment_KAKAO
//
//  Created by 김민서 on 2022/10/13.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel(frame:CGRect(x:40, y:110, width:300, height:40))
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20, y:270, width:350, height:40))
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20, y:320, width:350, height:40))
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private let confirmTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20, y:370, width:350, height:40))
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호 확인"
        return textField
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(frame: CGRect(x:20, y:445, width:350, height:45))
        button.setTitle("새로운 카카오 계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(touchupsignUpButton), for:.touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        layout()
    }
    
    // 로그인 완료 페이지로 이동 (present)
    private func presentToWelcomeVC() {
        let WelcomeVC = WelcomeViewController()
        WelcomeVC.modalPresentationStyle = .formSheet
        
        if let id = idTextField.text {
            WelcomeVC.dataBind(name:id)
        }
        self.present(WelcomeVC, animated:true, completion:nil)
    }
        
    
    @objc
    private func touchupsignUpButton() {
        presentToWelcomeVC()
    }
}

extension SignUpViewController {
    
    private func layout() {
        [mainLabel, idTextField, passwordTextField, confirmTextField, signUpButton].forEach {
            view.addSubview($0)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(89)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(116)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(self.idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        
        confirmTextField.snp.makeConstraints {
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
            
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(self.confirmTextField.snp.bottom).offset(26)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
    }
}
