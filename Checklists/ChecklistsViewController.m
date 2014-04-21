//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Stella Su on 3/13/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistItem.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController
{
   
    NSMutableArray *_items;

}

// You should do things that you only have to do once in viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // First, make the array object. Calling alloc and init to create the object. 
    _items = [[NSMutableArray alloc] initWithCapacity:20];
    
    // Making a checklistitem object
    ChecklistItem *item;
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Walk the dog";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Brush my teeth";
    item.checked = YES;
    [_items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Learn iOS development";
    item.checked = YES;
    [_items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Soccer practice";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Eat ice cream";
    item.checked = YES;
    [_items addObject:item];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Data source methods
// Type of return value - part of method name - type of 1st parameter - the variable that holds the 1st parameter 
- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell
                      withChecklistItem:(ChecklistItem *)item
{
    
    UILabel *label = (UILabel *) [cell viewWithTag:1001];
    
    if (item.checked){
        label.text = @"√ ";
    } else {
        label.text = @"";
    }
    
}


- (void)configureTextForCell:(UITableViewCell *)cell
           withChecklistItem:(ChecklistItem *)item
{
    // Ask the table view cell for the view with tag 1000
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Gets a copy of the prototype cell
    UITableViewCell *cell = [tableView
            dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    ChecklistItem *item = _items[indexPath.row];
  
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
  
    return cell;
}

- (void)tableView:(UITableView *)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             cellForRowAtIndexPath:indexPath];

    ChecklistItem *item = _items[indexPath.row];
    [item toggleChecked];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_items removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths
                withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)addItemViewControllerDidCancel:
                        (AddItemViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Delegate method
- (void)addItemViewController:
                            (AddItemViewController *)controller
          didFinishAddingItem:(ChecklistItem *)item
{
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath
                              indexPathForRow:newRowIndex inSection:0];
    
    // Creates a new, temporary array.
    NSArray *indexPaths = @[indexPath];
    
    [self.tableView insertRowsAtIndexPaths:indexPaths
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddItem"]){
        
        // 1
        UINavigationController *navigationController =
                                    segue.destinationViewController;
        // 2
        AddItemViewController *controller =
                    (AddItemViewController *)
                            navigationController.topViewController;
        // 3
        controller.delegate = self;
    }

}

@end
