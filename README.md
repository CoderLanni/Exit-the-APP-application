# 代码实现退出 APP 应用程序
程序的死亡大致有三种：自然死亡，即无疾而终，通常就是main()中的一个return 0;自杀，当程序发现自己再活下去已经没有任何意义时，通常会选择自杀。当然，这种自杀也是一种请求式的自杀，即请求OS将自己毙掉



### 方法一.
```
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"退!出!" message:@"退出APP" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
    
    [alert show];
```

```
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

```

----------

----------


### 方法二.

```
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

```

----------

----------
[项目 demo 下载,喜欢的朋友请给个 start](https://github.com/CoderLanni/Exit-the-APP-application)