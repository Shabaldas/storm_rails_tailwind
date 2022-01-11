document.addEventListener('DOMContentLoaded', () => {
	const sidebar = document.querySelector(".sidebar");
	const dropdownContent = document.querySelector("#dropdown-menu")

	document.body.addEventListener("click", (e) => {
		if (e.target.closest(".mobile-menu-button")) {
			sidebar.classList.toggle("-translate-x-full");
			document.body.style.overflow = "hidden";
		} else if (e.target.closest(".close-btn")) {
			sidebar.classList.toggle("-translate-x-full");
			document.body.style.overflow = "visible";
		} else if (e.target.closest(".dropdown-menu-button")) {
			dropdownContent.classList.toggle("hidden")
		}else{
			dropdownContent.classList.toggle("hidden")
		}
	})
})
