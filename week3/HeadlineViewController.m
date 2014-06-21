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

- (void)onHeadlineDrag:(UIPanGestureRecognizer *)sender;

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
    UIImageView *headlineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    headlineImageView.image = headlineImage;
    
    
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onHeadlineDrag:)];
    
    [self.view addSubview:headlineImageView];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onHeadlineDrag:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    
    
    
    
    if (sender.state == UIGestureRecognizerStateBegan ) {
        
//        NSLog(@"Pan started! %f %f", touchPosition.x, touchPosition.y);
        
        self.offset = CGPointMake(0, touchPosition.y - self.view.center.y);
        
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
//        NSLog(@"Pan moved %f %f", touchPosition.x + self.offset.x , touchPosition.y + self.offset.y);
        
        
        NSLog(@"%f %f", touchPosition.x, touchPosition.y);
        self.view.center = CGPointMake(160 , touchPosition.y + self.offset.y);
        
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
