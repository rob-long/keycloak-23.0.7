<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/label/username.ftl" as labelUsername>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
  displayInfo=true
  showForgotPassword=false
  displayMessage=!messagesPerField.existsError("username");
  section
>
  <#if section="header">
    ${msg("emailForgotTitle")}
  <#elseif section="info">
    ${msg("emailInstruction")}  
  <#elseif section="form">
    <form action="${url.loginAction}" method="post">
      <div class="o--formWrapper--lg">
        <@inputPrimary.kw
          autocomplete=realm.loginWithEmailAllowed?string("email", "username")
          autofocus=true
          invalid=["username"]
          name="username"
          type="text"
          value=(auth?has_content && auth.showUsername())?then(auth.attemptedUsername, '')
        >
          <@labelUsername.kw />
        </@inputPrimary.kw>
      </div>
      <div class="o--formSubmit">
        <@buttonPrimary.kw type="submit">
          Send Email
        </@buttonPrimary.kw>
      </div>
    </form>
  <#elseif section="nav">
    Already have an account?
    <@linkSecondary.kw href=url.loginRestartFlowUrl>
      <span class="text-sm">${kcSanitize(msg("loginAccountTitle"))?no_esc}</span>
    </@linkSecondary.kw>   
  </#if>
</@layout.registrationLayout>