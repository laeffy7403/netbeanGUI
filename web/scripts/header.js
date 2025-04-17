document.querySelectorAll(".has-dropdown").forEach((menu) => {
    menu.addEventListener("mouseenter", () => {
        let dropdown = menu.querySelector(".dropdown");
        dropdown.classList.add("visible");
    });

    menu.addEventListener("mouseleave", () => {
        let dropdown = menu.querySelector(".dropdown");
        dropdown.classList.remove("visible");
    });
});

function initializeHeader() {
    const searchIcon = document.querySelector(".search-icon");
    const searchDropdown = document.querySelector(".search-dropdown");
    const searchInput = document.querySelector(".search-input");

    console.log("Search Icon:", searchIcon);
    console.log("Search Dropdown:", searchDropdown);
    console.log("Search Input:", searchInput);

    if (!searchIcon || !searchDropdown || !searchInput) {
        console.error("One or more elements not found!");
        return;
    }

    // Show the search dropdown on click
    searchIcon.addEventListener("click", function (e) {
        e.stopPropagation();
        searchDropdown.classList.toggle("visible");
        console.log("Toggled visible class on searchDropdown:", searchDropdown.classList.contains("visible"));

        if (searchDropdown.classList.contains("visible")) {
            searchInput.focus(); // Focus on the input when dropdown is shown
            console.log("Focused on search input");
        }
    });

    // Hide the search dropdown when clicking outside
    document.addEventListener("click", function (e) {
        if (!searchDropdown.contains(e.target) && e.target !== searchIcon) {
            searchDropdown.classList.remove("visible");
            console.log("Removed visible class from searchDropdown");
        }
    });
}

// Automatically initialize if the script is loaded directly (not dynamically)
if (document.readyState === "complete" || document.readyState === "interactive") {
    initializeHeader();
} else {
    document.addEventListener("DOMContentLoaded", initializeHeader);
}