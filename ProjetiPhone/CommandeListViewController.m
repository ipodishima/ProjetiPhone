//
//  CommandeListViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 09/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "CommandeListViewController.h"
#import "DetailCommandeViewController.h"

@interface CommandeListViewController ()

@end

@implementation CommandeListViewController

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
    
    //Je n'ai pas réussi à mettre à jour en temps réelle les commandes. ça ne fonctionne qu'au lancement.
    
    pref=[NSUserDefaults standardUserDefaults];
    [pref synchronize];
    
    _listOfCommande = [[NSMutableArray alloc] init];

    
    NSString *s1 = [pref objectForKey:@"Bordeaux"];
    NSString *s2 = [pref objectForKey:@"Pinot Gris"];
    NSString *s3 = [pref objectForKey:@"Gewürztraminer"];
    
    if (s1 != nil) {
        Commande *c = [[Commande alloc] init];
        c.name = @"Bordeaux";
        c.number = s1;
        [_listOfCommande addObject:c];

    }
    if (s2 != nil) {
        Commande *c = [[Commande alloc] init];
        c.name = @"Pinot Gris";
        c.number = s2;
        [_listOfCommande addObject:c];

    }
    if (s3 != nil) {
        Commande *c = [[Commande alloc] init];
        c.name = @"Gewürztraminer";
        c.number = s3;
        [_listOfCommande addObject:c];

    }

    
        
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [_listOfCommande count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    Commande *c = [_listOfCommande objectAtIndex:[indexPath row]];
    cell.textLabel.text = c.name;
    
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    DetailCommandeViewController *detailCommandeVC = [[DetailCommandeViewController alloc] init];
    detailCommandeVC.commande = [_listOfCommande objectAtIndex:[indexPath row]];
    [self.navigationController pushViewController:detailCommandeVC animated:YES];
}

@end
