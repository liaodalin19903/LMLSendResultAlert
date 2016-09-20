//
//  LMLSendResultAlert.h
//  test07
//
//  Created by 优谱德 on 16/5/25.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopWindow.h"

@interface LMLSendResultAlert : PopWindow

// failOrSuccess：0.失败  1. 成功
+ (LMLSendResultAlert *)showSuccessOrFail:(int)failOrSuccess withSuccesString:(NSString *)successStr andFailStr:(NSString *)failStr needPopOrdismiss:(int)popOrDismiss complete:(void(^)(void))complete;

+ (void)hideMe;

@end
