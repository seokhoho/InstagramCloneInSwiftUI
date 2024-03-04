//
//  LoginView.swift
//  InstagramCloneInSwiftUI
//


import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            Image("Logo", label: Text("InstargramLogo") )
                .padding(.top, 124)
                .padding(.horizontal, 49)
                .padding(.bottom, 39)
            Group {
                TextField("Email or Phone Number", text: $email )
                    .keyboardType(.emailAddress)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 13.5)
                    .background(Color(hexCode: "#FAFAFA"))
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(UIColor.systemGray3), lineWidth: 0.5)
                            
                    )
                    .padding(.bottom, 12)
                
                SecureField("Password", text: $password)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 13.5)
                    .background(Color(hexCode: "#FAFAFA"))
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(UIColor.systemGray3), lineWidth: 0.5)
                    )
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        // 비밀번호 찾기 페이지
                    } label: {
                        Text("Forgot password?")
                            .font(.footnote)
                            .foregroundStyle(Color(hexCode: "#3797EF"))
                    }
                }
                .padding(.top, 19)
                .padding(.bottom, 30)
                
                
                Button {
                    
                    // 로그인 승인 후 메인 페이지로 이동
                    
                } label: {
                    HStack {
                        Spacer()
                        
                        Text("Log in")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(.vertical, 14)
                }
                .background(email.isEmpty || password.isEmpty ?  Color(hexCode: "#9BCBF7") : Color(hexCode: "#3797EF"))
                .cornerRadius(5)
                .padding(.bottom, 37)
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        
                        // 페이스북 로그인 연동 페이지
                        
                    } label: {
                        Image("facebook", label: Text("Facebook Logo"))
                        Text("Log in with Facebook")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(hexCode: "#3797EF"))
                    }
                    Spacer()
                    
                }
                
            }
            .padding(.horizontal, 16)
            
            HStack {
                VStack {
                    Divider()
                }
                
                Text("OR")
                    .fontWeight(.semibold)
                    .padding(.horizontal, 30)
                    .foregroundColor(Color(hexCode: "#999999"))
                
                VStack {
                    Divider()
                }
            }
            .padding(.vertical, 41)
            .padding(.horizontal, 16)
            
            
            HStack {
                Text("Don't have an account?")
                    .foregroundStyle(Color(hexCode: "#999999"))
                NavigationLink {
                    
                    // 회원가입 페이지
                    
                } label: {
                    Text("Sign up.")
                        .foregroundStyle(Color(hexCode: "#3797EF"))
                }
            }
            .font(.system(size: 14))
            
            
        } // NavigationStack
    }
}

#Preview {
    LoginView()
}
