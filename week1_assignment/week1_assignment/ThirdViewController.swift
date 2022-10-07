//
//  ThirdViewController.swift
//  week1_assignment
//
//  Created by 김민서 on 2022/10/06.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let resultLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 200, width: 300, height: 100))
        label.text = "000님 환영합니다"
        label.font = .systemFont(ofSize:17, weight:.semibold)
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 445, width: 350, height: 50))
        button.setTitle("확인", for:.normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for:.normal)
        button.titleLabel?.font = .systemFont(ofSize:17, weight:.semibold)
        button.layer.cornerRadius = 5
        button.addTarget(self, action:#selector(touchupBackButton), for:.touchUpInside)
        return button
    }()
    
    //    var name: String?
    
    // let: 선언 시 처음 입력된 데이터만 저장
    // var: 추가 입력 가능, 마지막에 입력된 데이터 저장
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [resultLabel, backButton]
        components.forEach{
            view.addSubview($0 as! UIView)
            
            //            let components: [UIView] = [nameLabel, backButton]
            //            components.forEach{
            //                view.addSubview($0) 이렇게 해도 됨
        }
    }
    
    //    func dataBind(){
    //        guard let result = self.name else {return}
    //        resultLabel.text = "\(name)님 환영합니다"
    //    }
    
    func dataBind(name:String) {
        resultLabel.text = "\(name)님\n\n 환영합니다"
    }
    
    @objc
    private func touchupBackButton() {
        self.dismiss(animated:true, completion:nil)
    }
}
