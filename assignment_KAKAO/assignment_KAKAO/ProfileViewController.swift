import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"profile_closeBtn"), for: .normal)
        button.addTarget(self, action:#selector(touchupCloseButton), for:.touchUpInside)
        return button
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"profile_userImg"), for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let chatView = UIView()
    
    private let chatImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profileTalkImg")
        return image
    }()
        
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    private let editProfileView = UIView()
    
    private let editProfileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profile_editImg")
        return image
    }()
        
    private let editProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    private let kakaostoryView = UIView()
    
    private let kakaostoryImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profileStoryImg")
        return image
    }()
        
    private let kakaostoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .gray
        layout()
    }
    
    @objc
    private func touchupCloseButton() {
        self.dismiss(animated:true, completion:nil)
    }
}
    
extension ProfileViewController {
    
    private func layout() {
        [closeButton, profileButton, nameLabel, line, chatView, editProfileView, kakaostoryView].forEach {
            view.addSubview($0)
        }
        
        [chatImage, chatLabel].forEach {
            chatView.addSubview($0)
        }
        
        [editProfileImage, editProfileLabel].forEach {
            editProfileView.addSubview($0)
        }
        [kakaostoryImage, kakaostoryLabel].forEach {
            kakaostoryView.addSubview($0)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-344)
            $0.height.equalTo(14)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(450)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(139)
            $0.height.equalTo(96)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileButton.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(164)
        }
        
        line.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(42)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(0.5)
        }
        
        chatView.snp.makeConstraints {
            $0.top.equalTo(self.line.snp.bottom).offset(12)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide).offset(-90)
            $0.height.equalTo(72)
        }
        
        chatImage.snp.makeConstraints {
            $0.top.equalTo(self.chatView.snp.centerY).offset(-15)
            $0.centerX.equalTo(self.chatView.snp.centerX)
            $0.height.equalTo(17.59)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(self.chatView.snp.centerY).offset(15)
            $0.centerX.equalTo(self.chatView.snp.centerX)
        }
                              
        editProfileView.snp.makeConstraints {
            $0.top.equalTo(self.line.snp.bottom).offset(12)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(72)
        }
        
        editProfileImage.snp.makeConstraints {
            $0.top.equalTo(self.editProfileView.snp.centerY).offset(-15)
            $0.centerX.equalTo(self.editProfileView.snp.centerX)
            $0.height.equalTo(19.29)
        }
        
        editProfileLabel.snp.makeConstraints {
            $0.top.equalTo(self.editProfileView.snp.centerY).offset(15)
            $0.centerX.equalTo(self.editProfileView.snp.centerX)
        }
                              
        kakaostoryView.snp.makeConstraints {
            $0.top.equalTo(self.line.snp.bottom).offset(12)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide).offset(90)
            $0.height.equalTo(72)
        }
        
        kakaostoryImage.snp.makeConstraints {
            $0.top.equalTo(self.kakaostoryView.snp.centerY).offset(-15)
            $0.centerX.equalTo(self.kakaostoryView.snp.centerX)
            $0.height.equalTo(21.58)
        }
        
        kakaostoryLabel.snp.makeConstraints {
            $0.top.equalTo(self.kakaostoryView.snp.centerY).offset(15)
            $0.centerX.equalTo(self.kakaostoryView.snp.centerX)
        }
    }
}
