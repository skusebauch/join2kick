const initFilter = () => {
  const playerClass = document.querySelector(".filter-player");
  if (playerClass != undefined) {
    playerClass.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("active");
   });
  }
}

export { initFilter }
