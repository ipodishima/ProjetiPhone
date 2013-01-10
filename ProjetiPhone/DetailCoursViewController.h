//
//  DetailCoursViewController.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface DetailCoursViewController : UIViewController {

    UILabel *_labelBackground;
    UILabel *_labelTitle;
    UILabel *_labelColumn1;
    UILabel *_labelColumn2;
    MKMapView *_mapView;
    

    
}

@property NSString *textToShow;
@property NSString *latitude;
@property NSString *longitude;



@end
