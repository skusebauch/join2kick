const initStar = () => {
  const starClass = document.querySelectorAll(".fa fa-star");
  if (starClass != undefined) {
    starClass.forEach(filter => {
      filter.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("active-star");
      });
    });
  }
}


export { initStar }

