//
//  ViewController.swift
//  signit
//
//  Created by 홍태희 on 2021/07/20.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {

    @IBAction func kakaoLoginBtn(_ sender: Any) {
        
        //기존 로그인 여부와 상관없이 로그인 요청 : 카카오계정으로 로그인
        UserApi.shared.loginWithKakaoAccount(prompts:[.Login]) {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")

                //do something
                _ = oauthToken

            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

