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

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)application:(UIApplication *) application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"backgroundからのlocalpushです。";
    notification.alertAction = @"Open";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"backgroundに移行しました。このままでは正常な動作は保証できません。";
    notification.alertAction = @"Open";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
//    UILocalNotification *notification = [[UILocalNotification alloc] init];
//    notification.timeZone = [NSTimeZone defaultTimeZone];
//    notification.alertBody = @"終了するとあの子の通知も届きません。今すぐ起動してください。";
//    notification.alertAction = @"Open";
//    notification.soundName = UILocalNotificationDefaultSoundName;
//    
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
