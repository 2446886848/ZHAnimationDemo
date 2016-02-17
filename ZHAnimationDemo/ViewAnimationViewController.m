//
//  ViewAnimationViewController.m
//  ZHAnimationDemo
//
//  Created by 吴志和 on 16/2/17.
//  Copyright © 2016年 wuzhihe. All rights reserved.
//

#import "ViewAnimationViewController.h"

@interface ViewAnimationViewController ()

@property (nonatomic, weak) IBOutlet UILabel *firlsLabel;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionRepeat |UIViewAnimationOptionAutoreverse animations:^{
            self.firlsLabel.center = CGPointMake(250, self.firlsLabel.center.y);
        } completion:nil];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionWithView:self.imageView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            self.imageView.image = [UIImage imageNamed:@"bbb.jpg"];
        } completion:nil];
    });
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(50, 250, 50, 50);
    [self.view addSubview:button];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
            button.center = CGPointMake(button.center.x + 200, button.center.y);
        } completion:nil];
    });
}

@end
