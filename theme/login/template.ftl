<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
  <div class="${properties.kcLoginClass!}">
    <div id="kc-header" class="${properties.kcHeaderClass!}">
      <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">
        <div class="row">
          <div class="col-md-12">
            <div class="kc-logo-text">
              <img src="${url.resourcesPath}/img/logo.svg" alt="${msg("loginTitleHtml",(realm.displayName!''))?no_esc}" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <section class="row-fluid" id="main">
      <div class="container">
        <div class="${properties.kcFormCardClass!} <#if displayWide>${properties.kcFormCardAccountClass!}</#if>">
          <header class="${properties.kcFormHeaderClass!}">
            <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <div id="kc-locale">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div class="kc-dropdown" id="kc-locale-dropdown">
                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                            <ul>
                                <#list locale.supported as l>
                                    <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>
            <h1 id="kc-page-title"><#nested "header"></h1>
          </header>
          <div id="kc-content">
            <div id="kc-content-wrapper">

              <#if displayMessage && message?has_content>
                  <div class="alert alert-${message.type}">
                      <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                      <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                      <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                      <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                      <span class="kc-feedback-text">${message.summary?no_esc}</span>
                  </div>
              </#if>

              <#nested "form">

              <#if displayInfo>
                  <div id="kc-info" class="${properties.kcSignUpClass!}">
                      <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                          <#nested "info">
                      </div>
                  </div>
              </#if>
            </div>
          </div>
        </div>

      </section>
      <footer class="row-fluid" id="footer">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <h3>Project Partners</h3>
              <div class="row">
                <div class="col-md-6">
                  <ul>
                    <li><a href="http://fennerschool.anu.edu.au/" target="_blank" title="Fennel School, ANU">Fennel School, ANU</a></li>
                    <li><a href="https://www.ala.org.au/" target="_blank" title="Atlas of Living Australia">Atlas of Living Australia</a></li>
                    <li><a href="http://www.plantphenomics.org.au/" target="_blank" title="Australian Plant Phenomics Facility">Australian Plant Phenomics Facility</a></li>
                    <li><a href="https://www.csiro.au/en/Research/LWF" target="_blank" title="CSIRO Land and Water">CSIRO Land and Water</a></li>
                    <li><a href="https://www.griffith.edu.au/" target="_blank" title="Griffith University">Griffith University</a></li>
                    <li><a href="http://www.bccvl.org.au/" target="_blank" title="BCCVL">BCCVL</li></a></li>
                  </ul>
                </div>
                <div class="col-md-6">
                  <ul>
                    <li><a href="http://www.agriculture.gov.au/abares" target="_blank" title="Department of Agriculture, ABARES">Department of Agriculture, ABARES</a></li>
                    <li><a href="http://www.environment.gov.au/" target="_blank" title="Department of the Environment and Energy">Department of the Environment and Energy</a></li>
                    <li><a href="https://www.ersa.edu.au/" target="_blank" title="eRSA">eRSA</a></li>
                    <li><a href="http://www.tern.org.au/" target="_blank" title="TERN">TERN</a></li>
                    <li><a href="https://www.qcif.edu.au/" target="_blank" title="QCIF">QCIF</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <h3>Funded By</h3>
              <ul>
                <li><a href="https://www.ands.org.au/about-us/ands-nectar-rds" target="_blank" title="The ANDS, Nectar and RDS partnership">The ANDS, Nectar and RDS partnership</a></li>
              </ul>
            </div>
            <div class="col-md-3">
              <h3>Tutorials &amp; Support</h3>
              <p>Browse our support articles and join our community at <a href="http://support.ecocloud.org.au/" target="_blank" title="Visit ecocloud helpdesk">support.ecocloud.org.au</a></p>
            </div>
          </div>
        </div>
      </footer>

      
    </div>
  </div>
</body>
</html>
</#macro>
