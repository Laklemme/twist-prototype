const initFlickity = () => {
  const elem = document.querySelector('.main-carousel');
  if (elem) {
    var flkty = new Flickity(elem, {
      // options
      draggable: true,
      cellAlign: 'center',
      contain: true
    });
  }
};

export { initFlickity };
