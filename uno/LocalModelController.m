//
//  LocalModelController.m
//  PageV2
//
//  Created by Angelo Dizon on 9/23/14.
//  Copyright (c) 2014 Unlimited Network of Opportunities. All rights reserved.
//

#import "LocalModelController.h"

#import "LocalDataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface LocalModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation LocalModelController

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //_pageData = [[dateFormatter monthSymbols] copy];
        _pageData = [NSArray arrayWithObjects:@"p001.jpg", @"p002.jpg", @"p003.jpg", @"p004.jpg", @"p005.jpg", @"p006.jpg", @"p007.jpg", @"p008.jpg", @"p009.jpg", @"p010.jpg", @"p011.jpg", @"p012.jpg", @"p013.jpg", @"p014.jpg", @"p015.jpg", nil];
    }
    return self;
}

- (LocalDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    LocalDataViewController *LocalDataViewController = [storyboard instantiateViewControllerWithIdentifier:@"LocalDataViewController"];
    LocalDataViewController.dataObject = self.pageData[index];
    LocalDataViewController.dataImageObject = self.pageData[index];
    
    //NSLog(@"PAGE DATA**** and %@",  LocalDataViewController.dataImageObject);
    return LocalDataViewController;
}

- (NSUInteger)indexOfViewController:(LocalDataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    //NSLog(@"PAGE DATAimageObject**** and %@",  viewController.dataImageObject);
    
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(LocalDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(LocalDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    //imageView.image = [UIImage imageNamed:[_pageData objectAtIndex:indexPath.row]];
    
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
