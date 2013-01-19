//
//  DetailWineViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "DetailWineViewController.h"

@interface DetailWineViewController ()

@end

@implementation DetailWineViewController

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
    
    _pref = [NSUserDefaults standardUserDefaults];
	// Do any additional setup after loading the view.
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20,20, 280, 100)];
    _commander = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _commander.frame = CGRectMake(20,140, 100, 30);
    [_commander setTitle:@"Commander" forState:UIControlStateNormal];
    [_commander addTarget:self action:@selector(commander:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_commander];
    [self.view addSubview:_label];
    _label.numberOfLines = 0;
    _label.text = _textToShow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)commander:(UIButton *)sender {
    NSLog(@"commande");
    
    //j'utilse le nom des vins comme clé pour les différencier
    NSString *s = [_pref objectForKey:self.title];
    if (s == nil) {
        NSLog(@"s == nil");
        
        // M: Faire un alloc init + une affectation = @"0" est redondant. D'un côté tu pointes vers une nouvelle case mémoire 0x01 et de l'autre, tu repointes vers une deuxième 0x02. La première est inutile du coup.
        // Pour la petite histoire, c'était une erreur redondante des débutants avant ARC (Automatic Reference Counting) qui générait des fuites mémoires en pagaille.
        // s = [[NSString alloc] init];
        s = @"0";
    }
    s = [NSString stringWithFormat:@"%d", [s intValue]+1];
    
    // Pour plus d'optimisation : (éviter une allocation de @"0" juste pour récupérer 0
//    NSString *s = [_pref objectForKey:self.title];
//    if (s == nil)
//        s = @"1";
//    else
//        s = [NSString stringWithFormat:@"%d", [s intValue]+1];
    
    [_pref  setObject:s forKey:self.title];
    [_pref synchronize];
}

@end
