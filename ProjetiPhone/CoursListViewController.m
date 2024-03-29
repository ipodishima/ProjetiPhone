//
//  CoursListViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "CoursListViewController.h"
#import "DetailCoursViewController.h"



@interface CoursListViewController ()

@end

@implementation CoursListViewController

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
    
    
    
    // Alloc the view which shows activity
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    // Set it to the right on navigation bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_activity];
    
    // Load the JSON from the file
    [[DownloadManager shared] loadLocalFileName:@"cours" withDelegate:self];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
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
    return [_listOfCours count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    Cours *cours = [_listOfCours objectAtIndex:[indexPath row]];
    cell.textLabel.text = cours.title;
    cell.detailTextLabel.text = @"detail";
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    DetailCoursViewController *detailCoursVC = [[DetailCoursViewController alloc] init];
    Cours *cours = [_listOfCours objectAtIndex:[indexPath row]];
    detailCoursVC.title = cours.title;
    detailCoursVC.latitude = cours.location.latitude;
    detailCoursVC.longitude = cours.location.longitude;
    
    // M: Ahahah ;)
    // Ok, j'avais dit qu'on pouvait enchainer beaucoup d'appels, mais ça devient illisible !
    detailCoursVC.infos = [[[[[[cours.agenda stringByAppendingString: @"\n"] stringByAppendingString: cours.date] stringByAppendingString: @"\n"] stringByAppendingString: [cours.location.street stringByAppendingString:@" "]] stringByAppendingString: [cours.location.city stringByAppendingString:@" "]] stringByAppendingString: cours.location.country];
    
    NSString *res = [[NSMutableString alloc] init];
    for (int i=0; i<cours.wines.count; i++) {
        res = [res stringByAppendingString:[[cours.wines objectAtIndex:i] toString]];
        res = [res stringByAppendingString:@"\n"];
    }
    detailCoursVC.wines = res;
    
    [self.navigationController pushViewController:detailCoursVC animated:YES];
     

}

//imlement protocol
#pragma mark - DownloadDelegate protocol

- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError *)error
{
    // Stop activity indicator
    [_activity stopAnimating];
    NSLog(@"%@", error);
    // Todo : handle the error
}

- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest *)request
{
    // Start the activity indicator
    [_activity startAnimating];
}

- (void) downloadOperation:(DownloadOperation *)operation didLoadObject:(id)object
{
    // Stop activity indicator
    [_activity stopAnimating];
    
    // Now, we need to go through all the objects loaded in the JSON, parse it, and create new Objective-C objects
    // First, remove previous objects in instance array
    [_listOfCours removeAllObjects];
    
    // Allocate it if not already. This is called lazy loading. Remember, we are on mobile devices, where RAM use is really important
    if (!_listOfCours)
        _listOfCours = [NSMutableArray new];
    
    // Now enumerate the json array
    for (NSDictionary *dic in object)
    {
        // Create a new contact
        Cours *c = [Cours new];
        
        // Set its properties from JSON 'object'
        c.title = [dic objectForKey:@"title"];
        c.date = [dic objectForKey:@"date"];
        c.agenda = [dic objectForKey:@"agenda"];
        
        Location *l = [Location new];
        NSDictionary *dicLoc = [dic objectForKey:@"location"];
        l.latitude = [dicLoc[@"gps"] objectForKey:@"latitude"];
        l.longitude = [dicLoc[@"gps"] objectForKey:@"longitude"];
        l.street = [dicLoc[@"address"] objectForKey:@"street"];
        l.city = [dicLoc[@"address"] objectForKey:@"city"];
        l.country = [dicLoc[@"address"] objectForKey:@"country"];
        // use http://www.jsoneditoronline.org/
        NSLog(@"%@",l.latitude);
        c.location = l;
        NSLog(@"%@",c.location.longitude);
        
        NSMutableArray *wines = [[NSMutableArray new] init];
        NSArray *arrayOfWines = [dic objectForKey:@"wines"]; // C'est bien un tableau, commence par des [ dans ton JSON qui contient des dictionnaires
        for (NSDictionary * dicWine in arrayOfWines) {
            
            //create a new wine
            Wine *w = [[Wine new] init];
            
            w.name = [dicWine objectForKey:@"name"];
            w.year = [dicWine objectForKey:@"year"];
            w.price = [dicWine objectForKey:@"price"];
            w.origin = [dicWine objectForKey:@"origin"];

            [wines addObject:w];
        }
        c.wines = wines;
        
        // Add it to the array
        [_listOfCours addObject:c];
    }
    
    // Just for fun, sort the array
   // [_listOfCours sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES]]];
    
    // Try these
    // [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES]]];
    // [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"age" ascending:YES]]];
    // Pretty cool no?
    
    // We are almost done. Please note that the parsing is made here just to avoid complexification. You should always create a model like YouTubeManager class which handles the parsing and give the data to the controller. Remember the MVC pattern
    
    // When we finished, reload the table view
    [self.tableView reloadData];
}


@end
