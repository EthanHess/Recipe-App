//
//  RARecipesTableViewDataSource.h
//  Recipe App
//
//  Created by Ethan Hess on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RARecipesTableViewDataSource : NSObject <UITableViewDataSource>

-(void)registerTableView:(UITableView *)tableView;

@end
