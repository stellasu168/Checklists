//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by Stella Su on 3/13/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"

// make the ChecklistsViewController suitable to be a
// delegate for AddItemViewController.
@interface ChecklistsViewController : UITableViewController
                                <AddItemViewControllerDelegate>

@end
