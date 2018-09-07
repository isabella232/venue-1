// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require mui
//= require siema/dist/siema.min.js
//= require izitoast/dist/js/iziToast.min.js
//= require_tree .



const initiateSlider = (selector) => {
    App.slider = new Siema({
        selector: selector,
        duration: 2,
        easing: 'ease-out',
        perPage: 1,
        startIndex: 0,
        draggable: true,
        multipleDrag: true,
        threshold: 20,
        loop: true,
        rtl: false,
        onInit: () => { },
        onChange: () => { },
    });

    const prev = document.querySelector('.prev');
    const next = document.querySelector('.next');
    prev.addEventListener('click', () => App.slider.prev());
    next.addEventListener('click', () => App.slider.next());
}

const showPartialAsModal = (html, dimensions) => {
    let modalEl = document.createElement('div');
    modalEl.style.width = dimensions.width;
    modalEl.style.height = dimensions.height;
    modalEl.style.margin = '60px auto';
    modalEl.style.padding = '20px 20px';
    modalEl.style.backgroundColor = '#293239';
    modalEl.innerHTML = html;

    mui.overlay('on', modalEl, {
        static: true
    });
}

const cancelModal = (event) => {
    event.preventDefault();
    mui.overlay('off');
}


const showToast = (key, value, options) => {
    let position = options.position || 'bottomLeft'
    let target = options.target || ''
    iziToast.show({
        title: key,
        message: value,
        position: position,
        theme: 'dark',
        backgroundColor: '#293239',
        zindex: 9999,
        target: target
    })
}

document.addEventListener('turbolinks:load', () => {
    let slider = document.querySelector('.carousel');
    if (slider) {
        initiateSlider('.carousel-inner')
    };

})
