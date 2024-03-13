<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
      ${msg("doLogIn")}
    <#elseif section = "header">
      <div id="kc-username" class="${properties.kcFormGroupClass!}">
        <label id="kc-attempted-username">${auth.attemptedUsername}</label>
        <a id="reset-login" href="${url.loginRestartFlowUrl}" aria-label="${msg("restartLoginTooltip")}">
          <div class="kc-login-tooltip">
            <i class="${properties.kcResetFlowIcon!}"></i>
            <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
          </div>
        </a>
      </div>
    <#elseif section = "form">
      <p class="u--m__b__lg">We’ve sent a verification code to your email.</p>
      <form id="kc-otp-login-form" action="${url.loginAction}" method="post">
        <div class="o--formWrapper--lg">
          <label for="otp">${msg("loginOtpOneTime")}</label>
          <input id="otp" name="otp" autocomplete="off" type="text" class="o--form__input" autofocus aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>" placeholder="${msg("loginOtpOneTime")}"/>
          <#if messagesPerField.existsError('totp')>
            <span id="input-error-otp-code" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">${kcSanitize(messagesPerField.get('totp'))?no_esc}</span>
          </#if>
        </div>
        <div class="${properties.kcFormGroupClass!}">
          <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
            <div class="${properties.kcFormOptionsWrapperClass!}">
            </div>
          </div>
          <div id="kc-form-buttons" class="u--row u--m__t__lg">
            <div class="u--row--column u--m__r__xs">
              <input class="o--btn--lg o--btn--outline" name="resend" id="kc-resend" type="submit" value="${msg("doResend")}" />
            </div>
            <div class="u--row--column u--m__l__xs">
              <input class="o--btn--lg o--btn--primary" name="submit" id="kc-submit" type="submit" value="${msg("doSubmit")}" />
            </div>
          </div>

        </div>

      </form>
    </#if>
</@layout.registrationLayout>