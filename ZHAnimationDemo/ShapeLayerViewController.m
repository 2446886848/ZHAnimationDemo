//
//  ShapeLayerViewController.m
//  ZHAnimationDemo
//
//  Created by 吴志和 on 16/2/17.
//  Copyright © 2016年 wuzhihe. All rights reserved.
//

#import "ShapeLayerViewController.h"

static NSString *const kContentOffset = @"contentOffset";

@interface ShapeLayerViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) CAShapeLayer *shapeLayer;

@end

@implementation ShapeLayerViewController

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.view.bounds;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor yellowColor].CGColor;
    
    UIBezierPath *layerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(30, 30)];
    
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 250) radius:50 startAngle:0 endAngle:M_PI clockwise:YES];
    [layerPath appendPath:arcPath];
    [layerPath closePath];
    
    [layerPath moveToPoint:CGPointMake(100, 350)];
    [layerPath addQuadCurveToPoint:CGPointMake(200, 350) controlPoint:CGPointMake(150, 250)];
    shapeLayer.path = layerPath.CGPath;
    
    [self.view.layer insertSublayer:shapeLayer atIndex:0];
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 0;
    
    self.shapeLayer = shapeLayer;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.alpha = 0.7;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 2);
    [self.view addSubview:scrollView];
    
    scrollView.delegate = self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= 0 && offsetY <= scrollView.contentSize.height) {
        self.shapeLayer.lineWidth = self.shapeLayer.strokeEnd * 10;
        self.shapeLayer.strokeEnd = offsetY / scrollView.contentSize.height;
    }
    else
    {
        self.shapeLayer.lineWidth = 1;
        self.shapeLayer.strokeEnd = 0;
    }
}

@end
