
function setupLoginPage() {
    // Pick up if we're on the login page; if so, then we enable the hiding of
    // the local account sign in section behind a button
    var loginForm = document.getElementById("kc-form-login");
    var localAccountLinkEntry = document.getElementById("local-account-link-entry");

    // Stop if there is no local login form
    if (!loginForm || !localAccountLinkEntry) {
        return;
    }

    // Show toggle button and attach toggle click handler
    var toggleLink = localAccountLinkEntry.querySelector("a.local-account");
    
    if (!toggleLink) {
        return;
    }
    
    localAccountLinkEntry.style.display = "";

    var localAccountFormVisible = true;

    function toggleFormVisibility() {
        if (localAccountFormVisible) {
            // Hide form
            loginForm.style.display = "none";
        } else {
            // Show form
            loginForm.style.display = "";
            // Focus on first input element
            var input = loginForm.querySelector("input");
            input && input.focus();
        }

        localAccountFormVisible = !localAccountFormVisible;
    }

    toggleLink.addEventListener("click", function(e) {
        e.preventDefault();
        toggleFormVisibility();
    });

    // Hide the form by default now, if there is no content in the local account
    // login form fields

    /** @type {NodeListOf<HTMLInputElement>} */
    const formFields = loginForm.querySelectorAll("#username, #password");
    for (var i = 0; i < formFields.length; i++) {
        if (formFields[i].value.trim().length > 0) {
            // Jump out of function now
            return;
        }
    }

    toggleFormVisibility();
}

// Must wait for document ready for anything that will interact with the DOM
document.addEventListener("DOMContentLoaded", function() {
    // Start applying stuff
    setupLoginPage();
});
