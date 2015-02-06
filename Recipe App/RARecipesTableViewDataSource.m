//
//  RARecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Ethan Hess on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RARecipesTableViewDataSource.h"
#import "RARecipes.h"


@implementation RARecipesTableViewDataSource

static NSString *const cellIndentifier = @"indentifier";

-(void)registerTableView:(UITableView *)tableView{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIndentifier];
}

-(NSInteger)tableView : (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [RARecipes count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    return cell;
}




@end

