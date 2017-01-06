//
//  CatchCrash.h
//  testDemo
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 Fabius's Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatchCrash : NSObject
void uncaughtExceptionHandler(NSException *exception);
@end
