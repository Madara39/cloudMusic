//
//  SceneDelegate.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/14.
//

#import "SceneDelegate.h"
#import "discoveryPageViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
     
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
     
    discoveryPageViewController *discoverVc1 = [[discoveryPageViewController alloc] init];
    discoverVc1.tabBarItem.title = @"发现";
    discoverVc1.tabBarItem.image = [UIImage imageNamed:@"发现"];
    UIImage * imageDiscver = [UIImage imageNamed:@"发现-红"];
    imageDiscver = [imageDiscver imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    discoverVc1.tabBarItem.selectedImage = imageDiscver;
    NSMutableDictionary * attrsDiscver = [NSMutableDictionary dictionary];
    attrsDiscver[NSFontAttributeName] = [UIFont systemFontOfSize:10.0];
    attrsDiscver[NSForegroundColorAttributeName] = [UIColor redColor];
    [discoverVc1.tabBarItem setTitleTextAttributes:attrsDiscver forState:UIControlStateNormal];
     
    UIViewController *podcastVc2 = [[UIViewController alloc] init];
    podcastVc2.tabBarItem.title = @"播客";
    podcastVc2.tabBarItem.image = [UIImage imageNamed:@"播客"];
    UIImage * imagePodcast = [UIImage imageNamed:@"播客-红"];
    imagePodcast = [imagePodcast imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    podcastVc2.tabBarItem.selectedImage = imagePodcast;
    [podcastVc2.tabBarItem setTitleTextAttributes:attrsDiscver forState:UIControlStateNormal];
    
    
     
    UIViewController *myVc3 = [[UIViewController alloc] init];
    myVc3.tabBarItem.title = @"我的";
    myVc3.tabBarItem.image = [UIImage imageNamed:@"我的"];
    UIImage * imageMy = [UIImage imageNamed:@"我的-红"];
    imageMy = [imageMy imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myVc3.tabBarItem.selectedImage = imageMy;
    [myVc3.tabBarItem setTitleTextAttributes:attrsDiscver forState:UIControlStateNormal];
     
    UIViewController *followVc4 = [[UIViewController alloc] init];
    followVc4.tabBarItem.title = @"关注";
    followVc4.tabBarItem.image = [UIImage imageNamed:@"关注"];
    UIImage * imageFollow = [UIImage imageNamed:@"关注-红"];
    imageFollow = [imageFollow imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    followVc4.tabBarItem.selectedImage = imageFollow;
    [followVc4.tabBarItem setTitleTextAttributes:attrsDiscver forState:UIControlStateNormal];
    
    UIViewController *cloudTownVc5 = [[UIViewController alloc] init];
    cloudTownVc5.tabBarItem.title = @"云村";
    cloudTownVc5.tabBarItem.image = [UIImage imageNamed:@"云村"];
    UIImage * imageCloudTown = [UIImage imageNamed:@"云村-红"];
    imageCloudTown = [imageCloudTown imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cloudTownVc5.tabBarItem.selectedImage = imageCloudTown;
    [cloudTownVc5.tabBarItem setTitleTextAttributes:attrsDiscver forState:UIControlStateNormal];
     
    [tabBarController setViewControllers: @[discoverVc1, podcastVc2, myVc3, followVc4, cloudTownVc5]];
     
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
         
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
