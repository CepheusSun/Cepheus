//
//  CShareUI.m
//  Cepheus
//
//  Created by sunny on 2017/2/27.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "CShareUI.h"
#import <UIKit/UIKit.h>

#define CEPHEUS_SHAREVIEW_HEIGHT 152

@implementation CShareUI

@end



@interface CShareUICepheus : UIView

+ (CShareUICepheus *)shared;

@end

@implementation CShareUICepheus

+ (CShareUICepheus *)shared {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
        [instance setupUI];
    });
    return instance;
}

- (void)setupUI {
    self.frame = [UIScreen mainScreen].bounds;
    
    
}


UIButton *makeButton(NSString *title ,NSString *iconName){
    
    return nil;
}


@end
