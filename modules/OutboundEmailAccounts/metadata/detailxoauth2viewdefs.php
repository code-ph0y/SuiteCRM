<?php
$module_name = 'OutboundEmailAccounts';
$viewdefs [$module_name] =
array(
  'DetailView' =>
  array(
    'templateMeta' =>
    array(
      'form' =>
      array(
        'buttons' =>
        array(
          0 => 'EDIT',
          1 => 'DUPLICATE',
          2 => 'DELETE',
          3 => 'FIND_DUPLICATES',
        ),
        //'footerTpl' => 'modules/OutboundEmailAccounts/tpls/view.detail.tpl'
      ),
      
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
      ),
      'syncDetailEditViews' => true,
      'includes' => array (
        array (
            'file' => 'modules/OutboundEmailAccounts/OutboundEmailAccounts.js'
        )
      )
    ),
    'panels' =>
    array(
      'default' =>
      array(
        0 =>
        array(
          0 => 'name',
        ),
      ),
      'lbl_editview_panel1' =>
      array(
        0 =>
        array(
          0 =>
          array(
            'name' => 'mail_connection_type',
            'label' => 'LBL_CONNECTION_TYPE',
            'customCode' => '
              {if $fields.mail_connection_type.value == "smtp"}
                {$MOD.LBL_CONNECTION_TYPE_SMTP}
              {else}
                {$MOD.LBL_CONNECTION_TYPE_XOAUTH2}
              {/if}',
          )
        ),
        1 => array(
          0 =>
          array(
            'name' => 'mail_xoauth2user',
            'label' => 'LBL_MAIL_XOAUTH2USER',
          ),
        ),
        2 => array(
          0 =>
          array(
            'name' => 'mail_xoauth2clientid',
            'label' => 'LBL_MAIL_XOAUTH2CLIENTID',
          ),
        ),
        3 => array(
          0 =>
          array(
            'name' => 'mail_xoauth2clientsecret',
            'label' => 'LBL_MAIL_XOAUTH2CLIENTSECRET',
          ),
        )
      ),
    ),
  ),
);
