//
//  DetailsViewController.m
//  uno
//
//  Created by Angelo Dizon on 11/4/14.
//  Copyright (c) 2014 Unlimited Network of Opportunities. All rights reserved.
//
#import "DetailsViewController.h"

@interface DetailsViewController ()
@end

@implementation DetailsViewController

@synthesize recipeName;
@synthesize imageFile;
@synthesize productImage;
@synthesize productDesc;
@synthesize youtube_link;
@synthesize science_link;
@synthesize testimonial_link;

- (void)viewDidLoad {
    NSString *imageFilename = [NSString stringWithFormat:@"%@", imageFile];

    NSLog(@"RECIPE: %@ and %@", recipeName, imageFilename);
    UIImage *image = [[UIImage alloc] init];
    image = [UIImage imageNamed:imageFilename];
                      //initWithImage:[UIImage imageNamed:imageFilename]];
    productImage.image = image;
    [productDesc setText:recipeName];
    [productImage setImage:[UIImage imageNamed:imageFilename]];
    [self.view addSubview: productImage];
    [self.view bringSubviewToFront: productImage];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)productsBtn:(id)sender {
    NSString *prodlink = [[NSString alloc] initWithFormat:@"https://www.youtube.com/watch?v=%@",youtube_link];
    
    NSURL *url = [ [ NSURL alloc ] initWithString: prodlink ];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)sciBtn:(id)sender {
    NSString *prodlink = [[NSString alloc] initWithFormat:@"https://www.youtube.com/watch?v=%@",science_link];
    
    NSURL *url = [ [ NSURL alloc ] initWithString: prodlink ];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)testiBtn:(id)sender {
    NSString *prodlink = [[NSString alloc] initWithFormat:@"https://www.youtube.com/watch?v=%@",testimonial_link];
    NSLog(@"testimonial_link=%@",testimonial_link);
    NSURL *url = [ [ NSURL alloc ] initWithString: prodlink ];
    [[UIApplication sharedApplication] openURL:url];
}

@end
