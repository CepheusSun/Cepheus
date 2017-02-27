//
//  ViewController.m
//  Cepheus
//
//  Created by sunny on 2017/2/27.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "ViewController.h"
#import "Cepheus.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CShareMessage *message = [[CShareMessage alloc] init];
    
    message.platform = CepheusSharePlatFormTecentQQ;
    message.messageTitle = @"CepheusDemo";
    message.messageDesc = @"用Cepheus集成各种三方工具,爽得很,请访问Cepheus博客";
    message.messageUrl = @"CepheusSun.com";
    message.img = @"http://ocg4av0wv.bkt.clouddn.com/IMG_0124.JPG?imageView2/4/w/600";
    
    [CepheusManager share:message complete:^(BOOL isSuccess) {
        NSLog(@"%@",@(isSuccess));
    }];
}

@end
