//
//  AppDelegate.m
//  Cepheus
//
//  Created by sunny on 2017/2/27.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "AppDelegate.h"
#import "Cepheus.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [CepheusManager configManager];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options{
    return YES;
}



@end
