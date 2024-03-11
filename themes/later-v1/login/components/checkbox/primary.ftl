<#macro kw name checked=false rest...>
  <div class="o--form__checkbox u--p__t">
    <input
      <#if checked>checked</#if>
      id="${name}"
      name="${name}"
      type="checkbox"
      <#list rest as attrName, attrValue>
        ${attrName}="${attrValue}"
      </#list>
    >
    <label for="${name}">
      <#nested>
    </label>
  </div>
</#macro>
