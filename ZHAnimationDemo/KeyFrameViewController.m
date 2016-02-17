//
//  KeyFrameViewCon.m
//  ZHAnimationDemo
//
//  Created by 吴志和 on 16/2/17.
//  Copyright © 2016年 wuzhihe. All rights reserved.
//

#import "KeyFrameViewController.h"

@implementation KeyFrameViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIView *leafView = [[UIView alloc] init];
    leafView.frame = CGRectMake(100, 100, 20, 20);
    leafView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"leaf"].CGImage);
    [self.view addSubview:leafView];
    
    CGPoint leafCenter = leafView.center;
    [UIView animateKeyframesWithDuration:4.0 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            leafView.center = CGPointMake(leafCenter.x + 50, leafCenter.y + 50);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            leafView.center = CGPointMake(leafCenter.x + 50 + 30, leafCenter.y + 50 + 50);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            leafView.center = CGPointMake(leafCenter.x + 50 + 30 + 50, leafCenter.y + 50 + 50 + 30);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            leafView.center = CGPointMake(leafCenter.x + 50 + 30 + 50 + 50, leafCenter.y + 50 + 50 + 30 + 50);
        }];
    } completion:nil];
    
    [UIView animateWithDuration:4.0 animations:^{
        leafView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}

@end
