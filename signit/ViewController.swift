//
//  ViewController.swift
//  signit
//
//  Created by 홍태희 on 2021/07/20.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import FBSDKLoginKit

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
        
        //Facebook login button custom
        let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 47, y: 520, width: 295, height: 60)
        loginButton.layer.cornerRadius = 20
        view.addSubview(loginButton)
        
        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller.
        }
    }
}

