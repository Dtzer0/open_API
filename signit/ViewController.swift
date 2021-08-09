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
import GoogleSignIn
import NaverThirdPartyLogin
import Alamofire

class ViewController: UIViewController, NaverThirdPartyLoginConnectionDelegate {
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    // 로그인에 성공한 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success login")
        //getInfo()
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        //loginInstance?.accessToken
    }
    
    // 로그아웃
    func oauth20ConnectionDidFinishDeleteToken() {
        print("log out")
    }
    
    // 모든 error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error = \(error.localizedDescription)")
    }
    
    @IBAction func naverLoginBtn(_ sender: Any) {
        //네이버 로그인
        loginInstance?.requestThirdPartyLogin()
        // 로그아웃 :  loginInstance?.requestDeleteToken()
        
        //(7/26) 실행은 됨. 하지만 로그인을 성공하면 "주소가 잘못되었기 때문에 safari에서 페이지를 열 수 없습니다." 가 뜸.
    }
    

    @IBAction func googleLoginBtn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
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
        
        loginInstance?.delegate = self
        
        //Facebook login button custom
        let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 47, y: 625, width: 295, height: 60)
        loginButton.layer.cornerRadius = 20
        view.addSubview(loginButton)
        
        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller.
        }
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
}

