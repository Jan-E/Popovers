//
//  ViewController.m
//  Popovers
//
//  Created by Jay Versluis on 29/05/2014.
//  Copyright (c) 2014 Pinkstone Pictures LLC. All rights reserved.
//

#import "ViewController.h"
#import "DateViewController.h"

@interface ViewController () <UIPopoverControllerDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *actionButton;
@property (strong, nonatomic) IBOutlet UIDatePicker *mainDatePicker;
@property (nonatomic, strong) UIPopoverController *popover;
- (IBAction)actionButtonPressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonPressed:(id)sender {
    
    // create a new Date Pikcer View Controller
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DateViewController *dateView = [storyboard instantiateViewControllerWithIdentifier:@"DatePickerView"];
    
    // create a Popover Controller and present it
    self.popover = [[UIPopoverController alloc]initWithContentViewController:dateView];
    [self.popover presentPopoverFromBarButtonItem:self.actionButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    self.popover.delegate = self;
    
    
}

#pragma mark - Popover Delegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    
    // read out the date and populate our UI
    DateViewController *dateView = (DateViewController *)popoverController.contentViewController;
    self.mainDatePicker.date = dateView.datePicker.date;
}

@end
