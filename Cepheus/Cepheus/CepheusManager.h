//
//  CepheusManager.h
//  Cepheus
//
//  Created by sunny on 2017/2/27.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CShareMessage;
@interface CepheusManager : NSObject

+ (void)configManager;

+ (void)share:(CShareMessage *)message complete:(void (^)(BOOL isSuccess))completeBlock;
@end
