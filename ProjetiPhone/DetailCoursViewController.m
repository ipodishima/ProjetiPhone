//
//  DetailCoursViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "DetailCoursViewController.h"

@interface DetailCoursViewController ()

@end

@implementation DetailCoursViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    participe = NO;
    
	// Do any additional setup after loading the view.
    //view experimental dimension 320*367 because of tabbar
    _labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 367)];
    _labelColumn1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 130, 150)];
    _labelColumn2 = [[UILabel alloc] initWithFrame:CGRectMake(170, 50, 130, 150)];
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(20, 210, 280, 150)];
       _buttonParticipation = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonParticipation.frame = CGRectMake(20,20,200,30);
    [_buttonParticipation setTitle:@"Je ne participe pas" forState:UIControlStateNormal];
    [_buttonParticipation addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_mapView setScrollEnabled:YES];
    [_mapView setShowsUserLocation:YES];
    [_mapView setZoomEnabled:YES];
    
    _labelColumn1.numberOfLines = 0;
    _labelColumn2.numberOfLines = 0;
    
    
    _labelColumn1.text = _infos;
    _labelColumn2.text = _wines;

    
    // Définir le zoom
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    // Définir les coordonnées
    CLLocationCoordinate2D coordinates;
    coordinates.latitude = [_latitude doubleValue];
    coordinates.longitude = [_longitude doubleValue];
    MKCoordinateRegion region;
    region.span = span;
    region.center = coordinates;
    [_mapView setRegion:region animated:YES];
   
    /*
    _labelBackground.backgroundColor = [UIColor redColor];
    _labelTitle.backgroundColor = [UIColor yellowColor];
    _labelColumn1.backgroundColor = [UIColor greenColor];
    _labelColumn2.backgroundColor = [UIColor blueColor];
     */
    
    [self.view addSubview:_labelBackground];
    [self.view addSubview:_labelColumn1];
    [self.view addSubview:_labelColumn2];
    [self.view addSubview:_mapView];
    [self.view addSubview:_buttonParticipation];
    
    
    
}

-(void)buttonPressed:(id)sender{
    if (participe) {
        participe = !participe;
        [_buttonParticipation setTitle:@"Je ne participe pas" forState:UIControlStateNormal];
        [_buttonParticipation setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
    } else {
        participe = !participe;
        [_buttonParticipation setTitle:@"Je participe" forState:UIControlStateNormal];
       [_buttonParticipation setTitleColor: [UIColor greenColor] forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
