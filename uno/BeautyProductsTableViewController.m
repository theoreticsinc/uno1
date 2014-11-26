//
//  BeautyProductsTableViewController.m
//  uno
//
//  Created by Angelo Dizon on 9/18/14.
//  Copyright (c) 2014 Unlimited Network of Opportunities. All rights reserved.
//

#import "BeautyProductsTableViewController.h"

@interface BeautyProductsTableViewController ()
@end

@implementation BeautyProductsTableViewController {
    NSArray *products;
    NSArray *productsIcons;
    NSArray *productsImages;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    products = [NSArray arrayWithObjects:@"Glutathione", @"Kojic Soap",@"Body Works",@"Glutathione Soap",@"Health Hair Treats",@"Magic Cream", @"Natura White", @"Nutri Hair", @"Thanakha", nil];
    productsIcons = [NSArray arrayWithObjects:@"gluLight.png", @"kojic.png",@"bodyworks.png",@"glusoap.png",@"hairtreats.png",@"magic_cream.png", @"naturaWhite.png", @"nutrihair.png", @"thanakha.png", nil];
    productsImages = [NSArray arrayWithObjects:@"prod_glutalotion.jpg", @"prod_kojic.jpg",@"prod_bodyworks.jpg",@"prod_glutasoap.jpg",@"prod_hairtreats.jpg",@"prod_magiccream.jpg", @"prod_naturewhite.jpg", @"prod_nutrihair.jpg", @"prod_thanakha.jpg", nil];
    
    self.navigationItem.title = @"UNO Beauty Products";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backButton;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *BeautyProductsTableIdentifier = @"BeautyProductsTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BeautyProductsTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BeautyProductsTableIdentifier];
    }
    
    cell.textLabel.text = [products objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[productsIcons objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     To illustrate the effect of highlighting the cell, don't set the selection style to None in the storyboard, instead implement this method to immediately deselect the cell.
     */
    NSLog(@"SELECTED: ");
    [self performSegueWithIdentifier:@"pushProducts" sender:self];
    //[self performSegueWithIdentifier:@"showRecipeDetail" parameters:@{@"customParam1":@"testing1", @"customValue2":@"testing2"}];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushProducts"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *youtubelink = [NSString stringWithFormat:@"youtube_%@", [products objectAtIndex:indexPath.row]];
        NSString *scilink = [NSString stringWithFormat:@"science_%@", [products objectAtIndex:indexPath.row]];
        NSString *testilink = [NSString stringWithFormat:@"testi_%@", [products objectAtIndex:indexPath.row]];
        NSString *desclink = [NSString stringWithFormat:@"desc_%@", [products objectAtIndex:indexPath.row]];
        
        DetailsViewController *destViewController = segue.destinationViewController;
        
        destViewController.recipeName = NSLocalizedString(desclink, nil);
        destViewController.youtube_link = NSLocalizedString(youtubelink, nil);
        destViewController.science_link = NSLocalizedString(scilink, nil);
        destViewController.testimonial_link = NSLocalizedString(testilink, nil);
        NSLog(@"YOUTUBE%@", destViewController.youtube_link);
        destViewController.imageFile = [productsImages objectAtIndex:indexPath.row];
        
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)back {
    NSLog(@"Back button Pressed");
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
