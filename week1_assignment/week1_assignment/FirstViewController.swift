//
//  FirstViewController.swift
//  week1_assignment
//
//  Created by 김민서 on 2022/10/06.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel(frame:CGRect(x:40, y:110, width:300, height:40))
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel(frame:CGRect(x:40, y:155, width:300, height:60))
        label.text = "사용하던 카카오계정이 있다면\n 이메일 또는 전화번호로 로그인해 주세요."
        label.font = .systemFont(ofSize:15)
        label.textColor = .lightGray
        label.numberOfLines = 2
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x:20, y:390, width:350, height:45))
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(touchupLoginButton), for:.touchUpInside)
        // addTarget 사용 시 let 대신 lazy var 사용하기 -> 함수를 마지막에 실행하므로 touchUpNextButton이 메모리에 올라와 있지 않아 뜨는 오류를 해결 가능
        return button
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton(frame: CGRect(x:20, y:445, width:350, height:45))
        button.setTitle("새로운 카카오 계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(touchupSignupButton), for:.touchUpInside)
        return button
    }()
    
    private lazy var findButton: UIButton = {
        let button = UIButton(frame: CGRect(x:20, y:500, width:350, height:30))
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [mainLabel, subLabel, idTextField, passwordTextField, loginButton, signupButton, findButton]
        // UI components를 담을 배열
        // Any이므로 무엇이 올지 모름
        components.forEach {
            view.addSubview($0 as! UIView) // 각각의 components를 view에 추가
            // Any로 해두었기 때문에 오류 방지를 위해서 UIView 타입으로 바꾸어줌
            // UIView 타입만 올 수 있음 -> as!이므로 다른 타입이 오게 되면 앱이 종료됨
            // forEach의 $0: components의 요소들이 $0의 자리에 순서대로 들어감
        }
    }
    
    // 회원가입 페이지로 이동 (push)
    private func pushToSecondVC() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated:true)
    }
    
    // 로그인 완료 페이지로 이동 (present)
    private func presentToThirdVC() {
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .formSheet
        
        // thirdVC.name = idTextField.text
        // thirdVC.dataBind()
        
        if let id = idTextField.text {
            thirdVC.dataBind(name:id)
        }
        self.present(thirdVC, animated:true, completion:nil)
    }
    
    
    @objc
    private func touchupSignupButton() {
        pushToSecondVC()
    }
    
    @objc
    private func touchupLoginButton() {
        presentToThirdVC()
    }
}
