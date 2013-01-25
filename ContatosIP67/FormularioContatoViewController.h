//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3144 on 16/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "FormularioContatoViewControllerDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface FormularioContatoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *fieldNome;
@property (weak, nonatomic) IBOutlet UITextField *fieldTelefone;
@property (weak, nonatomic) IBOutlet UITextField *fieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *fieldEndereco;
@property (weak, nonatomic) IBOutlet UITextField *fieldSite;
@property (weak, nonatomic) IBOutlet UIButton *botaoFoto;
@property (strong) NSMutableArray *contatos;
@property (strong) Contato *contato;
@property (weak, nonatomic) IBOutlet UITextField *fieldLatitude;
@property (weak, nonatomic) IBOutlet UITextField *fieldLongitude;
@property (weak) id<FormularioContatoViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@property (strong) NSManagedObjectContext *contexto;

- (IBAction)proximoElemento:(UITextField *) campoAtual;
- (id)initWithContato: (Contato *) contato;
- (IBAction)selecionaFoto:(id)sender;
- (IBAction)buscarCoordenadas:(id)sender;

@end
