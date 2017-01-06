//
//  cSystemPlist.h
//  BaseModel
//
//  Created by apple on 15/9/1.
//  Copyright (c) 2015年 Fabius's Studio. All rights reserved.
//  Info:系统全局信息类 如登录信息

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PublicFunc.h"

#import "FZNetworkHelper.h"

@interface SystemPlist : NSObject

//创建信息 登录用户信息的plist 和头像logo文件夹HeadLogo
+(void)CreateSystemPlist;

//初始化信息 登录用户信息的plist 清空头像logo文件夹HeadLogo文件
+(void)InitSystemPlist;

//systemPlist文件是否存在
+(BOOL)ExistSystemPlist;

//isLogin
+(void)SetLogin:(BOOL)pbLogin;
+(BOOL)GetLogin;


//url
+(void)SetUrl:(NSString*)pUrl;
+(NSString*)GetUrl;

//Dishurl
+(void)SetDishUrl:(NSString*)pUrl;
+(NSString*)GetDishUrl;

//DisSethurl
+(void)SetDisSetUrl:(NSString*)pUrl;
+(NSString*)GetDisSetUrl;

//CompanyNum
+(void)SetCompanyNum:(NSString*)pCompanyNum;
+(NSString*)GetCompanyNum;

//user
+(void)SetLoadUser:(NSString*)pLoadUser;
+(NSString*)GetLoadUser;

//pwd
+(void)SetLoadPwd:(NSString*)pLoadPwd;
+(NSString*)GetLoadPwd;

//MemberName
+(void)SetMemberName:(NSString*)pMemberName;
+(NSString*)GetMemberName;

//MemberCode
+(void)SetMemberCode:(NSString*)pMemberCode;
+(NSString*)GetMemberCode;

//departmentName
+(void)SetDepartmentName:(NSString*)pDepartmentName;
+(NSString*)GetDepartmentName;


//保存头像到本地
+(void)SaveHeadLogoToLocalWithUrl:(NSString*)psHeadLogoUrl;
+(void)SaveHeadLogoToLocalWithData:(NSData*)pData;


//获取软件使用期限
+ (void)getLoginInfoWithCompanyID:(NSString*)companyID;

@end
