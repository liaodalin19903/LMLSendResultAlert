//
//  LMLSendResultAlert.m
//  test07
//
//  Created by 优谱德 on 16/5/25.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#define SCREEN_W CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREEN_H CGRectGetHeight([[UIScreen mainScreen] bounds])

#import "LMLSendResultAlert.h"

@interface LMLSendResultAlert (){
    
 
}


@property (nonatomic, copy) void (^complete)(void);

@end

//static LMLSendResultAlert *alert;

@implementation LMLSendResultAlert
//  failOrSuccess:0失败1成功 popOrDismiss: 0或者nil.不做什么  1.pop  2.dismiss
+ (LMLSendResultAlert *)showSuccessOrFail:(int)failOrSuccess withSuccesString:(NSString *)successStr andFailStr:(NSString *)failStr needPopOrdismiss:(int)popOrDismiss complete:(void(^)(void))complete{
    
    LMLSendResultAlert *alert = [[LMLSendResultAlert alloc] initWithSuccessOrFail:(int)failOrSuccess withSuccesString:(NSString *)successStr andFailStr:(NSString *)failStr needPopOrdismiss:(int)popOrDismiss complete:(void(^)(void))complete];
    
    [alert show];
    
    return alert;
}

- (instancetype)initWithSuccessOrFail:(int)failOrSuccess withSuccesString:(NSString *)successStr andFailStr:(NSString *)failStr needPopOrdismiss:(int)popOrDismiss complete:(void(^)(void))complete {

    if (self = [super init]) {
        
        _complete = complete;
        /* 初始化界面 */
        [self initUIWithSuccessOrFail:(int)failOrSuccess withSuccesString:(NSString *)successStr needPopOrdismiss:(int)popOrDismiss andFailStr:(NSString *)failStr];
    }
    return self;
}

- (void)initUIWithSuccessOrFail:(int)failOrSuccess withSuccesString:(NSString *)successStr needPopOrdismiss:(int)popOrDismiss andFailStr:(NSString *)failStr {
    
    /* 1.白色底部 */
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.frame = CGRectMake(0, 0, SCREEN_W *0.5, SCREEN_W *0.5);
    backView.center = self.center;
    backView.layer.cornerRadius = 4;
    backView.layer.masksToBounds = YES;
    
    [self addSubview:backView];
    
    /* 2.图片 */
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W * 0.25,SCREEN_W * 0.25)];
    /* 3.Label */
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, SCREEN_W * 0.3, 30);
    label.textAlignment = NSTextAlignmentCenter;
    // 失败
    if (failOrSuccess == 0) {
        
        icon.image = [UIImage imageNamed:@"2xjingyan_42"];
        label.text = failStr;
    }
    // 成功
    else {
    
        icon.image = [UIImage imageNamed:@"2xjingyan_38"];
        label.text = successStr;
    }
    
    icon.center = CGPointMake(backView.center.x, backView.center.y - 25);
    label.center = CGPointMake(backView.center.x, backView.center.y + 40);
    [self addSubview:icon];
    [self addSubview:label];
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self hide];
        
        // pop
        if (popOrDismiss == 1) {
            
            _complete();
        }
        // dismiss
        else if (popOrDismiss == 2) {
        
            _complete();
        }
        
    });
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [super touchesBegan:touches withEvent:event];
    
    _complete();
    [self hide];
}

@end
