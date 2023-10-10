/**
 * 
 */

const profileContainer = document.querySelector(".profile");
const profileImage = document.querySelector(".profile-img");
const profileDetails = document.querySelector(".popup");

console.log(profileDetails);

profileImage.addEventListener("mouseenter", () => {
	profileDetails.style.display = "block";
});
profileDetails.addEventListener("mouseenter", () => {
	profileDetails.style.display = "block";
});

profileImage.addEventListener("mouseleave", () => {
	profileDetails.style.display = "none";
});
profileDetails.addEventListener("mouseleave", () => {
	profileDetails.style.display = "none";
});
