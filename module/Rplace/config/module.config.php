<?php

namespace Rplace;

use Zend\Router\Http\Segment;
use Zend\Router\Http\Literal;

return [
    'router' => [
        'routes' => [
            'login' => [
                'type' => segment::class,
                'options' => [
                    'route' => '/login[/:action]',
                    'constraints' => [
                        'action' => 'register|changePassword'
                    ],
                    'defaults' => [
                        'controller' => 'Rplace\Controller\LoginController',
                    ],
                ],
            ],
            'product' => [
                'type' => segment::class,
                'options' => [
                    'route' => '/product[/:action][/:id]',
                    'constraints' => [
                        'action' => 'generateBill|deposit|addProduct|verifyProduct|purchaseProduct|getAmountById',
                        'id' => '[0-9a-zA-Z]*'
                    ],
                    'defaults' => [
                        'controller' => 'Rplace\Controller\ProductController',
                    ],
                ],
            ],
            'backup' => [
                'type' => Literal::class,
                'options' => [
                    'route' => '/backup',
                    'defaults' => [
                        'controller' => 'Rplace\Controller\LoginController',
                        'action' => 'backup',
                    ],
                ],
            ],            
        ],
    ],
    'view_manager' => [
        'strategies' => [
            'ViewJsonStrategy'
        ],
    ],
];
