const initAgeRange = () => {
  const inputAge = document.querySelector('.age-selector');
  const agePreview = document.querySelector('.age');
  agePreview.innerText = inputAge.value;
  inputAge.addEventListener('input', () => {
    agePreview.innerText = inputAge.value;
  });
}

export { initAgeRange };
