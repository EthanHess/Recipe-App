//
//  DetailViewController.m
//  Recipe App
//
//  Created by Ethan Hess on 2/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "RARecipes.h"

static CGFloat margin = 15;
static CGFloat height = 100;
static CGFloat topMargin = 105;

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = [RARecipes titleAtIndex:self.indexPathSelected.row];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 10);
    
    [self.view addSubview:scrollView];
    
    UILabel *foodDescription = [[UILabel alloc]initWithFrame:CGRectMake(margin, 5, self.view.frame.size.width -5, height)];
    foodDescription.backgroundColor = [UIColor whiteColor];
    foodDescription.numberOfLines = 0;
    foodDescription.text = [RARecipes descriptionAtIndex:self.indexPathSelected.row];
    [foodDescription sizeToFit];
    [scrollView addSubview:foodDescription];
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.indexPathSelected.row]; i++){
            
    UILabel *volume = [[UILabel alloc]initWithFrame:CGRectMake(margin, topMargin + 20 * i, self.view.frame.size.width -5,  30)];
    volume.numberOfLines = 0;
    volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.indexPathSelected.row];
    [volume sizeToFit];
    [scrollView addSubview:volume];
        
    UILabel *ingredients = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2, topMargin +20 * i, self.view.frame.size.width -5, 30)];
    ingredients.backgroundColor = [UIColor whiteColor];
    ingredients.numberOfLines = 0;
    ingredients.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.indexPathSelected.row];
        [ingredients sizeToFit];
    [scrollView addSubview:ingredients];
    

}
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
