//
//  NTAppDelegate.m
//  HiBeacons
//
//  Created by Nick Toumpelis on 2013-10-06.
//  Copyright (c) 2013 Nick Toumpelis.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NTHiBeaconsDelegate.h"

@implementation NTHiBeaconsDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    return YES;
}

- (void)application:(UIApplication *) application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self sendlocalPush:@"backgroundからのlocalpushです。"];
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //アプリがバックグラウンドに移行した時によばれる
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self sendlocalPush:@"backgroundに移行しました。このままでは正常な動作は保証できません。"];
    NSLog(@"%ld",(long)[UIApplication sharedApplication].applicationIconBadgeNumber);
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self sendlocalPush:@"アプリが終了しました。このままでは正常な動作は保証できません。"];
}

- (void)sendlocalPush:(NSString *)message
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = message;
    notification.alertAction = @"Open";
    notification.applicationIconBadgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber++;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];

}

@end
