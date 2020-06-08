const initFilter = () => {
  const playerClass = document.querySelectorAll(".filter-player");
  if (playerClass != undefined) {
    playerClass.forEach(filter => {
      filter.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("active");
    });
  });

  }
}

export { initFilter }
