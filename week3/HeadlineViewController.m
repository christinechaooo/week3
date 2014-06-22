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
@property (strong, nonatomic) UIImageView* headlineImageView;

- (void)onHeadlineDrag:(UIPanGestureRecognizer *)sender;
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
    
    UIScrollView *feedScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 315, 320, 253)];
    
    UIImage *feedImg = [UIImage imageNamed:@"news"];
    UIImageView *feedImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1444, 253)];
    feedImgView.image = feedImg;
    feedScrollView.contentSize = feedImgView.frame.size;
    [feedScrollView addSubview:feedImgView];
    
    [self.headlineImageView addGestureRecognizer:panGestureRecognizer];
    [self.headlineImageView addGestureRecognizer:tapGestureRecognizer];

    [self.view addSubview:self.headlineImageView];
    
    [self.headlineImageView addSubview:feedScrollView];
    
    
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
        
        self.offset = CGPointMake(0, touchPosition.y - self.headlineImageView.center.y);
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
//        NSLog(@"%f ", self.headlineImageView.center.y);
        
        if(self.headlineImageView.center.y >= 284) {
            self.headlineImageView.center = CGPointMake(160 , touchPosition.y - self.offset.y);
        } else {
            self.headlineImageView.center = CGPointMake(160 , 283);
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
