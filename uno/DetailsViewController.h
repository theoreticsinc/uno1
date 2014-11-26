//
//  DetailsViewController.h
//  uno
//
//  Created by Angelo Dizon on 11/4/14.
//  Copyright (c) 2014 Unlimited Network of Opportunities. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UITextView *productDesc;

@property (strong) NSString *recipeName;
@property (strong) NSString *imageFile;
@property (strong) NSString *youtube_link;
@property (strong) NSString *science_link;
@property (strong) NSString *testimonial_link;
@end
