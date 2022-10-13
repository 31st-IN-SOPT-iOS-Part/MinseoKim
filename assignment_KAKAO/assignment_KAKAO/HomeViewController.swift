import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private lazy var containerView = UIScrollView()
    
    private let firstView = UIView() // mainLabel, settingsButton
    private let secondView = UIView() // profileButton
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"settings 1"), for: .normal)
        return button
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"profile_userImg"), for: .normal)
        button.addTarget(self, action: #selector(touchupProfileButton), for:.touchUpInside)
        // addTarget 사용 시 let 대신 lazy var 사용하기 -> 함수를 마지막에 실행하므로 touchUpNextButton이 메모리에 올라와 있지 않아 뜨는 오류를 해결 가능
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        layout()
    }
    
    // 프로필 페이지로 이동 (present)
    private func presentToProfileVC() {
        let ProfileVC = ProfileViewController()
        self.present(ProfileVC, animated:true, completion:nil)
    }

    @objc
    private func touchupProfileButton() {
        presentToProfileVC()
    }
}
    
extension HomeViewController {
    
    private func layout() {
        view.addSubview(containerView)
        [firstView, secondView].forEach {
            containerView.addSubview($0)
        }
        
        [mainLabel, settingsButton].forEach {
            firstView.addSubview($0)
        }
        secondView.addSubview(profileButton)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(self.firstView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(700)
            $0.bottom.equalToSuperview().offset(-45)
        }
        
        mainLabel.snp.makeConstraints {
            $0.leading.equalTo(self.firstView.snp.leading).offset(14)
            $0.trailing.equalTo(self.firstView.snp.trailing).offset(-322)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        settingsButton.snp.makeConstraints {
            $0.leading.equalTo(self.firstView.snp.leading).offset(57)
            $0.trailing.equalTo(self.firstView.snp.trailing).offset(-297)
            $0.height.equalTo(21)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalTo(self.secondView.snp.top).offset(15)
            $0.leading.equalTo(self.secondView.snp.leading).offset(14)
            $0.trailing.equalTo(self.secondView.snp.trailing).offset(-302)
            $0.height.equalTo(58)
        }
    }
}
