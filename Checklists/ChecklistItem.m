//
//  ChecklistItem.m
//  Checklist
//
//  Created by Stella Su on 3/25/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

- (void)toggleChecked
{
    self.checked = !self.checked;
}

@end
