import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면\n 이메일 또는 전화번호로 로그인해 주세요."
        label.font = .systemFont(ofSize:15, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.textColor = .systemGray3
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.textColor = .systemGray3
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(touchupLoginButton), for:.touchUpInside)
        // addTarget 사용 시 let 대신 lazy var 사용하기 -> 함수를 마지막에 실행하므로 touchUpNextButton이 메모리에 올라와 있지 않아 뜨는 오류를 해결 가능
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오 계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(touchupsignUpButton), for:.touchUpInside)
        return button
    }()
    
    private lazy var findButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        layout()
    }
    // 회원가입 페이지로 이동 (push)
    private func pushTosignUpVC() {
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated:true)
    }
    
    // 로그인 완료 페이지로 이동 (present)
    private func presentToWelcomeVC() {
        let WelcomeVC = WelcomeViewController()
        WelcomeVC.modalPresentationStyle = .formSheet
        
        // WelcomeVC.name = idTextField.text
        // WelcomeVC.dataBind()
        
        if let id = idTextField.text {
            WelcomeVC.dataBind(name:id)
        }
        self.present(WelcomeVC, animated:true, completion:nil)
    }
    
    
    @objc
    private func touchupsignUpButton() {
        pushTosignUpVC()
    }
    
    @objc
    private func touchupLoginButton() {
        presentToWelcomeVC()
    }
}
    
extension LoginViewController {
    
    private func layout() {
        [mainLabel, subLabel, idTextField, passwordTextField, loginButton, signUpButton, findButton].forEach {
            view.addSubview($0)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(89)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(60)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(self.subLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(self.idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(35)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(self.loginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
        
        findButton.snp.makeConstraints {
            $0.top.equalTo(self.signUpButton.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(29)
        }
    }
}
