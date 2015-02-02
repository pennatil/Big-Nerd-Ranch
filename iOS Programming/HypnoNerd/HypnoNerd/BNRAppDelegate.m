//
//  BNRAppDelegate.m
//  HypnoNerd
//
//  Created by Lucas Pennati on 02.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
#import "BNRReminderViewController.h"
#import "BNRAlertViewController.h"

@interface BNRAppDelegate () <UIScrollViewDelegate>

@property (nonatomic,strong) BNRHypnosisView * const1;

@end

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    
    bigRect.size.height *= 2.0;
    bigRect.size.width *= 2.0;
    
    UIScrollView *myScrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    [self.window addSubview:myScrollView];
    
    self.const1 = [[BNRHypnosisView alloc]initWithFrame:bigRect];
    
    [myScrollView addSubview:self.const1];
    
    myScrollView.contentSize = bigRect.size;
    
    myScrollView.minimumZoomScale = 1.0;
    myScrollView.maximumZoomScale = 5.0;
    
    myScrollView.delegate = self;
    
    self.const1.center = myScrollView.center;
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    // OLD SOLUTION
    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    BNRHypnosisViewController *hvc = [[BNRHypnosisViewController alloc]init];
//
//
//    BNRReminderViewController *rvc = [[BNRReminderViewController alloc ] init];
//    BNRAlertViewController *avc = [[BNRAlertViewController alloc ] init];
//    
//    UITabBarController * tabBarController = [[UITabBarController alloc]init];
//    tabBarController.viewControllers = @[hvc,rvc,avc];
//    
//    
//    
//    self.window.rootViewController = tabBarController;

    
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"viewForZoomingInScrollView called");
    return self.const1;
}

-(void) scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"end it");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
