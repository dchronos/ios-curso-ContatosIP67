//
//  AppDelegate.h
//  ContatosIP67
//
//  Created by ios3144 on 16/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong) NSMutableArray *contatos;
@property (strong) NSString *nomeDoArquivo;
@property (readonly, strong) NSManagedObjectContext *contexto;


- (void) salvaContexto;
- (void) inserirDados;
- (void) buscarContatos;

@end
