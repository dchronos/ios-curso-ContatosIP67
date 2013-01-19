//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3144 on 16/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormularioContatoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fieldNome;
@property (weak, nonatomic) IBOutlet UITextField *fieldTelefone;
@property (weak, nonatomic) IBOutlet UITextField *fieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *fieldEndereco;
@property (weak, nonatomic) IBOutlet UITextField *fieldSite;
@property (strong) NSMutableArray *contatos;

- (void) adicionaContato;
- (IBAction)proximoElemento:(UITextField *) campoAtual;

@end
