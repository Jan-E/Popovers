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

@property (strong, nonatomic) IBOutlet UIDatePicker *mainDatePicker;
@property (nonatomic, strong) UIPopoverController *popover;

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"datePopover"]) {
        
        // grab the Popover Controller
        self.popover = [(UIStoryboardPopoverSegue *)segue popoverController];
        self.popover.delegate = self;
        
    }
}

#pragma mark - Popover Delegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    
    // grab date view controller
    DateViewController *dateView = (DateViewController *)self.popover.contentViewController;
    NSDate *theDate = dateView.datePicker.date;
    
    // read its date and display it
    // NSLog(@"The chosen date was %@", [theDate description]);
    self.mainDatePicker.date = theDate;
}

@end
