<div id="testOutboundDialog" class="yui-hidden">
    <div id="testOutbound">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="edit view">
            <tr>
                <td scope="row">
                    {$APP.LBL_EMAIL_SETTINGS_FROM_TO_EMAIL_ADDR}
                    <span class="required">
              {$APP.LBL_REQUIRED_SYMBOL}
            </span>
                </td>
                <td>
                    <input type="text" id="outboundtest_from_address" name="outboundtest_from_address" size="35"
                           maxlength="64" value="{$CURRENT_USER_EMAIL}">
                </td>
            </tr>
            <tr>
                <td scope="row" colspan="2">
                    <input type="button" class="button" value="   {$APP.LBL_EMAIL_SEND}   "
                           onclick="javascript:sendTestEmail();">&nbsp;
                    <input type="button" class="button" value="   {$APP.LBL_CANCEL_BUTTON_LABEL}   "
                           onclick="javascript:EmailMan.testOutboundDialog.hide();">&nbsp;
                </td>
            </tr>

        </table>
    </div>
</div>