//
//  AddItemViewController.m
//  Checklists
//
//  Created by Stella Su on 4/8/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import "AddItemViewController.h"
#import "ChecklistItem.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)cancel
{
    // Sending addItemViewControllerDidCancel to the delegate
    [self.delegate addItemViewControllerDidCancel:self];
    
}


- (IBAction)done
{
   
    ChecklistItem *item = [[ChecklistItem alloc] init];
    item.text = self.textField.text;
    item.checked = NO;
    
    [self.delegate addItemViewController:self
                     didFinishAddingItem:item];

}

- (NSIndexPath *)tableView:(UITableView *)tableView
    willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
    
}

- (BOOL)textField:(UITextField *)theTextField
        shouldChangeCharactersInRange:(NSRange)range
        replacementString:(NSString *)string
{
    // Figure out what the new text will be.
    NSString *newText = [theTextField.text
        stringByReplacingCharactersInRange:range withString:string];
    
    self.doneBarButton.enabled = ([newText length] > 0);
    
    return YES;
}


@end
