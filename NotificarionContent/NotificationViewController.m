//
//  NotificationViewController.m
//  NotificarionContent
//
//  Created by quke on 16/9/18.
//  Copyright © 2016年 linjunhou. All rights reserved.
//

/*
    UNNotificationExtensionDefaultContentHidden. (Optional)
            The value of this key is a Boolean. When set to true, the system displays only your custom view controller in the notification interface. When set to false, the system displays the default notification content in addition to your view controller’s content. Custom action buttons and the Dismiss button are always displayed, regardless of this setting. If you do not specify this key, the default value is set to false.
 
 */

#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>
#import "UIImageView+WebCache.h"

@interface NotificationViewController () <UNNotificationContentExtension>


@property (nonatomic,strong)UIImageView * imageView;
@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 1.2);
}

- (void)didReceiveNotification:(UNNotification *)notification {
    NSArray * attach = notification.request.content.attachments;
    if([attach count]){
        UNNotificationAttachment * attachMent = [attach firstObject];
        [attachMent.URL startAccessingSecurityScopedResource];
        UIImage * image = [[UIImage alloc] initWithContentsOfFile:attachMent.URL.path];
        self.imageView.image = image;
//        [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://img.taopic.com/uploads/allimg/130711/318756-130G1222R317.jpg"]];
        [attachMent.URL stopAccessingSecurityScopedResource];
        
    }
    
    
}


@end
