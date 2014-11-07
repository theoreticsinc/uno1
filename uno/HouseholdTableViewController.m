//
//  HouseholdTableViewController.m
//  uno
//
//  Created by Angelo Dizon on 9/18/14.
//  Copyright (c) 2014 Unlimited Network of Opportunities. All rights reserved.
//

#import "HouseholdTableViewController.h"

@interface HouseholdTableViewController ()
@end

@implementation HouseholdTableViewController {
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
    products = [NSArray arrayWithObjects:@"Dishwashing Liquid", @"Laundry Granules", nil];
    productsIcons = [NSArray arrayWithObjects:@"dishwashing.png", @"organicLaundry.png",  nil];
    productsImages = [NSArray arrayWithObjects:@"prod_dishwashing.jpg", @"prod_organiclaundry.jpg",  nil];
    self.navigationItem.title = @"UNO Household";
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
    static NSString *HouseholdTableIdentifier = @"HouseholdTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HouseholdTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HouseholdTableIdentifier];
    }
    
    cell.textLabel.text = [products objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[productsIcons objectAtIndex:indexPath.row]];
    return cell;
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
        NSString *desclink = [NSString stringWithFormat:@"desc_%@", [products objectAtIndex:indexPath.row]];
        
        DetailsViewController *destViewController = segue.destinationViewController;
        
        destViewController.recipeName = NSLocalizedString(desclink, nil);
        destViewController.youtube_link = NSLocalizedString(youtubelink, nil);
        NSLog(@"YOUTUBE%@", destViewController.youtube_link);
        destViewController.imageFile = [productsImages objectAtIndex:indexPath.row];
        
    }
}


-(void)back {
    NSLog(@"Back button Pressed");
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
