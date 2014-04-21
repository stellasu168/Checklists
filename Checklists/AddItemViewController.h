//
//  AddItemViewController.h
//  Checklists
//
//  Created by Stella Su on 4/8/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class ChecklistItem;

// method (delegates) declarations.
@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:
                        (AddItemViewController *)controller;

- (void)addItemViewController:
                        (AddItemViewController *)controller
          didFinishAddingItem:(ChecklistItem *)item;

@end

// delegate for text field objects.
@interface AddItemViewController : UITableViewController
                                        <UITextFieldDelegate>

@property (nonatomic, weak) id <AddItemViewControllerDelegate>
                                        delegate;


@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

- (IBAction)cancel;
- (IBAction)done;

@end
