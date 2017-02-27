//
//  CShareMessage.h
//  Cepheus
//
//  Created by sunny on 2017/2/27.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CepheusSharePlatForm) {
    CepheusSharePlatFormFriendCicle,
    CepheusSharePlatFormWeChatFriend,
    CepheusSharePlatFormSinaWeiBo,
    CepheusSharePlatFormTecentQQ
};

NS_ASSUME_NONNULL_BEGIN
@interface CShareMessage : NSObject

@property (nonatomic ,assign)CepheusSharePlatForm platform;

@property (nonatomic ,copy) NSString *messageTitle;

@property (nonatomic ,copy) NSString *messageDesc;

@property (nonatomic ,copy) NSString *messageUrl;

@property (nonatomic ,strong) id img;
@end
NS_ASSUME_NONNULL_END
