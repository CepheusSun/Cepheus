//
//  CepheusManager.m
//  Cepheus
//
//  Created by sunny on 2017/2/27.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "CepheusManager.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"

#import "CepheusMacro.h"
#import "CShareMessage.h"

@implementation CepheusManager

+ (void)share:(CShareMessage *)message complete:(void (^)(BOOL))completeBlock {
    SSDKPlatformType type;
    
    switch (message.platform) {
        case CepheusSharePlatFormFriendCicle:
        {
            type = SSDKPlatformSubTypeWechatTimeline;
            message.messageTitle = message.messageDesc;
        }
            break;
        case CepheusSharePlatFormWeChatFriend:
        {
            type = SSDKPlatformSubTypeWechatSession;
        }
            break;
        case CepheusSharePlatFormSinaWeiBo:
        {
            type = SSDKPlatformTypeSinaWeibo;
            message.messageDesc = [NSString stringWithFormat:@"%@ %@",message.messageDesc,message.messageUrl];
        }
            break;
        case CepheusSharePlatFormTecentQQ:
        {
            type = SSDKPlatformTypeQQ;
        }
            break;
    }
    if (type == SSDKPlatformSubTypeWechatTimeline || type == SSDKPlatformSubTypeWechatSession) {
        if (![WXApi isWXAppInstalled]) {
            //未安装微信
        }
    }
    if (type == SSDKPlatformTypeQQ) {
        if (![QQApiInterface isQQInstalled]) {
            //未安装QQ
        }
    }
    NSMutableDictionary *sharedDic = [NSMutableDictionary dictionary];
    [sharedDic SSDKSetupShareParamsByText:message.messageDesc
                                   images:@[message.img]
                                      url:[NSURL URLWithString:message.messageUrl]
                                    title:message.messageTitle
                                     type:SSDKContentTypeAuto];
    [ShareSDK share:type parameters:sharedDic onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        switch (state) {
            case SSDKResponseStateSuccess:
                if(completeBlock) {
                    completeBlock(YES);
                }else {}
                break;
            case SSDKResponseStateFail:
                if (completeBlock) {
                    completeBlock(NO);
                }else {}
                break;
            default:
                break;
        }
    }];
}

+ (void)configManager {

    [ShareSDK registerApp:SHARESDK_APPKEY
          activePlatforms:@[@(SSDKPlatformSubTypeWechatTimeline),
                            @(SSDKPlatformSubTypeWechatSession),
                            @(SSDKPlatformSubTypeQQFriend),
                            @(SSDKPlatformTypeSinaWeibo)]
                 onImport:^(SSDKPlatformType platformType) {
                     switch (platformType) {
                         case SSDKPlatformTypeWechat:
                         {
                             [ShareSDKConnector connectWeChat:[WXApi class] delegate:self];
                         }
                             break;
                         case SSDKPlatformTypeQQ:
                         {
                             [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                         }
                             break;
                         case SSDKPlatformTypeSinaWeibo:
                         {
                             [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                         }
                             break;
                         default:
                             break;
                     }
                 } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                     switch (platformType) {
                         case SSDKPlatformTypeWechat:
                         {
                             [appInfo SSDKSetupWeChatByAppId:SHARESDK_WECHAT_APPKEY
                                                   appSecret:SHARESDK_WECHAT_APPSECRET];
                         }
                             break;
                         case SSDKPlatformTypeQQ:
                         {
                             [appInfo SSDKSetupQQByAppId:SHARESDK_QQ_APPID
                                                  appKey:SHARESDK_QQ_APPKEY
                                                authType:SSDKAuthTypeBoth];
                         }
                             break;
                         case SSDKPlatformTypeSinaWeibo:
                         {
                             [appInfo SSDKSetupSinaWeiboByAppKey:SHARESDK_SINA_APPKEY
                                                       appSecret:SHARESDK_SINA_APPSECRET
                                                     redirectUri:SHARESDK_SINA_REDIRECTURL
                                                        authType:SSDKAuthTypeBoth];
                         }
                             break;
                         default:
                             break;
                     }
                 }];
}
@end
