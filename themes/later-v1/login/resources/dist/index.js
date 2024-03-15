console.log('analytics.js loaded');

!function(){var i="analytics",analytics=window[i]=window[i]||[];if(!analytics.initialize)if(analytics.invoked)window.console&&console.error&&console.error("Segment snippet included twice.");else{analytics.invoked=!0;analytics.methods=["trackSubmit","trackClick","trackLink","trackForm","pageview","identify","reset","group","track","ready","alias","debug","page","screen","once","off","on","addSourceMiddleware","addIntegrationMiddleware","setAnonymousId","addDestinationMiddleware","register"];analytics.factory=function(e){return function(){if(window[i].initialized)return window[i][e].apply(window[i],arguments);var n=Array.prototype.slice.call(arguments);if(["track","screen","alias","group","page","identify"].indexOf(e)>-1){var c=document.querySelector("link[rel='canonical']");n.push({__t:"bpc",c:c&&c.getAttribute("href")||void 0,p:location.pathname,u:location.href,s:location.search,t:document.title,r:document.referrer})}n.unshift(e);analytics.push(n);return analytics}};for(var n=0;n<analytics.methods.length;n++){var key=analytics.methods[n];analytics[key]=analytics.factory(key)}analytics.load=function(key,n){var t=document.createElement("script");t.type="text/javascript";t.async=!0;t.setAttribute("data-global-segment-analytics-key",i);t.src="https://cdn.segment.com/analytics.js/v1/" + key + "/analytics.min.js";var r=document.getElementsByTagName("script")[0];r.parentNode.insertBefore(t,r);analytics._loadOptions=n};analytics._writeKey="rjo2ZXgRv6IaA4B8MKXd92cLlgopFVMM";;analytics.SNIPPET_VERSION="5.2.0";
analytics.load("rjo2ZXgRv6IaA4B8MKXd92cLlgopFVMM");
analytics.page();

}}();

const loginButtonId = 'loginButton';
const googleRedirect = document.getElementById(loginButtonId);
if (googleRedirect) {
  googleRedirect.addEventListener('click', function(event) {
    console.log('button clicked');
    analytics.track('keycloak-clicked-login');
  });
}

const urlParams = new URLSearchParams(window.location.search);
const utmSource = urlParams.get('utm_source');
console.log('utmSource', utmSource);

const utmToSelector = {
  campaign: '.tLK--card--campaign',
  mavrck: '.tLK--card--campaign',
  featured: '.tLK--card--featured',
  'linkin.bio': '.tLK--card--testimonial',
  'linkinbio': '.tLK--card--testimonial',
  contributor: '.tLK--card--invite',
  invite: '.tLK--card--invite'
};

const element = document.querySelector(utmToSelector[utmSource]);
if (element) {
  element.classList.remove('u--hide');
} else {
  const defaultElement = document.querySelector(utmToSelector['featured']);
  if (defaultElement) {
    defaultElement.classList.remove('u--hide');
  }
}

if (utmSource === 'campaign' || utmSource === 'mavrck') {
  const campaignElement = document.querySelector('#mavrck-welcome');
  if (campaignElement) {
    campaignElement.classList.remove('u--hide');
  }
}
