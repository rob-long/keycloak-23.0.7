<#macro kw component="button" rest...>
  <${component}
    class="qa--login__btn o--btn--primary o--btn--lg o--btn--block"
    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
