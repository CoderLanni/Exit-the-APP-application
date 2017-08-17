//
//  ViewController.m
//  强制退出app
//
//  Created by ZE KANG on 2017/8/17.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)outAppHandle:(id)sender {
    

//        AppDelegate *app = [UIApplication sharedApplication].delegate;
//        UIWindow *window = app.window;
//        
//        [UIView animateWithDuration:1.0f animations:^{
//            window.alpha = 0;
//            window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
//        } completion:^(BOOL finished) {
//            exit(0);
//          
//           
//        }];
//    
    
//    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"退!出!" message:@"退出APP" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
    
    [alert show];

    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex ==1){
        
//         [self exitApplication];
        
        [self exitApplication1];
        
    }
    
}

-(void)exitApplication{
        
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        
        UIWindow *window = app.window;
        
        [UIView animateWithDuration:1.0f animations:^{
            
            window.alpha = 0;
            
            window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
            
        } completion:^(BOOL finished) {
            
            exit(0);
            
        }];
        
        //exit(0);
        
}
#pragma mark - 第二种方法
- (void)exitApplication1{
    
    [UIView beginAnimations:@"exitApplication" context:nil];
    
    [UIView setAnimationDuration:0.5];
    
    [UIView setAnimationDelegate:self];
    
    // [UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:self.view.window cache:NO];
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:delegate.window cache:NO];
    
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    
    //self.view.window.bounds = CGRectMake(0, 0, 0, 0);
    
    delegate.window.bounds = CGRectMake(0, 0, 0, 0);
    
    [UIView commitAnimations];
    
}
- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    if ([animationID compare:@"exitApplication"] == 0) {
        exit(0);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
