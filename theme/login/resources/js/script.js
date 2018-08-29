
function setupLoginPage() {
    // Pick up if we're on the login page; if so, then we enable the hiding of
    // the local account sign in section behind a button
    var loginForm = document.getElementById("kc-form-login");
    var localAccountLoginToggleArea = document.getElementById("local-account-toggle-area");

    // Stop if there is no local login form
    if (!loginForm || !localAccountLoginToggleArea) {
        return;
    }

    // Show toggle button and attach toggle click handler
    var toggleLink = localAccountLoginToggleArea.querySelector("a.local-account");
    
    if (!toggleLink) {
        return;
    }
    
    localAccountLoginToggleArea.style.display = "";

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

    // Hide the form by default now
    toggleFormVisibility();
}









// Must wait for document ready for anything that will interact with the DOM
document.addEventListener("DOMContentLoaded", function() {
    // Start applying stuff
    setupLoginPage();
});
