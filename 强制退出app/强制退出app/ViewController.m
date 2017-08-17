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
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"退!出!" message:@"上腿 APP" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
    
    [alert show];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex ==1){
        
        [self exitApplication];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
