//
//  HeadlineViewController.m
//  week3
//
//  Created by Christine Chao on 6/21/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "HeadlineViewController.h"
#import "MenuViewController.h"

@interface HeadlineViewController ()

@property (assign,nonatomic) CGPoint offset;
@property (assign,nonatomic) CGPoint feedOffset;
@property (assign,nonatomic) CGPoint prevTouchPosition;
@property (strong, nonatomic) UIImageView* headlineImageView;
@property (strong, nonatomic) UIImageView* feedImgView;
@property (strong, nonatomic) UIScrollView* feedScrollView;

- (void)onHeadlineDrag:(UIPanGestureRecognizer *)sender;
- (void)onFeedPan:(UIPanGestureRecognizer *)sender;
- (void)onTap:(UITapGestureRecognizer *)sender;

@end

@implementation HeadlineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *headlineImage = [UIImage imageNamed:@"headline"];
    self.headlineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.headlineImageView.image = headlineImage;
    CALayer * layerMod = [self.headlineImageView layer];
    [layerMod setMasksToBounds:YES];
    [layerMod setCornerRadius:4.0];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onHeadlineDrag:)];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    
    self.headlineImageView.userInteractionEnabled = YES;
    
    self.feedScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 315, 320, 253)];
    
    UIImage *feedImg = [UIImage imageNamed:@"news"];
    self.feedImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1444, 253)];
    self.feedImgView.image = feedImg;
    self.feedScrollView.contentSize = self.feedImgView.frame.size;
//    self.feedScrollView.userInteractionEnabled = YES;
    [self.feedScrollView addSubview:self.feedImgView];
    
    
//    UIPanGestureRecognizer *feedPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onFeedPan:)];
    
    [self.headlineImageView addGestureRecognizer:panGestureRecognizer];
    [self.headlineImageView addGestureRecognizer:tapGestureRecognizer];
//    [self.feedScrollView addGestureRecognizer:feedPanGestureRecognizer];
    [self.view addSubview:self.headlineImageView];
    
    [self.headlineImageView addSubview:self.feedScrollView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onHeadlineDrag:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    CGPoint gestureVelocity = [sender velocityInView:self.headlineImageView];
    
    if (sender.state == UIGestureRecognizerStateBegan ) {
        self.prevTouchPosition = [sender locationInView:self.view];
        self.offset = CGPointMake(0, touchPosition.y - self.headlineImageView.center.y);
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"%f ", self.prevTouchPosition.y - touchPosition.y);
        
        if(self.headlineImageView.center.y >= 284) {
            self.headlineImageView.center = CGPointMake(160 , touchPosition.y - self.offset.y);
        } else {
            self.headlineImageView.center = CGPointMake(160 , 283 - (self.prevTouchPosition.y - touchPosition.y) * 0.2);
        }
        
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if(gestureVelocity.y > 0) {
            [UIView animateWithDuration:0.4
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.headlineImageView.center = CGPointMake(160, 808);
                                 
                             } completion:^(BOOL finished) {
            
                             }];
        } else if(gestureVelocity.y < 0) {
            [UIView animateWithDuration:0.4
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.headlineImageView.center = CGPointMake(160, 284);
                                 
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
    }
}

- (void)onFeedPan:(UIPanGestureRecognizer *)sender {
    /*CGPoint touchPosition = [sender locationInView:self.feedImgView];
    
    if (sender.state == UIGestureRecognizerStateBegan ) {
        self.prevTouchPosition = [sender locationInView:self.feedImgView];
        self.feedOffset = CGPointMake(0, touchPosition.y - self.feedImgView.center.y);
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGFloat scale = (self.prevTouchPosition.y - touchPosition.y) / 568 + 1;
        NSLog(@"%f ", scale);
        self.feedScrollView.transform = CGAffineTransformMakeScale(scale,scale);
        self.feedScrollView.contentSize = CGRectMake(0, 568 - self.feedScrollView.frame.size.height, 320, self.feedScrollView.frame.size.height).size;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.feedScrollView.transform = CGAffineTransformMakeScale(1,1);
        } completion:nil];
    }*/
}

- (void)onTap:(UITapGestureRecognizer *)sender {
    NSLog(@"tap");
    if(self.headlineImageView.center.y == 808) {
        [UIView animateWithDuration:0.4
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.headlineImageView.center = CGPointMake(160, 284);
                             
                         } completion:^(BOOL finished) {
                             
                         }];
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
