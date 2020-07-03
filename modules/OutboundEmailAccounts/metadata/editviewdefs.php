<?php
$module_name = 'OutboundEmailAccounts';
$viewdefs [$module_name] =
    array(
        'EditView' =>
            array(
                'templateMeta' =>
                    array(
                        'maxColumns' => '2',
                        'widths' =>
                            array(
                                0 =>
                                    array(
                                        'label' => '10',
                                        'field' => '30',
                                    ),
                                1 =>
                                    array(
                                        'label' => '10',
                                        'field' => '30',
                                    ),
                            ),
                        'useTabs' => false,
                        'tabDefs' =>
                            array(
                                'DEFAULT' =>
                                    array(
                                        'newTab' => false,
                                        'panelDefault' => 'expanded',
                                    ),
                                'LBL_EDITVIEW_PANEL1' =>
                                    array(
                                        'newTab' => false,
                                        'panelDefault' => 'expanded',
                                    ),
                            ),
                        'syncDetailEditViews' => true,
                        'form' => array(
                            'footerTpl' => 'modules/OutboundEmailAccounts/tpls/view.obemailpanel.tpl',
                        ),
                        'includes' => array (
                            array (
                                'file' => 'cache/include/javascript/sugar_grp_yui_widgets.js'
                            )
                        )
                    ),
                'panels' => array(
                    'default' => array(
                        0 => array(
                            0 => 'name',
                        ),
                    ),
                ),
            ),
    );
