//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios3144 on 23/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>
#import "Contato.h"

@interface ContatosNoMapaViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic, strong) NSMutableArray *contatos;
@property (weak, nonatomic) IBOutlet MKMapView *mapa;


@end
