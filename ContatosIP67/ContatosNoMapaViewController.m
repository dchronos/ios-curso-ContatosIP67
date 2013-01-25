//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios3144 on 23/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ContatosNoMapaViewController.h"

@implementation ContatosNoMapaViewController
@synthesize mapa;
@synthesize contatos;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    MKUserTrackingBarButtonItem *botaoLocalizacao = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapa];
    self.navigationItem.leftBarButtonItem = botaoLocalizacao;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMapa:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(id) init {
    self = [super init];
    
    if(self){
        
        UIImage *imagemTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:imagemTabItem tag:1];
        
        self.tabBarItem = tabItem;
        self.navigationItem.title = @"Localizacao";
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.mapa addAnnotations:contatos];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.mapa removeAnnotations:contatos];
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    static NSString *identifier = @"pino";
    MKPinAnnotationView *pino = (MKPinAnnotationView *) [mapa dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!pino) {
        pino = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    else{
        pino.annotation = annotation;
    }
    Contato *contato = (Contato *) annotation;
    pino.pinColor = MKPinAnnotationColorRed;
    pino.canShowCallout = YES;
    if(contato.foto){
        UIImageView *imagemContato = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        imagemContato.image = contato.foto;
        pino.leftCalloutAccessoryView = imagemContato;
    }
    return pino;
}

@end
