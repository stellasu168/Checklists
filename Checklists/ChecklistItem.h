//
//  ChecklistItem.h
//  Checklist
//
//  Created by Stella Su on 3/25/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL checked;

- (void)toggleChecked;

@end
