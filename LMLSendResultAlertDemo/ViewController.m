//
//  ViewController.m
//  LMLSendResultAlertDemo
//
//  Created by 优谱德 on 16/9/20.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "ViewController.h"
#import "LMLSendResultAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}

- (void)initUI {
    
    
}

- (IBAction)respondsToMe:(UIButton *)sender {
    
    // 传1 和 成功str
    [LMLSendResultAlert showSuccessOrFail:1 withSuccesString:@"点击成功" andFailStr:@"" needPopOrdismiss:0 complete:^{
        
        NSLog(@"点击成功回调");
        
    }];
}

- (IBAction)respondsToFail:(UIButton *)sender {
    
    
    [LMLSendResultAlert showSuccessOrFail:0 withSuccesString:@"" andFailStr:@"点击失败" needPopOrdismiss:0 complete:^{
        
        NSLog(@"点击失败回调");
        
    }];
}


@end
