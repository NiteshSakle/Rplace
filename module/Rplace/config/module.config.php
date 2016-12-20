<?php

namespace Rplace;

use Zend\Router\Http\Segment;

return [
	'router' => [
        'routes' => [
            'login' => [
                'type'    => segment::class,
                 'options' =>[
                    'route'    => '/login[/:action]',
                    'constraints' => [
						'action' => 'register'
					],
                    'defaults' => [
                           'controller' => 'Rplace\Controller\LoginController',
					],
                ],
            ],       
            'product' => [
                'type'    => segment::class,
                 'options' =>[
                    'route'    => '/product[/:id]',
			        'constraints' => [
                        'id'     => '[a-zA-Z0-9_.*-@]*',
					 ],
                    'defaults' => [
                           'controller' => 'Rplace\Controller\ProductController',
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
