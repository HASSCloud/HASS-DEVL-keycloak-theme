<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(false); section>
    <#if section = "header">
    <div class="text-center">${msg("loginTitle")}</div>
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
        <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormAccountContentClass!} ${properties.kcFormAccountClass!}"</#if>>
            <div class="login-via login-via-uni-id">
                <div class="${properties.loginViaFormContainerClass!}">
                    <h2>${msg("loginViaUniId")}</h2>

                    <#if realm.password && social.providers??>
                        <div id="kc-social-providers" class="text-left ${properties.kcFormSocialAccountClass!}">
                            <ul class="${properties.kcFormSocialAccountListClass!}">
                                <#list social.providers as p>
                                    <#-- We only render AAF here -->
                                    <#if p.alias = "aaf">
                                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="${p.alias}" class="zocial ${p.providerId}"> <span>Sign in with ${p.displayName}</span></a></li>
                                    </#if>
                                </#list>
                            </ul>
                        </div>
                    </#if>
                </div>
            </div>

            <div class="login-via login-via-other">
                <div class="${properties.loginViaFormContainerClass!}">
                    <h2>${msg("loginViaOther")}</h2>
                    <#if realm.password>
                        <div id="login-via-login-links" class="identity-providers text-left">
                            <ul class="${properties.kcFormSocialAccountListClass!}">
                                <#if realm.password && social.providers??>
                                    <#list social.providers as p>
                                        <#-- Note that we filter out AAF which is rendered above -->
                                        <#if p.alias != "aaf">
                                            <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="${p.alias}" class="zocial ${p.providerId}"> <span>Sign in with ${p.displayName}</span></a></li>
                                        </#if>
                                    </#list>
                                </#if>
                                <li id="local-account-link-entry" class="${properties.kcFormSocialAccountListLinkClass!}" style="display: none;">
                                    <a href="#" class="local-account"><span>Sign in with <em>ecocloud</em></span></a>
                                </li>
                            </ul>
                        </div>
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <h2>${properties.kcFormLocalAccountTitle!}</h2>
                            <div class="${properties.kcFormGroupClass!}">
                                <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                                <#if usernameEditDisabled??>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                                <#else>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                                </#if>
                            </div>

                            <div class="${properties.kcFormGroupClass!}">
                                <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                                <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                            </div>

                            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                <div id="kc-form-options">
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="checkbox">
                                            <label>
                                                <#if login.rememberMe??>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                                <#else>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                                </#if>
                                            </label>
                                        </div>
                                    </#if>
                                    <div class="${properties.kcFormOptionsWrapperClass!}">
                                        <#if realm.resetPasswordAllowed>
                                            <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                        </#if>
                                    </div>
                                </div>
                            </div>

                            <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                <button tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit">${msg("doLogIn")} <i class="fa fa-chevron-circle-right"></i></button>
                            </div>
                        </form>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration" class="text-center">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
