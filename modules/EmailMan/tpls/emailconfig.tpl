
{if !empty($mail_show_name_field) }
  <tr>
    <td width="20%" scope="row">{$MOD.LBL_MAIL_NAME} <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span></td>
    <td width="30%" > <input id='mail_name' name='mail_name' tabindex='1' size='25' maxlength='128' type="text" value="{$mail_name}"></td>
  </tr>
{/if}





<tr>
    <td width="20%" scope="row">{$MOD.LBL_NOTIFY_FROMNAME} <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span></td>
    <td width="30%" > <input id='smtp_from_name' name='smtp_from_name' tabindex='1' size='25' maxlength='128' type="text" value="{$smtp_from_name}"></td>
</tr>
<tr>
    <td width="20%" scope="row">{$MOD.LBL_NOTIFY_FROMADDRESS} <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span></td>
    <td width="30%"><input id='smtp_from_addr' name='smtp_from_addr' tabindex='1' size='25' maxlength='128' type="text" value="{$smtp_from_addr}"></td>
</tr>

<tr>
    <input type="hidden" name="mail_sendtype" id="mail_sendtype" value="SMTP">
    <td width="20%" scope="row">{$MOD.LBL_CONNECTION_TYPE}</td>
    <td width="30%">
        <input 
        type="radio" 
        onclick="changeConnectionType(this.value);" 
        id="mail_connection_type_smtp" 
        name="mail_connection_type"
        value="smtp"
        {if !empty($mail_connection_type) && $mail_connection_type == 'smtp'}
            checked="checked"
        {/if}
        /> 
        <span>&nbsp;&nbsp;{$MOD.LBL_CONNECTION_TYPE_SMTP}&nbsp;&nbsp;&nbsp;&nbsp;</span> 
        <input 
        type="radio" 
        onclick="changeConnectionType(this.value);" 
        id="mail_connection_type_xoauth2"
        name="mail_connection_type"
        value="xoauth2"
        {if !empty($mail_connection_type) && $mail_connection_type == 'xoauth2'}
            checked="checked"
        {/if}
        /> 
        <span>&nbsp;&nbsp;{$MOD.LBL_CONNECTION_TYPE_XOAUTH2}</span>
    </td>
    <td span="2"></td>
</tr>

<tr id="smtp_type_row">
    <td align="left" scope="row" colspan="4">{$MOD.LBL_CHOOSE_EMAIL_PROVIDER}</td>
</tr>
<tr >
<td colspan="4">
    <div id="smtpButtonGroup" class="yui-buttongroup">
    <span id="gmail" class="yui-button yui-radio-button{if $mail_smtptype == 'gmail'} yui-button-checked{/if}">
        <span class="first-child">
        <button type="button" name="mail_smtptype" value="gmail" class="btn btn-danger">
            &nbsp;&nbsp;&nbsp;&nbsp;{$APP.LBL_SMTPTYPE_GMAIL}&nbsp;&nbsp;&nbsp;&nbsp;
        </button>
        </span>
    </span>
    <span id="yahoomail" class="yui-button yui-radio-button{if $mail_smtptype == 'yahoomail'} yui-button-checked{/if}">
        <span class="first-child">
        <button type="button" name="mail_smtptype" value="yahoomail" class="btn btn-danger">
            &nbsp;&nbsp;&nbsp;&nbsp;{$APP.LBL_SMTPTYPE_YAHOO}&nbsp;&nbsp;&nbsp;&nbsp;
        </button>
        </span>
    </span>
    <span id="exchange" class="yui-button yui-radio-button{if $mail_smtptype == 'exchange'} yui-button-checked{/if}">
        <span class="first-child">
        <button type="button" name="mail_smtptype" value="exchange" class="btn btn-danger">
            &nbsp;&nbsp;&nbsp;&nbsp;{$APP.LBL_SMTPTYPE_EXCHANGE}&nbsp;&nbsp;&nbsp;&nbsp;
        </button>
        </span>
    </span>
    <span id="other" class="yui-button yui-radio-button{if $mail_smtptype == 'other' || empty($mail_smtptype)} yui-button-checked{/if}">
        <span class="first-child">
        <button type="button" name="mail_smtptype" value="other" class="btn btn-danger">
            &nbsp;&nbsp;&nbsp;&nbsp;{$APP.LBL_SMTPTYPE_OTHER}&nbsp;&nbsp;&nbsp;&nbsp;
        </button>
        </span>
    </span>
    </div>

    <div id="xoauth2ButtonGroup" style="display: none;">
    </div>

</td>
</tr>



<tr id="xoauth2_type_row">
    <td width="20%" scope="row">{$MOD.LBL_CONNECTION_TYPE}</td>
    <td width="30%">

        <div id="2">
            <input
                    type="radio"
                    id="mail_xoauth2type_gmail"
                    name="mail_xoauth2type"
                    value="gmail"
                    {if !empty($mail_xoauth2type) && $mail_xoauth2type == 'gmail'}
                        checked="checked"
                    {/if}
            />
            <span>&nbsp;&nbsp;Gmail&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input
                    type="radio"
                    id="mail_xoauth2type_other"
                    name="mail_xoauth2type"
                    value="other"
                    {if !empty($mail_xoauth2type) && $mail_xoauth2type == 'other'}
                        checked="checked"
                    {/if}
            />
            <span>&nbsp;&nbsp;Other (unsupported) </span>
        </div>

    </td>
    <td span="2"></td>
</tr>


<tr>
<td colspan="4">
    <div id="smtp_settings">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr id="mailsettings1">
        <td width="20%" scope="row">
            <span id="mail_smtpserver_label">{$MOD.LBL_MAIL_SMTPSERVER}</span> 
            <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
        </td>
        <td width="30%" >
            <input 
            type="text" 
            id="mail_smtpserver" 
            name="mail_smtpserver" 
            tabindex="1" 
            size="25" 
            maxlength="255" 
            value="{$mail_smtpserver}"
            />
        </td>
        <td width="20%" scope="row">
            <span id="mail_smtpport_label">{$MOD.LBL_MAIL_SMTPPORT}</span> 
            <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
        </td>
        <td width="30%">
            <input 
            type="text" 
            id="mail_smtpport" 
            name="mail_smtpport" 
            tabindex="1" 
            size="5" 
            maxlength="5" 
            value="{$mail_smtpport}"
            />
            </td>
        </tr>
        <tr id="mailsettings2">
        <td scope="row"><span id='mail_smtpauth_req_label'>{$MOD.LBL_MAIL_SMTPAUTH_REQ}</span></td>
        <td >
            <input 
            id='mail_smtpauth_req' 
            name='mail_smtpauth_req' 
            type="checkbox" 
            class="checkbox" 
            value="1" 
            tabindex='1'
            onclick="notify_setrequired(document.ConfigureSettings);" 
            {$mail_smtpauth_req}
            />
        </td>
        <td width="15%" scope="row"><span id="mail_smtpssl_label">{$APP.LBL_EMAIL_SMTP_SSL_OR_TLS}</span></td>
        <td width="35%" >
            <select id="mail_smtpssl" name="mail_smtpssl" tabindex="501" onchange="setDefaultSMTPPort();" >{$MAIL_SSL_OPTIONS}</select>
        </td>
        </tr>
        <tr id="smtp_auth1">
        <td width="20%" scope="row"><span id="mail_smtpuser_label">{$MOD.LBL_MAIL_SMTPUSER}</span> <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span></td>
        <td width="30%" ><input type="text" id="mail_smtpuser" name="mail_smtpuser" size="25" maxlength="255" value="{$mail_smtpuser}" tabindex='1' ></td>
        <td width="20%">&nbsp;</td>
        <td width="30%">&nbsp;</td>
        </tr>
        <tr id="smtp_auth2">
        <td width="20%" scope="row"><span id="mail_smtppass_label">{$MOD.LBL_MAIL_SMTPPASS}</span> <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span></td>
        <td width="30%" >
            <input type="password" id="mail_smtppass" name="mail_smtppass" size="25" maxlength="255" tabindex='1'>
            <a href="javascript:void(0)" id='mail_smtppass_link' onClick="SUGAR.util.setEmailPasswordEdit('mail_smtppass')" style="display: none">{$APP.LBL_CHANGE_PASSWORD}</a>
        </td>
        <td width="20%">&nbsp;</td>
        <td width="30%">&nbsp;</td>
        </tr>

        <tr id="xoauth2_user">
        <td width="20%" scope="row">
            <span id="mail_xoauth2user_label">{$MOD.LBL_MAIL_XOAUTH2USER}</span> 
            <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
        </td>
        <td width="30%" >
            <input 
            type="text"
            id="mail_xoauth2user" 
            name="mail_xoauth2user" 
            size="25" 
            maxlength="255"
            value="{$mail_xoauth2user}"
            tabindex='1'
            />
        </td>
        <td width="20%">&nbsp;</td>
        <td width="30%">&nbsp;</td>
        </tr>

        <tr id="xoauth2_clientid">
        <td width="20%" scope="row">
            <span id="mail_xoauth2clientid_label">{$MOD.LBL_MAIL_XOAUTH2CLIENTID}</span> 
            <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
        </td>
        <td width="30%" >
            <input 
            type="text" 
            id="mail_xoauth2clientid" 
            name="mail_xoauth2clientid" 
            size="25" 
            maxlength="255"
            value="{$mail_xoauth2clientid}" 
            tabindex='1'
            />
        </td>
        </tr>

        <tr id="xoauth2_clientsecret">
        <td width="30%" scope="row">
            <span id="mail_xoauth2clientsecret_label">{$MOD.LBL_MAIL_XOAUTH2CLIENTSECRET}</span> 
            <span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
        </td>
        <td width="30%" >
            <input 
            type="text" 
            id="mail_xoauth2clientsecret" 
            name="mail_xoauth2clientsecret" 
            size="25" 
            maxlength="255" 
            value="{$mail_xoauth2clientsecret}" 
            tabindex='1'
            />
            <input
                    type="hidden"
                    id="mail_xoauth2_token"
                    name="mail_xoauth2_token"
                    maxlength="255"
                    value="{$mail_xoauth2_token}"
            />
        </td>
        </tr>
        <tr id="xoauth2_authenticate">
            <td width="20%" scope="row">
                <span id="xoauth2_authenticate_label">Authenticate (complete OAUTH2 fields first)</span>
            </td>
            <td width="20%">
                <input type="button" class="btn btn-info" value="Authenticate XOAuth2" onclick="authenticateXOAuth();">
            </td>
            <td width="20%">
                <img src="themes/default/images/green_camp.gif" id="xoauth2_authenticate_success" style=" display: none;">
            </td>
        </tr>
    </table>
                                                                            

    </div>
</td>
</tr>
<tr><td colspan="4">&nbsp;</tr>
<tr>
    <td width="15%">&nbsp;
        <input id="testOutboundEmail" type="button" class="btn btn-info" value="{$APP.LBL_EMAIL_TEST_OUTBOUND_SETTINGS}" onclick="testOutboundSettings();">&nbsp;</td>
    </td>
    <td width="15%">
    <td width="40%">&nbsp;
    </td>
    <td width="40%">&nbsp;
        <input id="outboundEmailDoneButton" type="button" class="button" value="   {$app_strings.LBL_EMAIL_DONE_BUTTON_LABEL}   " style="display: none;" onclick="javascript:SUGAR.email2.accounts.saveOutboundSettings();">&nbsp;
    </td>
</tr>

{literal}
<script type="text/javascript">
  <!--

  var testOutboundDialog = false;

  var loader = new YAHOO.util.YUILoader({
    require : ["element","sugarwidgets"],
    loadOptional: true,
    skin: { base: 'blank', defaultSkin: '' },
    allowRollup: true,
    base: "include/javascript/yui/build/"
  });
  loader.addModule({
    name :"sugarwidgets",
    type : "js",
    fullpath: "include/javascript/sugarwidgets/SugarYUIWidgets.js",
    varName: "YAHOO.SUGAR",
    requires: ["datatable", "dragdrop", "treeview", "tabview"]
  });
  loader.insert();

  var first_load = true;

  function setXOauth2Token(token) {
    document.getElementById('mail_xoauth2_token').value = token;
    if (token) {
      document.getElementById("xoauth2_authenticate_success").style.display = "";
    }
  }

  function authenticateXOAuth() {

    let provider = document.querySelector('input[name="mail_xoauth2type"]:checked').value ?? '';
    let clientId = document.getElementById('mail_xoauth2clientid').value ?? '';
    let secret = document.getElementById('mail_xoauth2clientsecret').value ?? '';

    let url = 'index.php?entryPoint=emailXOauth2';
    url += '&provider=' + provider;
    url += '&clientId=' + clientId;
    url += '&clientSecret=' + secret;

    window.open(url , '_blank');
  }

  function notify_setrequired() {
    var mail_connection_type = document.querySelector('input[name=mail_connection_type]:checked').value

    if (document.getElementById('mail_sendtype') !== null) { 
      var mail_sendtype = document.getElementById('mail_sendtype').value;
    } else {
      mail_sendtype = 'SMTP';
    }

    if (mail_connection_type == 'smtp') {
      document.getElementById("smtp_settings").style.display = (mail_sendtype == "SMTP") ? "inline" : "none";
      document.getElementById("smtp_settings").style.visibility = (mail_sendtype == "SMTP") ? "visible" : "hidden";
      document.getElementById("smtp_auth1").style.display = (document.getElementById('mail_smtpauth_req').checked) ? "" : "none";
      document.getElementById("smtp_auth1").style.visibility = (document.getElementById('mail_smtpauth_req').checked) ? "visible" : "hidden";
      document.getElementById("smtp_auth2").style.display = (document.getElementById('mail_smtpauth_req').checked) ? "" : "none";
      document.getElementById("smtp_auth2").style.visibility = (document.getElementById('mail_smtpauth_req').checked) ? "visible" : "hidden";
      
      if (document.getElementById('mail_smtpauth_req').checked) {
        YAHOO.util.Dom.removeClass('mail_allow_user', "yui-hidden");
      } else {
        YAHOO.util.Dom.addClass("mail_allow_user", "yui-hidden");
      }
    }

    return true;
  }

  function setDefaultSMTPPort() 
  {
    if (!first_load) {
      useSSLPort = !document.getElementById("mail_smtpssl").options[0].selected;

      if (useSSLPort && document.getElementById("mail_smtpport").value == '25') {
          document.getElementById("mail_smtpport").value = '465';
      }

      if (!useSSLPort && document.getElementById("mail_smtpport").value == '465') {
          document.getElementById("mail_smtpport").value = '25';
      } else {
          first_load = false;
      }
    }
  }


function changeConnectionType(connectiontype)
{
  switch (connectiontype) {
    case 'smtp':
      changeEmailScreenDisplay('', true);
      break;
    case 'xoauth2':
      changeEmailScreenDisplayXoauth2('', true)
      break;
  }
}

function changeEmailScreenDisplayXoauth2(provider_type, clear) {
  if (clear) {
    document.getElementById("mailsettings1").style.display = 'none';
    document.getElementById("mailsettings2").style.display = 'none';
    document.getElementById("smtp_auth2").style.display = 'none';
    document.getElementById("smtp_auth1").style.display = 'none';
    document.getElementById("smtpButtonGroup").style.display = 'none';
    document.getElementById("smtp_type_row").style.display = 'none';

    document.getElementById("xoauth2ButtonGroup").style.display = '';
    document.getElementById('xoauth2_user').style.display = '';
    document.getElementById('xoauth2_clientid').style.display = '';
    document.getElementById('xoauth2_clientsecret').style.display = '';
    document.getElementById('xoauth2_type_row').style.display = '';

    document.getElementById("mail_xoauth2user_label").innerHTML = '{/literal}{$MOD.LBL_MAIL_XOAUTH2USER}{literal}';
  }

  if (provider_type == '') {
    provider_type = 'gmail';
  }

  switch(provider_type) {
    case "gmail":
      document.getElementById("mail_xoauth2user_label").innerHTML = '{/literal}{$MOD.LBL_GMAIL_XOAUTH2USER}{literal}';
      break;
    case "exchange":
      document.getElementById("mail_xoauth2user_label").innerHTML = '{/literal}{$MOD.LBL_EXCHANGE_XOAUTH2USER}{literal}';
      break;
  }

}

function changeEmailScreenDisplay(smtptype, clear)
{
  if (clear) {
    document.getElementById("mail_smtpserver").value = '';
    document.getElementById("mail_smtpport").value = '25';
    document.getElementById("mail_smtpauth_req").checked = true;
    document.getElementById("mailsettings1").style.display = '';
    document.getElementById("mailsettings2").style.display = '';
    document.getElementById("mail_smtppass_label").innerHTML = '{/literal}{$MOD.LBL_MAIL_SMTPPASS}{literal}';
    document.getElementById("mail_smtpport_label").innerHTML = '{/literal}{$MOD.LBL_MAIL_SMTPPORT}{literal}';
    document.getElementById("mail_smtpserver_label").innerHTML = '{/literal}{$MOD.LBL_MAIL_SMTPSERVER}{literal}';
    document.getElementById("mail_smtpuser_label").innerHTML = '{/literal}{$MOD.LBL_MAIL_SMTPUSER}{literal}';
    document.getElementById("xoauth2ButtonGroup").style.display = 'none';
    document.getElementById("smtp_type_row").style.display = '';

    document.getElementById("smtpButtonGroup").style.display = '';
    document.getElementById('xoauth2_user').style.display = 'none';
    document.getElementById('xoauth2_clientid').style.display = 'none';
    document.getElementById('xoauth2_clientsecret').style.display = 'none';
    document.getElementById('xoauth2_type_row').style.display = 'none';
  }

  switch (smtptype) {
    case "yahoomail":
      document.getElementById("mail_smtpserver").value = 'smtp.mail.yahoo.com';
      document.getElementById("mail_smtpport").value = '465';
      document.getElementById("mail_smtpauth_req").checked = true;

      var ssl = document.getElementById("mail_smtpssl");
      
      for (var j = 0; j < ssl.options.length; j++) {
        if(ssl.options[j].text == 'SSL') {
          ssl.options[j].selected = true;
          break;
        }
      }
      
      document.getElementById("mailsettings1").style.display = 'none';
      document.getElementById("mailsettings2").style.display = 'none';
      document.getElementById("mail_smtppass_label").innerHTML = '{/literal}{$MOD.LBL_YAHOOMAIL_SMTPPASS}{literal}';
      document.getElementById("mail_smtpuser_label").innerHTML = '{/literal}{$MOD.LBL_YAHOOMAIL_SMTPUSER}{literal}';
      break;
    case "gmail":
      if(
        document.getElementById("mail_smtpserver").value == "" || 
        document.getElementById("mail_smtpserver").value == 'smtp.mail.yahoo.com'
      ) {
        document.getElementById("mail_smtpserver").value = 'smtp.gmail.com';
        document.getElementById("mail_smtpport").value = '587';
        document.getElementById("mail_smtpauth_req").checked = true;
        var ssl = document.getElementById("mail_smtpssl");
        for (var j = 0; j < ssl.options.length; j++) {
          if (ssl.options[j].text == 'TLS') {
            ssl.options[j].selected = true;
            break;
          }
        }
      }
      //document.getElementById("mailsettings1").style.display = 'none';
      //document.getElementById("mailsettings2").style.display = 'none';
      document.getElementById("mail_smtppass_label").innerHTML = '{/literal}{$MOD.LBL_GMAIL_SMTPPASS}{literal}';
      document.getElementById("mail_smtpuser_label").innerHTML = '{/literal}{$MOD.LBL_GMAIL_SMTPUSER}{literal}';
      break;
    case "exchange":
      if ( 
        document.getElementById("mail_smtpserver").value == 'smtp.mail.yahoo.com' || 
        document.getElementById("mail_smtpserver").value == 'smtp.gmail.com'
      ) {
          document.getElementById("mail_smtpserver").value = '';
      }
      //document.getElementById("mail_smtpport").value = '25';
      //document.getElementById("mail_smtpauth_req").checked = true; bug 40998
      document.getElementById("mailsettings1").style.display = '';
      document.getElementById("mailsettings2").style.display = '';
      document.getElementById("mail_smtppass_label").innerHTML = '{/literal}{$MOD.LBL_EXCHANGE_SMTPPASS}{literal}';
      document.getElementById("mail_smtpport_label").innerHTML = '{/literal}{$MOD.LBL_EXCHANGE_SMTPPORT}{literal}';
      document.getElementById("mail_smtpserver_label").innerHTML = '{/literal}{$MOD.LBL_EXCHANGE_SMTPSERVER}{literal}';
      document.getElementById("mail_smtpuser_label").innerHTML = '{/literal}{$MOD.LBL_EXCHANGE_SMTPUSER}{literal}';
      break;
  }
  setDefaultSMTPPort();
  notify_setrequired(document.ConfigureSettings);
}
var oButtonGroup = new YAHOO.widget.ButtonGroup("smtpButtonGroup");
oButtonGroup.subscribe('checkedButtonChange', function(e)
{
  changeEmailScreenDisplay(e.newValue.get('value'), true);
  document.getElementById('smtp_settings').style.display = '';
  document.getElementById('EditView').mail_smtptype.value = e.newValue.get('value');
});

var oButtonGroupOAuth = new YAHOO.widget.ButtonGroup("xoauth2ButtonGroup");
oButtonGroupOAuth.subscribe('checkedButtonChange', function(e)
{
  changeEmailScreenDisplayXoauth2(e.newValue.get('value'), true);
  document.getElementById('smtp_settings').style.display = '';
  document.getElementById('EditView').mail_xoauth2type.value = e.newValue.get('value');
});

YAHOO.widget.Button.addHiddenFieldsToForm(document.ConfigureSettings);
if (window.addEventListener) {
  window.addEventListener("load", function() { SUGAR.util.setEmailPasswordDisplay('mail_smtppass', {/literal}{$mail_haspass}{literal}); }, false);
} else {
  window.attachEvent("onload", function() { SUGAR.util.setEmailPasswordDisplay('mail_smtppass', {/literal}{$mail_haspass}{literal}); });
}


function testOutboundSettings()
  {
    if (document.getElementById('mail_sendtype').value == 'sendmail') {
      testOutboundSettingsDialog();
      return;
    }
    
    var errorMessage = '';
    var isError = false;
    var fromAddress = document.getElementById("outboundtest_from_address").value;
    var errorMessage = '';
    var isError = false;
    var mail_connection_type  = document.querySelector('input[name=mail_connection_type]:checked').value;
    var smtpServer = document.getElementById('mail_smtpserver').value;
    var smtpPort = document.getElementById('mail_smtpport').value;
    var smtpssl  = document.getElementById('mail_smtpssl').value;
    var mailsmtpauthreq = document.getElementById('mail_smtpauth_req');

    if(trim(smtpServer) == '' && mail_connection_type !== 'xoauth2') {
      isError = true;
      errorMessage += "{/literal}{$APP.LBL_EMAIL_ACCOUNTS_SMTPSERVER}{literal}" + "<br/>";
    }
    
    if(trim(smtpPort) == '') {
      isError = true;
      errorMessage += "{/literal}{$APP.LBL_EMAIL_ACCOUNTS_SMTPPORT}{literal}" + "<br/>";
    }
    
    if(mailsmtpauthreq.checked) {
      if(trim(document.getElementById('mail_smtpuser').value) == '') {
        isError = true;
        errorMessage += "{/literal}{$APP.LBL_EMAIL_ACCOUNTS_SMTPUSER}{literal}" + "<br/>";
      }
    }
    
    if(isError) {
      overlay("{/literal}{$APP.ERR_MISSING_REQUIRED_FIELDS}{literal}", errorMessage, 'alert');
      return false;
    }

    testOutboundSettingsDialog();
  }

  function sendTestEmail()
  {
    var toAddress = document.getElementById("outboundtest_from_address").value;
    var fromAddress = document.getElementById("notify_fromaddress").value;
    if (trim(toAddress) == "") {
      overlay(
        "{/literal}{$APP.ERR_MISSING_REQUIRED_FIELDS}{literal}", 
        "{/literal}{$APP.LBL_EMAIL_SETTINGS_FROM_TO_EMAIL_ADDR}{literal}", 
        'alert'
      );
      return;
    } else if (!isValidEmail(toAddress)) {
      overlay(
        "{/literal}{$APP.ERR_INVALID_REQUIRED_FIELDS}{literal}", 
        "{/literal}{$APP.LBL_EMAIL_SETTINGS_FROM_TO_EMAIL_ADDR}{literal}", 
        'alert'
      );
      return;
    }

    if (trim(fromAddress) == "") {
      overlay(
        "{/literal}{$APP.ERR_MISSING_REQUIRED_FIELDS}{literal}", 
        "{/literal}{$APP.LBL_EMAIL_SETTINGS_FROM_ADDR}{literal}", 
        'alert'
      );
      return;
    } else if (!isValidEmail(fromAddress)) {
      overlay(
        "{/literal}{$APP.ERR_INVALID_REQUIRED_FIELDS}{literal}", 
        "{/literal}{$APP.LBL_EMAIL_SETTINGS_FROM_ADDR}{literal}", 
        'alert'
      );
      return;
    }
    //Hide the email address window and show a message notifying the user that the test email is being sent.
    testOutboundDialog.hide();
    overlay("{/literal}{$APP.LBL_EMAIL_PERFORMING_TASK}{literal}", "{/literal}{$APP.LBL_EMAIL_ONE_MOMENT}{literal}", 'alert');

    var callbackOutboundTest = {
      success	: function(o) {
        hideOverlay();
        var responseObject = YAHOO.lang.JSON.parse(o.responseText);
        if (responseObject.status) {
          overlay(
            "{/literal}{$APP.LBL_EMAIL_TEST_OUTBOUND_SETTINGS}{literal}", 
            "{/literal}{$APP.LBL_EMAIL_TEST_NOTIFICATION_SENT}{literal}", 
            'alert'
          );
        } else {
          overlay(
            "{/literal}{$APP.LBL_EMAIL_TEST_OUTBOUND_SETTINGS}{literal}", 
            responseObject.errorMessage, 
            'alert'
          );
        }
      }
    };

    var smtpServer = document.getElementById('mail_smtpserver').value;
    var smtpPort = document.getElementById('mail_smtpport').value;
    var smtpssl  = document.getElementById('mail_smtpssl').value;
    var mailsmtpauthreq = document.getElementById('mail_smtpauth_req');
    var mail_sendtype = document.getElementById('mail_sendtype').value;
    var from_name = document.getElementById('notify_fromname').value;
    var mail_connection_type  = document.querySelector('input[name=mail_connection_type]:checked').value;
    var mail_xoauth2type  = document.querySelector('input[name=mail_xoauth2type]:checked').value;
    var mail_xoauth2user  = document.getElementById('mail_xoauth2user').value;
    var mail_xoauth2clientid  = document.getElementById('mail_xoauth2clientid').value;
    var mail_xoauth2clientsecret  = document.getElementById('mail_xoauth2clientsecret').value;
    var mail_xoauth2_token  = document.getElementById('mail_xoauth2_token').value;

    var postDataString = 'mail_type=system&mail_sendtype=' + mail_sendtype
      + '&mail_smtpserver=' + smtpServer
      + "&mail_smtpport=" + smtpPort
      + "&mail_smtpssl=" + smtpssl
      + "&mail_smtpauth_req=" + mailsmtpauthreq.checked
      + "&mail_smtpuser=" + trim(document.getElementById('mail_smtpuser').value)
      + "&mail_smtppass=" + trim(document.getElementById('mail_smtppass').value)
      + "&outboundtest_to_address=" + encodeURIComponent(toAddress)
      + "&outboundtest_from_address=" + fromAddress
      + "&mail_connection_type=" + mail_connection_type
      + "&mail_xoauth2type=" + mail_xoauth2type
      + "&mail_xoauth2user=" + mail_xoauth2user
      + "&mail_xoauth2clientid=" + mail_xoauth2clientid
      + "&mail_xoauth2clientsecret=" + mail_xoauth2clientsecret
      + "&mail_xoauth2_token=" + mail_xoauth2_token
      + "&mail_from_name=" + from_name;

    YAHOO.util.Connect.asyncRequest(
      "POST", 
      "index.php?action=testOutboundEmail&module=EmailMan&to_pdf=true&sugar_body_only=true", 
      callbackOutboundTest, 
      postDataString
    );
  }
  function testOutboundSettingsDialog() {
    // lazy load dialogue
    if(!testOutboundDialog) {
      testOutboundDialog = new YAHOO.widget.Dialog(
        "testOutboundDialog", {
          modal:true,
          visible:true,
          fixedcenter:true,
          constraintoviewport: true,
          width	: 600,
          shadow	: false
        }
      );
      testOutboundDialog.setHeader("{/literal}{$APP.LBL_EMAIL_TEST_OUTBOUND_SETTINGS}{literal}");
      YAHOO.util.Dom.removeClass("testOutboundDialog", "yui-hidden");
    } // end lazy load

    testOutboundDialog.render();
    testOutboundDialog.show();
  } // fn

  function overlay(reqtitle, body, type) {
    var config = { };
    config.type = type;
    config.title = reqtitle;
    config.msg = body;
    YAHOO.SUGAR.MessageBox.show(config);
  }

  function hideOverlay() {
    YAHOO.SUGAR.MessageBox.hide();
  }

{/literal}

{if !empty($mail_xoauth2type)}
  {literal}
    changeEmailScreenDisplayXoauth2("{/literal}{$mail_xoauth2type}{literal}", false);
  {/literal}
{/if}

{if !empty($mail_smtptype)}
  {literal}
    changeEmailScreenDisplay("{/literal}{$mail_smtptype}{literal}", false);
  {/literal}
{/if}

{if !empty($mail_connection_type)}
  {literal}
    changeConnectionType("{/literal}{$mail_connection_type}{literal}", false);
  {/literal}
{/if}

{literal}
-->
</script>
{/literal}