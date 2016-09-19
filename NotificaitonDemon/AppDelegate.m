//
//  AppDelegate.m
//  NotificaitonDemon
//
//  Created by quke on 16/8/15.
//  Copyright © 2016年 linjunhou. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworking.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    NSSet *categories = [NSSet setWithObjects:[self creteAcceptButtonCategory],[self creteAcceptButtonCategory1],[self creteResponseCategory], nil];

    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:categories]];
    
    
//    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
//    localNotif.fireDate = [NSDate dateWithTimeIntervalSinceNow:5.f];
//    localNotif.timeZone = [NSTimeZone defaultTimeZone];
//    
//    localNotif.alertBody = @"body";
//    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
//    
//    localNotif.applicationIconBadgeNumber = 1;
//    
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];

    
    return YES;
}


- (UIMutableUserNotificationCategory *)creteAcceptButtonCategory
{
    UIMutableUserNotificationAction *acceptAction = [[UIMutableUserNotificationAction alloc] init];
    acceptAction.identifier = @"accept_button";
    acceptAction.title = @"详情";
//    acceptAction.activationMode = UIUserNotificationActivationModeBackground;
    acceptAction.destructive = NO;
    acceptAction.authenticationRequired = NO;
    
    UIMutableUserNotificationCategory *buttonCategory = [[UIMutableUserNotificationCategory alloc] init];
    buttonCategory.identifier = @"accept_button";
    [buttonCategory setActions:@[acceptAction] forContext:UIUserNotificationActionContextDefault];
    
    return buttonCategory;
}

- (UIMutableUserNotificationCategory *)creteAcceptButtonCategory1
{
    UIMutableUserNotificationAction *acceptAction = [[UIMutableUserNotificationAction alloc] init];
    acceptAction.identifier = @"accept_button1";
    acceptAction.title = @"详情1";
    //    acceptAction.activationMode = UIUserNotificationActivationModeBackground;
    acceptAction.destructive = NO;
    acceptAction.authenticationRequired = NO;
    
    UIMutableUserNotificationCategory *buttonCategory = [[UIMutableUserNotificationCategory alloc] init];
    buttonCategory.identifier = @"accept_button1";
    [buttonCategory setActions:@[acceptAction] forContext:UIUserNotificationActionContextDefault];
    
    return buttonCategory;
}


- (UIMutableUserNotificationCategory *)creteResponseCategory
{
    UIMutableUserNotificationAction *response = [[UIMutableUserNotificationAction alloc] init];
    response.identifier = @"response";
    response.title = @"回复";
    response.behavior = UIUserNotificationActionBehaviorTextInput;
    response.activationMode = UIUserNotificationActivationModeBackground;
    response.destructive = NO;
    response.authenticationRequired = NO;
    
    UIMutableUserNotificationCategory *textCategory = [[UIMutableUserNotificationCategory alloc] init];
    textCategory.identifier = @"responseInput";
    [textCategory setActions:@[response] forContext:UIUserNotificationActionContextDefault];
    return textCategory;
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler
{
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"%@",deviceToken);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler
{
    NSLog(@"%@",userInfo);
    completionHandler();
}

@end
