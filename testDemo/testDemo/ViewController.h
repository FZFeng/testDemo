//
//  ViewController.h
//  testDemo
//
//  Created by apple on 15/12/23.
//  Copyright © 2015年 Fabius's Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZNetworkHelper.h"
#import "FZCommonUIView.h"

@interface ViewController : UIViewController{

    IBOutlet UIImageView *myImage;
    
    IBOutlet UIButton *btnSetImage;
}
- (IBAction)didBtnRun:(id)sender;


@end

