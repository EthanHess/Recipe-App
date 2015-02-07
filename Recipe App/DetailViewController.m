//
//  DetailViewController.m
//  Recipe App
//
//  Created by Ethan Hess on 2/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "RARecipes.h"
#import "RARecipesTableViewDataSource.h"


static CGFloat margin = 15;
static CGFloat height = 100;
static CGFloat topMargin = 105;

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 10);
    
    [self.view addSubview:scrollView];

    UIImageView *recipeImage = [UIImageView new];
    recipeImage.frame = CGRectMake(50, 500, 200, 200);
    
    NSString *imageString = [NSString stringWithFormat:@"%@", [RARecipes imageAtIndex:self.recipeIndex]];
    recipeImage.image = [UIImage imageNamed:imageString];
    [scrollView addSubview:recipeImage];
    
    
    UILabel *foodDescription = [[UILabel alloc]initWithFrame:CGRectMake(margin, 5, self.view.frame.size.width -5, 90)];
    foodDescription.backgroundColor = [UIColor whiteColor];
    foodDescription.numberOfLines = 0;
    foodDescription.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    [foodDescription sizeToFit];
    [scrollView addSubview:foodDescription];
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++){
            
    UILabel *volume = [[UILabel alloc]initWithFrame:CGRectMake(margin, topMargin + 20 * i, self.view.frame.size.width -5,  30)];
    volume.backgroundColor = [UIColor whiteColor];
    volume.numberOfLines = 0;
    volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
    [volume sizeToFit];
    [scrollView addSubview:volume];
        
    UILabel *ingredients = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2, topMargin +20 * i, self.view.frame.size.width -5, 30)];
    ingredients.backgroundColor = [UIColor whiteColor];
    ingredients.numberOfLines = 0;
    ingredients.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [ingredients sizeToFit];
    [scrollView addSubview:ingredients];
    

    
    NSArray *directionsArray = [RARecipes directionsAtIndex:self.recipeIndex];
    
    
    for (int i = 0; i < directionsArray.count; i++) {
    
    UILabel *directions = [[UILabel alloc]initWithFrame:CGRectMake(margin, ingredients.frame.size.height + foodDescription.frame.size.height + volume.frame.size.height + 200, self.view.frame.size.width / 1.3, self.view.frame.size.height)];
    directions.backgroundColor = [UIColor whiteColor];
    directions.numberOfLines = 0;
    directions.text = [RARecipes directionsAtIndex:self.recipeIndex][1];
    [directions sizeToFit];
    [scrollView addSubview:directions];
    
        
    }
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
