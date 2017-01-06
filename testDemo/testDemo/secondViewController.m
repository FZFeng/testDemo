//
//  secondViewController.m
//  testDemo
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 Fabius's Studio. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController (){

    IBOutlet UIView *_imageListView;
    IBOutlet UIScrollView *_imageListScroll;
    
}

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"viewDidLoad_self.view_width:%1.1f",CGRectGetWidth(self.view.frame));

    
    NSLog(@"viewDidLoad_width:%1.1f",CGRectGetWidth(_imageListScroll.frame));

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
}

- (void)viewDidLayoutSubviews{
    NSLog(@"viewWillLayoutSubviews_width:%1.1f",CGRectGetWidth(_imageListScroll.frame));
}

@end
