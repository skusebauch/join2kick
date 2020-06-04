const initFilter = () => {
  const playerClass = document.querySelector(".filter-player");
  playerClass.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("active");
});
}

export { initFilter }
